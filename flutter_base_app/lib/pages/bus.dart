typedef EventCallback = void Function([dynamic arg]);

class EventBus {
  //私有构造函数
  EventBus._internal();

  //保存单例
  static final EventBus _singleton = EventBus._internal();

  //工厂构造函数
  factory EventBus() => _singleton;

  //保存事件订阅者队列，key:事件名(id)，value: 对应事件的订阅者队列
  final _emap = <Object, List<EventCallback>?>{};

  //添加订阅者
  void on(eventName, EventCallback f) {
    _emap[eventName] ??= <EventCallback>[];
    _emap[eventName]?.add(f);
  }

  //移除订阅者
  void off(eventName, [EventCallback? f]) {
    var list = _emap[eventName];
    if (eventName == null || list == null) {
      return;
    }
    if (f == null) {
      _emap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  //触发事件，事件触发后该事件所有订阅者会被调用
  void emit(eventName, [arg]) {
    var list = _emap[eventName];
    if (list == null) {
      return;
    }
    //反向遍历，防止订阅者在回调中移除自身带来的下标错位
    for (var i = list.length - 1; i > -1; i--) {
      list[i](arg);
    }
  }
}

//页面A中
//  //监听登录事件
// bus.on("login", (arg) {
//   // do something
// });

// //登录页B中
// //登录成功后触发登录事件，页面A中订阅者会被调用
// bus.emit("login", userInfo);
