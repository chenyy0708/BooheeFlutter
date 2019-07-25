// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_tools.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeTools _$HomeToolsFromJson(Map<String, dynamic> json) {
  return HomeTools(
    json['success'] as bool,
    json['msg'] as String,
    (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HomeToolsToJson(HomeTools instance) => <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['id'] as int,
    json['name'] as String,
    json['code'] as String,
    json['visible'] as bool,
    json['editable'] as bool,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'visible': instance.visible,
      'editable': instance.editable,
    };
