import 'package:json_annotation/json_annotation.dart';
import 'package:youneciohc/base/exception.dart';

part 'base_model.g.dart';


// flutter clean
// flutter pub cache repair
// flutter pub run build_runner build
// flutter pub run flutter_launcher_icons
// flutter packages pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class IdParam {
  int id;

  IdParam({this.id = 0});

  factory IdParam.fromJson(Map<String, dynamic> json) => _$IdParamFromJson(json);

  Map<String, dynamic> toJson() => _$IdParamToJson(this);
}

@JsonSerializable()
class StringParam {
  String value;

  StringParam({this.value = ""});

  factory StringParam.fromJson(Map<String, dynamic> json) => _$StringParamFromJson(json);

  Map<String, dynamic> toJson() => _$StringParamToJson(this);
}

class BaseReply<T> {
  int code;

  String message;

  BaseReply(this.code, this.message);
}

@JsonSerializable()
class Reply<T> extends BaseReply {
  @_ObjectConverter()
  T result;

  Reply(int code, String message, this.result) : super(code, message);

  factory Reply.fromJson(Map<String, dynamic> json) => _$ReplyFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyToJson(this);
}

@JsonSerializable()
class ListReply<T> extends BaseReply {
  List result;  // FIXME !!!!!!!!!!!!

  ListReply(int code, String message, this.result) : super(code, message);

  factory ListReply.fromJson(Map<String, dynamic> json) => _ListReplyFromJson(json);

  Map<String, dynamic> toJson() => _ListReplyToJson(this);

  List<T> getResult() {
    List<T> casted = [];
    for (int i=0; i<result.length; i++) {
      dynamic r = result[i];
      if (r is T) {
        casted.add(r as T);
      }
    }

    return casted;
  }
}

ListReply<T> _ListReplyFromJson<T>(Map<String, dynamic> json) => ListReply<T>(
  json['code'] as int,
  json['message'] as String,
  _ListConverter<T>().fromJson(json['result'] as Object),
);

Map<String, dynamic> _ListReplyToJson<T>(ListReply<T> instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'result': _ListConverter<T>().toJson(instance.getResult()),
    };



class _ObjectConverter<T> implements JsonConverter<T, Object> {
  const _ObjectConverter();

  // TODO 언젠가 reflection 써서 구현하자.... 아직은 dart 에서 reflection 에 관해 지원되는게 부족하다...
  @override
  T fromJson(Object jsonObj) {
    if (jsonObj is Map<String, dynamic>) {
      T? t = _parseObject<T>(T, jsonObj);
      if (t == null) {
        throw const RuntimeException(message: "파서 구현 안되어 있음. base_model.dart-_parseObject 참조.");
      }

      return t;
    } else if (jsonObj is String) {
      return jsonObj as T;
    }

    throw UnimplementedError();
  }

  @override
  Object toJson(T object) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

class _ListConverter<T> implements JsonConverter<List<T>, Object> {
  const _ListConverter();

  @override
  List<T> fromJson(Object jsonObj) {
    if (jsonObj is List) {
      List<T> result = _parseList<T>(T, jsonObj);

      return result;
    }

    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Object toJson(List<T> object) {
    // TODO: implement toJson
    throw UnimplementedError();
  }


}

// TODO rest 통신 결과로 파싱될 모델을 등록 해야함.
T? _parseObject<T>(Type theType, Map<String, dynamic> map) {
  switch (theType) {
    case String:
      return map.toString() as T;
  }

  return null;
}

List<T> _parseList<T>(Type itemType, List list) {
  List<T> resultList = [];

  for (int i=0; i<list.length; i++) {
    dynamic item = list[i];
    if (item is Map<String, dynamic>) {
      T? obj = _parseObject<T>(itemType, item);

      if (obj != null) {
        resultList.add(obj);
      }
    }
  }

  return resultList;
}

// class Reflector extends Reflectable {
//   const Reflector() : super(invokingCapability, typingCapability, reflectedTypeCapability,
//       typeCapability, staticInvokeCapability, instanceInvokeCapability, declarationsCapability,
//   reflectedTypeCapability);
// }
//
// const reflector = Reflector();


