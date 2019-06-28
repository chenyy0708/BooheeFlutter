// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gank_entriy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GankEntriy _$GankEntriyFromJson(Map<String, dynamic> json) {
  return GankEntriy(
      json['error'] as bool,
      (json['results'] as List)
          ?.map((e) =>
              e == null ? null : Results.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$GankEntriyToJson(GankEntriy instance) =>
    <String, dynamic>{'error': instance.error, 'results': instance.results};

Results _$ResultsFromJson(Map<String, dynamic> json) {
  return Results(
      json['createdAt'] as String,
      json['desc'] as String,
      (json['images'] as List)?.map((e) => e as String)?.toList(),
      json['publishedAt'] as String,
      json['source'] as String,
      json['type'] as String,
      json['url'] as String,
      json['used'] as bool,
      json['who'] as String);
}

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'desc': instance.desc,
      'images': instance.images,
      'publishedAt': instance.publishedAt,
      'source': instance.source,
      'type': instance.type,
      'url': instance.url,
      'used': instance.used,
      'who': instance.who
    };
