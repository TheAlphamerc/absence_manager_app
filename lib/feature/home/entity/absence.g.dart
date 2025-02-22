// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'absence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AbsenceImpl _$$AbsenceImplFromJson(Map<String, dynamic> json) =>
    _$AbsenceImpl(
      crewId: (json['crewId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      admitterId: (json['admitterId'] as num?)?.toInt(),
      admitterNote: json['admitterNote'] as String? ?? '',
      memberNote: json['memberNote'] as String? ?? '',
      confirmedAt: json['confirmedAt'] == null
          ? null
          : DateTime.parse(json['confirmedAt'] as String),
      rejectedAt: json['rejectedAt'] == null
          ? null
          : DateTime.parse(json['rejectedAt'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      startDate: DateTime.parse(json['startDate'] as String),
      type: $enumDecodeNullable(_$AbsenceTypeEnumMap, json['type']) ??
          AbsenceType.vacation,
      createdAt: DateTime.parse(json['createdAt'] as String),
      member: json['member'] == null
          ? null
          : Member.fromJson(json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AbsenceImplToJson(_$AbsenceImpl instance) =>
    <String, dynamic>{
      'crewId': instance.crewId,
      'userId': instance.userId,
      'id': instance.id,
      'admitterId': instance.admitterId,
      'admitterNote': instance.admitterNote,
      'memberNote': instance.memberNote,
      'confirmedAt': instance.confirmedAt?.toIso8601String(),
      'rejectedAt': instance.rejectedAt?.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'startDate': instance.startDate.toIso8601String(),
      'type': _$AbsenceTypeEnumMap[instance.type]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'member': instance.member?.toJson(),
    };

const _$AbsenceTypeEnumMap = {
  AbsenceType.all: 'all',
  AbsenceType.vacation: 'vacation',
  AbsenceType.sickness: 'sickness',
};
