import 'package:json_annotation/json_annotation.dart';

part 'splash_ad.g.dart';


@JsonSerializable()
class SplashAd extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'start_up_url')
  String startUpUrl;

  @JsonKey(name: 'is_ad')
  bool isAd;

  @JsonKey(name: 'text')
  String text;

  @JsonKey(name: 'link')
  String link;

  SplashAd(this.id,this.startUpUrl,this.isAd,this.text,this.link,);

  factory SplashAd.fromJson(Map<String, dynamic> srcJson) => _$SplashAdFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SplashAdToJson(this);

}


