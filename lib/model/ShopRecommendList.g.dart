// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ShopRecommendList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopRecommendList _$ShopRecommendListFromJson(Map<String, dynamic> json) {
  return ShopRecommendList(
      json['id'] as int,
      json['name'] as String,
      json['description'] as String,
      (json['sub_labels'] as List)
          ?.map((e) =>
              e == null ? null : Sub_labels.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['banner_showcases'] as List,
      (json['goods'] as List)
          ?.map((e) =>
              e == null ? null : Goods.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['page'] as int,
      json['total_pages'] as int);
}

Map<String, dynamic> _$ShopRecommendListToJson(ShopRecommendList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'sub_labels': instance.subLabels,
      'banner_showcases': instance.bannerShowcases,
      'goods': instance.goods,
      'page': instance.page,
      'total_pages': instance.totalPages
    };

Sub_labels _$Sub_labelsFromJson(Map<String, dynamic> json) {
  return Sub_labels(json['id'] as int, json['name'] as String);
}

Map<String, dynamic> _$Sub_labelsToJson(Sub_labels instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

Goods _$GoodsFromJson(Map<String, dynamic> json) {
  return Goods(
      json['id'] as int,
      json['title'] as String,
      json['total_quantity'] as int,
      json['category_name'] as String,
      json['thumb_photo_url'] as String,
      json['big_photo_url'] as String,
      json['flag_url'] as String,
      json['flag_name'] as String,
      json['state'] as String,
      json['buy_url'] as String,
      json['has_video_thumb'] as bool,
      json['base_price'] as int,
      json['market_price'] as int);
}

Map<String, dynamic> _$GoodsToJson(Goods instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'total_quantity': instance.totalQuantity,
      'category_name': instance.categoryName,
      'thumb_photo_url': instance.thumbPhotoUrl,
      'big_photo_url': instance.bigPhotoUrl,
      'flag_url': instance.flagUrl,
      'flag_name': instance.flagName,
      'state': instance.state,
      'buy_url': instance.buyUrl,
      'has_video_thumb': instance.hasVideoThumb,
      'base_price': instance.basePrice,
      'market_price': instance.marketPrice
    };
