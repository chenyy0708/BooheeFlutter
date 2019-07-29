// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_ad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SplashAd _$SplashAdFromJson(Map<String, dynamic> json) {
  return SplashAd(
    json['id'] as int,
    json['start_up_url'] as String,
    json['is_ad'] as bool,
    json['text'] as String,
    json['link'] as String,
  );
}

Map<String, dynamic> _$SplashAdToJson(SplashAd instance) => <String, dynamic>{
      'id': instance.id,
      'start_up_url': instance.startUpUrl,
      'is_ad': instance.isAd,
      'text': instance.text,
      'link': instance.link,
    };
