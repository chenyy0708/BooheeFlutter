import 'package:json_annotation/json_annotation.dart';

part 'ShopBanner.g.dart';


@JsonSerializable()
class ShopBanner extends Object {

  @JsonKey(name: 'banner_showcases')
  List<Banner_showcases> bannerShowcases;

  @JsonKey(name: 'shop_modules')
  List<Shop_modules> shopModules;

  @JsonKey(name: 'categories')
  List<Categories> categories;

  ShopBanner(this.bannerShowcases,this.shopModules,this.categories,);

  factory ShopBanner.fromJson(Map<String, dynamic> srcJson) => _$ShopBannerFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ShopBannerToJson(this);

}


@JsonSerializable()
class Banner_showcases extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'exhibit')
  String exhibit;

  @JsonKey(name: 'default_photo_url')
  String defaultPhotoUrl;

  @JsonKey(name: 'default_photo_height')
  int defaultPhotoHeight;

  @JsonKey(name: 'default_photo_width')
  int defaultPhotoWidth;

  @JsonKey(name: 'exhibit_type')
  String exhibitType;

  @JsonKey(name: 'page_title')
  String pageTitle;

  Banner_showcases(this.id,this.exhibit,this.defaultPhotoUrl,this.defaultPhotoHeight,this.defaultPhotoWidth,this.exhibitType,this.pageTitle,);

  factory Banner_showcases.fromJson(Map<String, dynamic> srcJson) => _$Banner_showcasesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Banner_showcasesToJson(this);

}


@JsonSerializable()
class Shop_modules extends Object {

  @JsonKey(name: 'position')
  int position;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'sub_title')
  String subTitle;

  @JsonKey(name: 'picture_url1')
  String pictureUrl1;

  @JsonKey(name: 'picture_url2')
  String pictureUrl2;

  @JsonKey(name: 'redirect_url')
  String redirectUrl;

  @JsonKey(name: 'display')
  bool display;

  @JsonKey(name: 'new_tag')
  String newTag;

  Shop_modules(this.position,this.title,this.subTitle,this.pictureUrl1,this.pictureUrl2,this.redirectUrl,this.display,this.newTag,);

  factory Shop_modules.fromJson(Map<String, dynamic> srcJson) => _$Shop_modulesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Shop_modulesToJson(this);

}


@JsonSerializable()
class Categories extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'icon_url')
  String iconUrl;

  Categories(this.id,this.name,this.description,this.iconUrl,);

  factory Categories.fromJson(Map<String, dynamic> srcJson) => _$CategoriesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);

}


