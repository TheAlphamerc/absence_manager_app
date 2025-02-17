// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberImpl _$$MemberImplFromJson(Map<String, dynamic> json) => _$MemberImpl(
      crewId: (json['crewId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$MemberImplToJson(_$MemberImpl instance) =>
    <String, dynamic>{
      'crewId': instance.crewId,
      'userId': instance.userId,
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
