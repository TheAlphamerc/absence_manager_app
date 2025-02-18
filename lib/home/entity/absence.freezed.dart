// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'absence.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Absence _$AbsenceFromJson(Map<String, dynamic> json) {
  return _Absence.fromJson(json);
}

/// @nodoc
mixin _$Absence {
  int get crewId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  int? get admitterId => throw _privateConstructorUsedError;
  String get admitterNote => throw _privateConstructorUsedError;
  String get memberNote => throw _privateConstructorUsedError;
  DateTime? get confirmedAt => throw _privateConstructorUsedError;
  DateTime? get rejectedAt => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  AbsenceType get type => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  Member get member => throw _privateConstructorUsedError;

  /// Serializes this Absence to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Absence
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AbsenceCopyWith<Absence> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbsenceCopyWith<$Res> {
  factory $AbsenceCopyWith(Absence value, $Res Function(Absence) then) =
      _$AbsenceCopyWithImpl<$Res, Absence>;
  @useResult
  $Res call(
      {int crewId,
      int userId,
      int id,
      int? admitterId,
      String admitterNote,
      String memberNote,
      DateTime? confirmedAt,
      DateTime? rejectedAt,
      DateTime endDate,
      DateTime startDate,
      AbsenceType type,
      DateTime createdAt,
      Member member});

  $MemberCopyWith<$Res> get member;
}

/// @nodoc
class _$AbsenceCopyWithImpl<$Res, $Val extends Absence>
    implements $AbsenceCopyWith<$Res> {
  _$AbsenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Absence
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? crewId = null,
    Object? userId = null,
    Object? id = null,
    Object? admitterId = freezed,
    Object? admitterNote = null,
    Object? memberNote = null,
    Object? confirmedAt = freezed,
    Object? rejectedAt = freezed,
    Object? endDate = null,
    Object? startDate = null,
    Object? type = null,
    Object? createdAt = null,
    Object? member = null,
  }) {
    return _then(_value.copyWith(
      crewId: null == crewId
          ? _value.crewId
          : crewId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      admitterId: freezed == admitterId
          ? _value.admitterId
          : admitterId // ignore: cast_nullable_to_non_nullable
              as int?,
      admitterNote: null == admitterNote
          ? _value.admitterNote
          : admitterNote // ignore: cast_nullable_to_non_nullable
              as String,
      memberNote: null == memberNote
          ? _value.memberNote
          : memberNote // ignore: cast_nullable_to_non_nullable
              as String,
      confirmedAt: freezed == confirmedAt
          ? _value.confirmedAt
          : confirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rejectedAt: freezed == rejectedAt
          ? _value.rejectedAt
          : rejectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AbsenceType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      member: null == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as Member,
    ) as $Val);
  }

  /// Create a copy of Absence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MemberCopyWith<$Res> get member {
    return $MemberCopyWith<$Res>(_value.member, (value) {
      return _then(_value.copyWith(member: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AbsenceImplCopyWith<$Res> implements $AbsenceCopyWith<$Res> {
  factory _$$AbsenceImplCopyWith(
          _$AbsenceImpl value, $Res Function(_$AbsenceImpl) then) =
      __$$AbsenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int crewId,
      int userId,
      int id,
      int? admitterId,
      String admitterNote,
      String memberNote,
      DateTime? confirmedAt,
      DateTime? rejectedAt,
      DateTime endDate,
      DateTime startDate,
      AbsenceType type,
      DateTime createdAt,
      Member member});

  @override
  $MemberCopyWith<$Res> get member;
}

/// @nodoc
class __$$AbsenceImplCopyWithImpl<$Res>
    extends _$AbsenceCopyWithImpl<$Res, _$AbsenceImpl>
    implements _$$AbsenceImplCopyWith<$Res> {
  __$$AbsenceImplCopyWithImpl(
      _$AbsenceImpl _value, $Res Function(_$AbsenceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Absence
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? crewId = null,
    Object? userId = null,
    Object? id = null,
    Object? admitterId = freezed,
    Object? admitterNote = null,
    Object? memberNote = null,
    Object? confirmedAt = freezed,
    Object? rejectedAt = freezed,
    Object? endDate = null,
    Object? startDate = null,
    Object? type = null,
    Object? createdAt = null,
    Object? member = null,
  }) {
    return _then(_$AbsenceImpl(
      crewId: null == crewId
          ? _value.crewId
          : crewId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      admitterId: freezed == admitterId
          ? _value.admitterId
          : admitterId // ignore: cast_nullable_to_non_nullable
              as int?,
      admitterNote: null == admitterNote
          ? _value.admitterNote
          : admitterNote // ignore: cast_nullable_to_non_nullable
              as String,
      memberNote: null == memberNote
          ? _value.memberNote
          : memberNote // ignore: cast_nullable_to_non_nullable
              as String,
      confirmedAt: freezed == confirmedAt
          ? _value.confirmedAt
          : confirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rejectedAt: freezed == rejectedAt
          ? _value.rejectedAt
          : rejectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AbsenceType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      member: null == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as Member,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AbsenceImpl implements _Absence {
  const _$AbsenceImpl(
      {required this.crewId,
      required this.userId,
      required this.id,
      this.admitterId,
      this.admitterNote = '',
      this.memberNote = '',
      this.confirmedAt,
      this.rejectedAt,
      required this.endDate,
      required this.startDate,
      this.type = AbsenceType.vacation,
      required this.createdAt,
      required this.member});

  factory _$AbsenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AbsenceImplFromJson(json);

  @override
  final int crewId;
  @override
  final int userId;
  @override
  final int id;
  @override
  final int? admitterId;
  @override
  @JsonKey()
  final String admitterNote;
  @override
  @JsonKey()
  final String memberNote;
  @override
  final DateTime? confirmedAt;
  @override
  final DateTime? rejectedAt;
  @override
  final DateTime endDate;
  @override
  final DateTime startDate;
  @override
  @JsonKey()
  final AbsenceType type;
  @override
  final DateTime createdAt;
  @override
  final Member member;

  @override
  String toString() {
    return 'Absence(crewId: $crewId, userId: $userId, id: $id, admitterId: $admitterId, admitterNote: $admitterNote, memberNote: $memberNote, confirmedAt: $confirmedAt, rejectedAt: $rejectedAt, endDate: $endDate, startDate: $startDate, type: $type, createdAt: $createdAt, member: $member)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbsenceImpl &&
            (identical(other.crewId, crewId) || other.crewId == crewId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.admitterId, admitterId) ||
                other.admitterId == admitterId) &&
            (identical(other.admitterNote, admitterNote) ||
                other.admitterNote == admitterNote) &&
            (identical(other.memberNote, memberNote) ||
                other.memberNote == memberNote) &&
            (identical(other.confirmedAt, confirmedAt) ||
                other.confirmedAt == confirmedAt) &&
            (identical(other.rejectedAt, rejectedAt) ||
                other.rejectedAt == rejectedAt) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.member, member) || other.member == member));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      crewId,
      userId,
      id,
      admitterId,
      admitterNote,
      memberNote,
      confirmedAt,
      rejectedAt,
      endDate,
      startDate,
      type,
      createdAt,
      member);

  /// Create a copy of Absence
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AbsenceImplCopyWith<_$AbsenceImpl> get copyWith =>
      __$$AbsenceImplCopyWithImpl<_$AbsenceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AbsenceImplToJson(
      this,
    );
  }
}

abstract class _Absence implements Absence {
  const factory _Absence(
      {required final int crewId,
      required final int userId,
      required final int id,
      final int? admitterId,
      final String admitterNote,
      final String memberNote,
      final DateTime? confirmedAt,
      final DateTime? rejectedAt,
      required final DateTime endDate,
      required final DateTime startDate,
      final AbsenceType type,
      required final DateTime createdAt,
      required final Member member}) = _$AbsenceImpl;

  factory _Absence.fromJson(Map<String, dynamic> json) = _$AbsenceImpl.fromJson;

  @override
  int get crewId;
  @override
  int get userId;
  @override
  int get id;
  @override
  int? get admitterId;
  @override
  String get admitterNote;
  @override
  String get memberNote;
  @override
  DateTime? get confirmedAt;
  @override
  DateTime? get rejectedAt;
  @override
  DateTime get endDate;
  @override
  DateTime get startDate;
  @override
  AbsenceType get type;
  @override
  DateTime get createdAt;
  @override
  Member get member;

  /// Create a copy of Absence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AbsenceImplCopyWith<_$AbsenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
