// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginUser _$LoginUserFromJson(Map<String, dynamic> json) {
  return LoginUser(
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      json['token'] as String);
}

Map<String, dynamic> _$LoginUserToJson(LoginUser instance) =>
    <String, dynamic>{'user': instance.user, 'token': instance.token};

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['user_key'] as String,
      json['user_name'] as String,
      json['cellphone'] as String,
      json['cellphone_state'] as bool,
      json['user_type'] as int,
      json['created_at'] as String,
      json['avatar_url'] as String,
      json['at_coin_balance'] as int);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'user_key': instance.userKey,
      'user_name': instance.userName,
      'cellphone': instance.cellphone,
      'cellphone_state': instance.cellphoneState,
      'user_type': instance.userType,
      'created_at': instance.createdAt,
      'avatar_url': instance.avatarUrl,
      'at_coin_balance': instance.atCoinBalance
    };
