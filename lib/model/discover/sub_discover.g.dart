// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_discover.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubDiscover _$SubDiscoverFromJson(Map<String, dynamic> json) {
  return SubDiscover(
    (json['banners'] as List)
        ?.map((e) =>
            e == null ? null : Banners.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['labels'] as List)
        ?.map((e) =>
            e == null ? null : Labels.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['sections'] as List)
        ?.map((e) =>
            e == null ? null : Sections.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SubDiscoverToJson(SubDiscover instance) =>
    <String, dynamic>{
      'banners': instance.banners,
      'labels': instance.labels,
      'sections': instance.sections,
    };

Banners _$BannersFromJson(Map<String, dynamic> json) {
  return Banners(
    json['id'] as int,
    json['title'] as String,
    json['link'] as String,
    json['pic_url'] as String,
  );
}

Map<String, dynamic> _$BannersToJson(Banners instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'link': instance.link,
      'pic_url': instance.picUrl,
    };

Labels _$LabelsFromJson(Map<String, dynamic> json) {
  return Labels(
    json['title'] as String,
    json['url'] as String,
    json['pic_url'] as String,
  );
}

Map<String, dynamic> _$LabelsToJson(Labels instance) => <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'pic_url': instance.picUrl,
    };

Sections _$SectionsFromJson(Map<String, dynamic> json) {
  return Sections(
    json['name'] as String,
    (json['sub_contents'] as List)
        ?.map((e) =>
            e == null ? null : Sub_contents.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SectionsToJson(Sections instance) => <String, dynamic>{
      'name': instance.name,
      'sub_contents': instance.subContents,
    };

Sub_contents _$Sub_contentsFromJson(Map<String, dynamic> json) {
  return Sub_contents(
    json['title'] as String,
    json['sub_title'] as String,
    json['img_url'] as String,
    json['redirect_url'] as String,
  );
}

Map<String, dynamic> _$Sub_contentsToJson(Sub_contents instance) =>
    <String, dynamic>{
      'title': instance.title,
      'sub_title': instance.subTitle,
      'img_url': instance.imgUrl,
      'redirect_url': instance.redirectUrl,
    };
