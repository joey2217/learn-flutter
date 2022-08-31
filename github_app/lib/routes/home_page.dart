import 'package:flutter/material.dart';
import 'package:github_app/common/github_api.dart';
import 'package:github_app/generated/l10n.dart';
import 'package:github_app/models/index.dart';
import 'package:github_app/states/profile_change_notifier.dart';
import 'package:github_app/widgets/avatar.dart';
import 'package:github_app/widgets/repo_item.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const loadingTag = "##loading##";
  var items = <Repo>[Repo()..name = loadingTag];
  bool hasMore = true;
  int page = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
      ),
      body: _buildBody(),
      drawer: const MyDrawer(),
    );
  }

  Widget _buildBody() {
    var userModel = Provider.of<UserModel>(context);
    if (!userModel.isLogin) {
      return Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed("login");
        },
        child: Text(S.of(context).login),
      ));
    } else {
      return ListView.separated(
          itemBuilder: (context, index) {
            if (items[index].name == loadingTag) {
              if (hasMore) {
                _receiveData();
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                );
              } else {
                return Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    S.of(context).noMore,
                    style: const TextStyle(color: Colors.grey),
                  ),
                );
              }
            }
            return RepoItem(repo: items[index]);
          },
          separatorBuilder: (context, index) => const Divider(
                height: 0,
              ),
          itemCount: items.length);
    }
  }

  void _receiveData() async {
    var list = await GithubApi(context).getRepos(query: {
      'page': page,
      'page_size': 20,
    });
    hasMore = list.isNotEmpty && list.length % 20 == 0;
    setState(() {
      items.insertAll(items.length - 1, list);
      page++;
    });
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            Expanded(child: _buildMenus()),
          ],
        ),
      ),
    );
  }

  /// 抽屉头
  Widget _buildHeader() {
    return Consumer<UserModel>(
      builder: (BuildContext context, UserModel value, Widget? child) {
        return GestureDetector(
          child: Container(
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ClipOval(
                    child: value.isLogin
                        ? Avatar(
                            value.user!.avatar_url!,
                            width: 80,
                          )
                        : Image.asset(
                            'images/avatar-default.png',
                            width: 80,
                          ),
                  ),
                ),
                Text(
                  value.isLogin ? value.user!.login! : S.of(context).login,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            if (!value.isLogin) {
              Navigator.of(context).pushNamed('login');
            }
          },
        );
      },
    );
  }

  /// 抽屉菜单
  Widget _buildMenus() {
    return Consumer2<UserModel, LocaleModel>(builder: (BuildContext context,
        UserModel userModel, LocaleModel localeModel, Widget? child) {
      var appLocale = S.of(context);
      return ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.color_lens),
            title: Text(appLocale.theme),
            onTap: () {
              Navigator.of(context).pushNamed('theme');
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(appLocale.language),
            onTap: () {
              Navigator.of(context).pushNamed('language');
            },
          ),
          if (userModel.isLogin)
            ListTile(
              leading: const Icon(Icons.power_settings_new),
              title: Text(appLocale.logout),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(appLocale.logoutTip),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // 关闭Dialog
                            Navigator.pop(context);
                          },
                          child: Text(appLocale.cancel),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            userModel.user = null;
                            Navigator.pop(context);
                          },
                          child: Text(appLocale.yes),
                        ),
                      ],
                    );
                  },
                );
              },
            )
        ],
      );
    });
  }
}
