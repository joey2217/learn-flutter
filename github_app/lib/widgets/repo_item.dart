import 'package:flutter/material.dart';
import 'package:github_app/generated/l10n.dart';
import 'package:github_app/models/index.dart';
import 'package:github_app/widgets/avatar.dart';

class RepoItem extends StatefulWidget {
  final Repo repo;
  RepoItem({required this.repo}) : super(key: ValueKey(repo.id));

  @override
  State<RepoItem> createState() => _RepoItemState();
}

class _RepoItemState extends State<RepoItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Material(
        color: Colors.white,
        shape: BorderDirectional(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 0.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                dense: true,
                leading: Avatar(
                  widget.repo.owner!.avatar_url!,
                  width: 24,
                  borderRadius: BorderRadius.circular(12),
                ),
                title: Text(
                  widget.repo.owner!.login!,
                  textScaleFactor: 0.9,
                ),
                trailing: Text(widget.repo.language ?? ""),
              ),
              // 构建项目标题和简介
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.repo.fork!
                          ? widget.repo.full_name!
                          : widget.repo.name!,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontStyle: widget.repo.fork!
                              ? FontStyle.italic
                              : FontStyle.normal),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 12),
                      child: widget.repo.description == null
                          ? Text(
                              S.of(context).noDescription,
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.grey[700],
                              ),
                            )
                          : Text(
                              widget.repo.description!,
                              maxLines: 3,
                              style: TextStyle(
                                height: 1.15,
                                color: Colors.blueGrey[700],
                                fontSize: 13,
                              ),
                            ),
                    )
                  ],
                ),
              ),
              // 构建卡片底部信息
              _buildBottom(),
            ],
          ),
        ),
      ),
    );
  }

  // 构建卡片底部信息
  Widget _buildBottom() {
    const paddingWidth = 10;
    return IconTheme(
        data: const IconThemeData(
          color: Colors.grey,
          size: 15,
        ),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.grey, fontSize: 12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Builder(
              builder: (BuildContext context) {
                var children = <Widget>[
                  const Icon(Icons.star),
                  Text(
                      " ${widget.repo.stargazers_count.toString().padRight(paddingWidth)}"),
                  const Icon(Icons.info_outline),
                  Text(
                      " ${widget.repo.open_issues_count.toString().padRight(paddingWidth)}"),
                  const Icon(Icons.arrow_downward),
                  Text(widget.repo.forks_count
                      .toString()
                      .padRight(paddingWidth)),
                ];
                if (widget.repo.fork!) {
                  children.add(Text("Forked".padRight(paddingWidth)));
                }
                if (widget.repo.private!) {
                  children.addAll([
                    const Icon(Icons.lock),
                    Text(" private".padRight(paddingWidth)),
                  ]);
                }
                return Row(
                  children: children,
                );
              },
            ),
          ),
        ));
  }
}
