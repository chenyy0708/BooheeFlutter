import 'package:json_annotation/json_annotation.dart';

part 'home_wall_paper.g.dart';


@JsonSerializable()
class HomeWallPaper extends Object {

  @JsonKey(name: 'welcome_img')
  Welcome_img welcomeImg;

  HomeWallPaper(this.welcomeImg,);

  factory HomeWallPaper.fromJson(Map<String, dynamic> srcJson) => _$HomeWallPaperFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeWallPaperToJson(this);

}


@JsonSerializable()
class Welcome_img extends Object {

  @JsonKey(name: 'hello_text')
  String helloText;

  @JsonKey(name: 'back_img')
  String backImg;

  @JsonKey(name: 'back_img_small')
  String backImgSmall;

  @JsonKey(name: 'back_img_x')
  String backImgX;

  @JsonKey(name: 'video_url')
  String videoUrl;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'date')
  String date;

  Welcome_img(this.helloText,this.backImg,this.backImgSmall,this.backImgX,this.videoUrl,this.link,this.date,);

  factory Welcome_img.fromJson(Map<String, dynamic> srcJson) => _$Welcome_imgFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Welcome_imgToJson(this);

}


