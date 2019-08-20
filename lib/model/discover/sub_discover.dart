import 'package:json_annotation/json_annotation.dart';

part 'sub_discover.g.dart';


@JsonSerializable()
class SubDiscover extends Object {

  @JsonKey(name: 'banners')
  List<Banners> banners;

  @JsonKey(name: 'labels')
  List<Labels> labels;

  @JsonKey(name: 'sections')
  List<Sections> sections;

  SubDiscover(this.banners,this.labels,this.sections,);

  factory SubDiscover.fromJson(Map<String, dynamic> srcJson) => _$SubDiscoverFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SubDiscoverToJson(this);

}


@JsonSerializable()
class Banners extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'pic_url')
  String picUrl;

  Banners(this.id,this.title,this.link,this.picUrl,);

  factory Banners.fromJson(Map<String, dynamic> srcJson) => _$BannersFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannersToJson(this);

}


@JsonSerializable()
class Labels extends Object {

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'pic_url')
  String picUrl;

  Labels(this.title,this.url,this.picUrl,);

  factory Labels.fromJson(Map<String, dynamic> srcJson) => _$LabelsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LabelsToJson(this);

}


@JsonSerializable()
class Sections extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'sub_contents')
  List<Sub_contents> subContents;

  Sections(this.name,this.subContents,);

  factory Sections.fromJson(Map<String, dynamic> srcJson) => _$SectionsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SectionsToJson(this);

}


@JsonSerializable()
class Sub_contents extends Object {

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'sub_title')
  String subTitle;

  @JsonKey(name: 'img_url')
  String imgUrl;

  @JsonKey(name: 'redirect_url')
  String redirectUrl;

  Sub_contents(this.title,this.subTitle,this.imgUrl,this.redirectUrl,);

  factory Sub_contents.fromJson(Map<String, dynamic> srcJson) => _$Sub_contentsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Sub_contentsToJson(this);

}


