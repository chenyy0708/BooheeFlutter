import 'package:json_annotation/json_annotation.dart';

part 'gank_entriy.g.dart';

@JsonSerializable()
class GankEntriy extends Object {

  bool error;

  List<Results> results;

  GankEntriy(this.error,this.results,);

  factory GankEntriy.fromJson(Map<String, dynamic> srcJson) => _$GankEntriyFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GankEntriyToJson(this);

}


@JsonSerializable()
class Results extends Object {


  String createdAt;

  String desc;

  List<String> images;

  String publishedAt;

  String source;

  String type;

  String url;

  bool used;

  String who;

  Results(this.createdAt,this.desc,this.images,this.publishedAt,this.source,this.type,this.url,this.used,this.who,);

  factory Results.fromJson(Map<String, dynamic> srcJson) => _$ResultsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);

}


