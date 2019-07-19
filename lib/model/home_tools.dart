import 'package:json_annotation/json_annotation.dart';

part 'home_tools.g.dart';


@JsonSerializable()
class HomeTools extends Object {

  @JsonKey(name: 'success')
  bool success;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  List<Data> data;

  HomeTools(this.success,this.msg,this.data,);

  factory HomeTools.fromJson(Map<String, dynamic> srcJson) => _$HomeToolsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeToolsToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'visible')
  bool visible;

  @JsonKey(name: 'editable')
  bool editable;

  Data(this.id,this.name,this.code,this.visible,this.editable,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


