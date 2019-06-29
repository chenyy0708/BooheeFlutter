import 'package:json_annotation/json_annotation.dart';

part 'ShopRecommendList.g.dart';


@JsonSerializable()
class ShopRecommendList extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'sub_labels')
  List<Sub_labels> subLabels;

  @JsonKey(name: 'banner_showcases')
  List<dynamic> bannerShowcases;

  @JsonKey(name: 'goods')
  List<Goods> goods;

  @JsonKey(name: 'page')
  int page;

  @JsonKey(name: 'total_pages')
  int totalPages;

  ShopRecommendList(this.id,this.name,this.description,this.subLabels,this.bannerShowcases,this.goods,this.page,this.totalPages,);

  factory ShopRecommendList.fromJson(Map<String, dynamic> srcJson) => _$ShopRecommendListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ShopRecommendListToJson(this);

}


@JsonSerializable()
class Sub_labels extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  Sub_labels(this.id,this.name,);

  factory Sub_labels.fromJson(Map<String, dynamic> srcJson) => _$Sub_labelsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Sub_labelsToJson(this);

}


@JsonSerializable()
class Goods extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'total_quantity')
  int totalQuantity;

  @JsonKey(name: 'category_name')
  String categoryName;

  @JsonKey(name: 'thumb_photo_url')
  String thumbPhotoUrl;

  @JsonKey(name: 'big_photo_url')
  String bigPhotoUrl;

  @JsonKey(name: 'flag_url')
  String flagUrl;

  @JsonKey(name: 'flag_name')
  String flagName;

  @JsonKey(name: 'state')
  String state;

  @JsonKey(name: 'buy_url')
  String buyUrl;

  @JsonKey(name: 'has_video_thumb')
  bool hasVideoThumb;

  @JsonKey(name: 'base_price')
  int basePrice;

  @JsonKey(name: 'market_price')
  int marketPrice;

  Goods(this.id,this.title,this.totalQuantity,this.categoryName,this.thumbPhotoUrl,this.bigPhotoUrl,this.flagUrl,this.flagName,this.state,this.buyUrl,this.hasVideoThumb,this.basePrice,this.marketPrice,);

  factory Goods.fromJson(Map<String, dynamic> srcJson) => _$GoodsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoodsToJson(this);

}


