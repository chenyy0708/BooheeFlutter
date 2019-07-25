// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_wall_paper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeWallPaper _$HomeWallPaperFromJson(Map<String, dynamic> json) {
  return HomeWallPaper(
    json['welcome_img'] == null
        ? null
        : Welcome_img.fromJson(json['welcome_img'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HomeWallPaperToJson(HomeWallPaper instance) =>
    <String, dynamic>{
      'welcome_img': instance.welcomeImg,
    };

Welcome_img _$Welcome_imgFromJson(Map<String, dynamic> json) {
  return Welcome_img(
    json['hello_text'] as String,
    json['back_img'] as String,
    json['back_img_small'] as String,
    json['back_img_x'] as String,
    json['video_url'] as String,
    json['link'] as String,
    json['date'] as String,
  );
}

Map<String, dynamic> _$Welcome_imgToJson(Welcome_img instance) =>
    <String, dynamic>{
      'hello_text': instance.helloText,
      'back_img': instance.backImg,
      'back_img_small': instance.backImgSmall,
      'back_img_x': instance.backImgX,
      'video_url': instance.videoUrl,
      'link': instance.link,
      'date': instance.date,
    };
