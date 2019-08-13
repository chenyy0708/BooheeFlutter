// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mine_cards.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MineCards _$MineCardsFromJson(Map<String, dynamic> json) {
  return MineCards(
    json['success'] as bool,
    json['msg'] as String,
    (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MineCardsToJson(MineCards instance) => <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['id'] as int,
    json['name'] as String,
    json['icon_url'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon_url': instance.iconUrl,
      'url': instance.url,
    };
