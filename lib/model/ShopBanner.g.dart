// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ShopBanner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopBanner _$ShopBannerFromJson(Map<String, dynamic> json) {
  return ShopBanner(
      (json['banner_showcases'] as List)
          ?.map((e) => e == null
              ? null
              : Banner_showcases.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['shop_modules'] as List)
          ?.map((e) => e == null
              ? null
              : Shop_modules.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['categories'] as List)
          ?.map((e) =>
              e == null ? null : Categories.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ShopBannerToJson(ShopBanner instance) =>
    <String, dynamic>{
      'banner_showcases': instance.bannerShowcases,
      'shop_modules': instance.shopModules,
      'categories': instance.categories
    };

Banner_showcases _$Banner_showcasesFromJson(Map<String, dynamic> json) {
  return Banner_showcases(
      json['id'] as int,
      json['exhibit'] as String,
      json['default_photo_url'] as String,
      json['default_photo_height'] as int,
      json['default_photo_width'] as int,
      json['exhibit_type'] as String,
      json['page_title'] as String);
}

Map<String, dynamic> _$Banner_showcasesToJson(Banner_showcases instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exhibit': instance.exhibit,
      'default_photo_url': instance.defaultPhotoUrl,
      'default_photo_height': instance.defaultPhotoHeight,
      'default_photo_width': instance.defaultPhotoWidth,
      'exhibit_type': instance.exhibitType,
      'page_title': instance.pageTitle
    };

Shop_modules _$Shop_modulesFromJson(Map<String, dynamic> json) {
  return Shop_modules(
      json['position'] as int,
      json['title'] as String,
      json['sub_title'] as String,
      json['picture_url1'] as String,
      json['picture_url2'] as String,
      json['redirect_url'] as String,
      json['display'] as bool,
      json['new_tag'] as String);
}

Map<String, dynamic> _$Shop_modulesToJson(Shop_modules instance) =>
    <String, dynamic>{
      'position': instance.position,
      'title': instance.title,
      'sub_title': instance.subTitle,
      'picture_url1': instance.pictureUrl1,
      'picture_url2': instance.pictureUrl2,
      'redirect_url': instance.redirectUrl,
      'display': instance.display,
      'new_tag': instance.newTag
    };

Categories _$CategoriesFromJson(Map<String, dynamic> json) {
  return Categories(json['id'] as int, json['name'] as String,
      json['description'] as String, json['icon_url'] as String);
}

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'icon_url': instance.iconUrl
    };
