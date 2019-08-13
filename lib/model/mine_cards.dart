import 'package:json_annotation/json_annotation.dart';

part 'mine_cards.g.dart';


@JsonSerializable()
class MineCards extends Object {

  @JsonKey(name: 'success')
  bool success;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  List<Data> data;

  MineCards(this.success,this.msg,this.data,);

  factory MineCards.fromJson(Map<String, dynamic> srcJson) => _$MineCardsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MineCardsToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'icon_url')
  String iconUrl;

  @JsonKey(name: 'url')
  String url;

  Data(this.id,this.name,this.iconUrl,this.url,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


