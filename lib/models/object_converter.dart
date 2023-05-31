import 'package:json_annotation/json_annotation.dart';
import 'package:youneciohc/base/exception.dart';

class ObjectConverter<T> implements JsonConverter<T?, Object?> {
  const ObjectConverter();

  // TODO 언젠가 reflection 써서 구현하자.... 아직은 dart 에서 reflection 에 관해 지원되는게 부족하다...
  @override
  T? fromJson(Object? jsonObj) {
    if (jsonObj == null) {
      return null;
    }

    if (jsonObj is Map<String, dynamic>) {
      T? t = _parseObject<T>(T, jsonObj);
      if (t == null) {
        throw RuntimeException(message: "파서 구현 안되어 있음. ==> ${T.toString()}");
      }

      return t;
    } else if (jsonObj is String) {
      return jsonObj as T;
    }

    throw UnimplementedError();
  }

  @override
  Object toJson(T? object) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

class ListConverter<T> implements JsonConverter<List<T>, Object> {
  const ListConverter();

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

Type getType<T>() => T;

final _convertMap = <Type, dynamic Function(Map<String, dynamic>)>{

};


// TODO rest 통신 결과로 파싱될 모델을 등록 해야함.
T? _parseObject<T>(Type theType, Map<String, dynamic> map) {

  if (theType == String || theType == getType<String?>()) {
    return map.toString() as T;
  }

  Function? func = _convertMap[theType];
  T? result = (func != null) ? func.call(map) : null;

  return result;
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