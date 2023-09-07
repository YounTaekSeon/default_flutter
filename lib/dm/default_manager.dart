import 'dart:async';

import 'package:dio/dio.dart';
import 'package:youneciohc/base/config.dart';
import 'package:youneciohc/base/system_event.dart';
import 'package:youneciohc/models/base_model.dart';
import 'package:youneciohc/preference/preference_helper.dart';
import 'package:youneciohc/utils/app_util.dart';

abstract class SystemEventListener {
  onEvent(SystemEvent event);
}

class DefaultManager {
  final Dio defaultDio;

  static SystemEventListener? _systemEventListener;

  DefaultManager() : defaultDio = Dio() {
    defaultDio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {

        // put access token to header
        String? accessToken = PreferenceHelper.loadAccessToken();
        if (accessToken != null) {
          options.headers["Authorization"] = accessToken;
        }

        AppUtil.printLog("restful SEND: ${options.path}, ${options.data}");
        handler.next(options);
      },
      onResponse: (resp, handler) async {
        AppUtil.printLog("restful RESV: ${resp}");
        handler.next(resp);
      },
    ));
  }

  static setSystemEventListener(SystemEventListener? listener) {
    _systemEventListener = listener;
  }

  Future<T> requestReply<T>(Future<Reply<T>> future) {
    Completer<T> completer = Completer();

    future.then((value) {
      if (value.code == Config.TOKEN_EXPIRED) {
        _systemEventListener?.onEvent(SystemEvent.TOKEN_EXPIRED);
      }

      if (value.code != 200) {
        _systemEventListener?.onEvent(SystemEvent.FAILED_REQUEST);
      }

      _systemEventListener?.onEvent(SystemEvent.SUCCESSFUL);
      completer.complete(value.result);
    }).catchError((e, s) {
      AppUtil.printErrorLog("error: ${e} \n ${s}");
      _systemEventListener?.onEvent(SystemEvent.FAILED_REQUEST);
    });

    return completer.future;
  }

  Future<List<T>> requestReplyList<T>(Future<ListReply<T>> future) {
    Completer<List<T>> completer = Completer();

    future.then((value) {
      if (value.code == Config.TOKEN_EXPIRED) {
        _systemEventListener?.onEvent(SystemEvent.TOKEN_EXPIRED);
      }

      if (value.code != 200) {
        _systemEventListener?.onEvent(SystemEvent.FAILED_REQUEST);
      }

      _systemEventListener?.onEvent(SystemEvent.SUCCESSFUL);
      completer.complete(value.getResult());
    }).catchError((e, s) {
      AppUtil.printErrorLog("error: ${e} \n ${s}");
      _systemEventListener?.onEvent(SystemEvent.FAILED_REQUEST);
    });

    return completer.future;
  }
}