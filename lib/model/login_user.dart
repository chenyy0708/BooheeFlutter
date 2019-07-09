import 'package:json_annotation/json_annotation.dart';

part 'login_user.g.dart';


@JsonSerializable()
class LoginUser extends Object {

  @JsonKey(name: 'user')
  User user;

  @JsonKey(name: 'token')
  String token;

  LoginUser(this.user,this.token,);

  factory LoginUser.fromJson(Map<String, dynamic> srcJson) => _$LoginUserFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LoginUserToJson(this);

}


@JsonSerializable()
class User extends Object {

  @JsonKey(name: 'user_key')
  String userKey;

  @JsonKey(name: 'user_name')
  String userName;

  @JsonKey(name: 'cellphone')
  String cellphone;

  @JsonKey(name: 'cellphone_state')
  bool cellphoneState;

  @JsonKey(name: 'user_type')
  int userType;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'avatar_url')
  String avatarUrl;

  @JsonKey(name: 'at_coin_balance')
  int atCoinBalance;

  User(this.userKey,this.userName,this.cellphone,this.cellphoneState,this.userType,this.createdAt,this.avatarUrl,this.atCoinBalance,);

  factory User.fromJson(Map<String, dynamic> srcJson) => _$UserFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}


