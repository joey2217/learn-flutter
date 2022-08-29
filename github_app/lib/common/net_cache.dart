import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:github_app/common/global.dart';

class CacheObject {
  CacheObject(this.response)
      : timeStamp = DateTime.now().millisecondsSinceEpoch;

  Response response;
  // 缓存创建时间
  int timeStamp;

  // 比对是否同一uri
  @override
  bool operator ==(other) {
    return response.hashCode == other.hashCode;
  }

  //将请求uri作为缓存的key
  @override
  int get hashCode => response.realUri.hashCode;
}

class NetCache extends Interceptor {
  // 为确保迭代器顺序和对象插入时间的顺序一致 <uri, CacheObject>
  LinkedHashMap<String, CacheObject> cache =
      LinkedHashMap<String, CacheObject>();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!Global.profile.cache!.enable!) {
      return handler.next(options);
    }
    bool refresh = options.extra['refresh'] == true;
    if (refresh) {
      if (options.extra["list"] == true) {
        cache.removeWhere((key, value) => key.contains(options.path));
      } else {
        cache.remove(options.uri.toString());
      }
      return handler.next(options);
    }
    if (options.extra["noCache"] != true &&
        options.method.toLowerCase() == "get") {
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      var cacheObject = cache[key];
      if (cacheObject != null) {
        if ((DateTime.now().microsecondsSinceEpoch - cacheObject.timeStamp) /
                1000 <
            Global.profile.cache!.maxAge!) {
          return handler.resolve(cacheObject.response);
        } else {
          cache.remove(key);
        }
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (Global.profile.cache!.enable!) {
      _saveCache(response);
    }
    handler.next(response);
  }

  _saveCache(Response response) {
    var options = response.requestOptions;
    if (options.extra["noCache"] != true &&
        options.method.toLowerCase() == "get") {
      if (cache.length == Global.profile.cache!.maxCount) {
        cache.remove(cache[cache.keys.first]);
      }
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      cache[key] = CacheObject(response);
    }
  }
}
