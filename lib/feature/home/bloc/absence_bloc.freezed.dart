// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'absence_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AbsenceState {
  List<Absence> get absences => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;
  int get totalAbsences => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  FilterBy? get filterBy => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Create a copy of AbsenceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AbsenceStateCopyWith<AbsenceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbsenceStateCopyWith<$Res> {
  factory $AbsenceStateCopyWith(
          AbsenceState value, $Res Function(AbsenceState) then) =
      _$AbsenceStateCopyWithImpl<$Res, AbsenceState>;
  @useResult
  $Res call(
      {List<Absence> absences,
      int page,
      bool hasReachedMax,
      int totalAbsences,
      Status status,
      FilterBy? filterBy,
      String? message});

  $FilterByCopyWith<$Res>? get filterBy;
}

/// @nodoc
class _$AbsenceStateCopyWithImpl<$Res, $Val extends AbsenceState>
    implements $AbsenceStateCopyWith<$Res> {
  _$AbsenceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AbsenceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? absences = null,
    Object? page = null,
    Object? hasReachedMax = null,
    Object? totalAbsences = null,
    Object? status = null,
    Object? filterBy = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      absences: null == absences
          ? _value.absences
          : absences // ignore: cast_nullable_to_non_nullable
              as List<Absence>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      totalAbsences: null == totalAbsences
          ? _value.totalAbsences
          : totalAbsences // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      filterBy: freezed == filterBy
          ? _value.filterBy
          : filterBy // ignore: cast_nullable_to_non_nullable
              as FilterBy?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of AbsenceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FilterByCopyWith<$Res>? get filterBy {
    if (_value.filterBy == null) {
      return null;
    }

    return $FilterByCopyWith<$Res>(_value.filterBy!, (value) {
      return _then(_value.copyWith(filterBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AbsenceStateImplCopyWith<$Res>
    implements $AbsenceStateCopyWith<$Res> {
  factory _$$AbsenceStateImplCopyWith(
          _$AbsenceStateImpl value, $Res Function(_$AbsenceStateImpl) then) =
      __$$AbsenceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Absence> absences,
      int page,
      bool hasReachedMax,
      int totalAbsences,
      Status status,
      FilterBy? filterBy,
      String? message});

  @override
  $FilterByCopyWith<$Res>? get filterBy;
}

/// @nodoc
class __$$AbsenceStateImplCopyWithImpl<$Res>
    extends _$AbsenceStateCopyWithImpl<$Res, _$AbsenceStateImpl>
    implements _$$AbsenceStateImplCopyWith<$Res> {
  __$$AbsenceStateImplCopyWithImpl(
      _$AbsenceStateImpl _value, $Res Function(_$AbsenceStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AbsenceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? absences = null,
    Object? page = null,
    Object? hasReachedMax = null,
    Object? totalAbsences = null,
    Object? status = null,
    Object? filterBy = freezed,
    Object? message = freezed,
  }) {
    return _then(_$AbsenceStateImpl(
      absences: null == absences
          ? _value._absences
          : absences // ignore: cast_nullable_to_non_nullable
              as List<Absence>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      totalAbsences: null == totalAbsences
          ? _value.totalAbsences
          : totalAbsences // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      filterBy: freezed == filterBy
          ? _value.filterBy
          : filterBy // ignore: cast_nullable_to_non_nullable
              as FilterBy?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AbsenceStateImpl implements _AbsenceState {
  const _$AbsenceStateImpl(
      {final List<Absence> absences = const [],
      this.page = 1,
      this.hasReachedMax = false,
      this.totalAbsences = 0,
      this.status = Status.initial,
      this.filterBy,
      this.message})
      : _absences = absences;

  final List<Absence> _absences;
  @override
  @JsonKey()
  List<Absence> get absences {
    if (_absences is EqualUnmodifiableListView) return _absences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_absences);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final bool hasReachedMax;
  @override
  @JsonKey()
  final int totalAbsences;
  @override
  @JsonKey()
  final Status status;
  @override
  final FilterBy? filterBy;
  @override
  final String? message;

  @override
  String toString() {
    return 'AbsenceState(absences: $absences, page: $page, hasReachedMax: $hasReachedMax, totalAbsences: $totalAbsences, status: $status, filterBy: $filterBy, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbsenceStateImpl &&
            const DeepCollectionEquality().equals(other._absences, _absences) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.totalAbsences, totalAbsences) ||
                other.totalAbsences == totalAbsences) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.filterBy, filterBy) ||
                other.filterBy == filterBy) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_absences),
      page,
      hasReachedMax,
      totalAbsences,
      status,
      filterBy,
      message);

  /// Create a copy of AbsenceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AbsenceStateImplCopyWith<_$AbsenceStateImpl> get copyWith =>
      __$$AbsenceStateImplCopyWithImpl<_$AbsenceStateImpl>(this, _$identity);
}

abstract class _AbsenceState implements AbsenceState {
  const factory _AbsenceState(
      {final List<Absence> absences,
      final int page,
      final bool hasReachedMax,
      final int totalAbsences,
      final Status status,
      final FilterBy? filterBy,
      final String? message}) = _$AbsenceStateImpl;

  @override
  List<Absence> get absences;
  @override
  int get page;
  @override
  bool get hasReachedMax;
  @override
  int get totalAbsences;
  @override
  Status get status;
  @override
  FilterBy? get filterBy;
  @override
  String? get message;

  /// Create a copy of AbsenceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AbsenceStateImplCopyWith<_$AbsenceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FilterBy {
  String? get typeFilter => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;

  /// Create a copy of FilterBy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterByCopyWith<FilterBy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterByCopyWith<$Res> {
  factory $FilterByCopyWith(FilterBy value, $Res Function(FilterBy) then) =
      _$FilterByCopyWithImpl<$Res, FilterBy>;
  @useResult
  $Res call({String? typeFilter, DateTime? startDate, DateTime? endDate});
}

/// @nodoc
class _$FilterByCopyWithImpl<$Res, $Val extends FilterBy>
    implements $FilterByCopyWith<$Res> {
  _$FilterByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterBy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeFilter = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      typeFilter: freezed == typeFilter
          ? _value.typeFilter
          : typeFilter // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilterByImplCopyWith<$Res>
    implements $FilterByCopyWith<$Res> {
  factory _$$FilterByImplCopyWith(
          _$FilterByImpl value, $Res Function(_$FilterByImpl) then) =
      __$$FilterByImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? typeFilter, DateTime? startDate, DateTime? endDate});
}

/// @nodoc
class __$$FilterByImplCopyWithImpl<$Res>
    extends _$FilterByCopyWithImpl<$Res, _$FilterByImpl>
    implements _$$FilterByImplCopyWith<$Res> {
  __$$FilterByImplCopyWithImpl(
      _$FilterByImpl _value, $Res Function(_$FilterByImpl) _then)
      : super(_value, _then);

  /// Create a copy of FilterBy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeFilter = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$FilterByImpl(
      typeFilter: freezed == typeFilter
          ? _value.typeFilter
          : typeFilter // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$FilterByImpl implements _FilterBy {
  const _$FilterByImpl({this.typeFilter, this.startDate, this.endDate});

  @override
  final String? typeFilter;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;

  @override
  String toString() {
    return 'FilterBy(typeFilter: $typeFilter, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterByImpl &&
            (identical(other.typeFilter, typeFilter) ||
                other.typeFilter == typeFilter) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, typeFilter, startDate, endDate);

  /// Create a copy of FilterBy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterByImplCopyWith<_$FilterByImpl> get copyWith =>
      __$$FilterByImplCopyWithImpl<_$FilterByImpl>(this, _$identity);
}

abstract class _FilterBy implements FilterBy {
  const factory _FilterBy(
      {final String? typeFilter,
      final DateTime? startDate,
      final DateTime? endDate}) = _$FilterByImpl;

  @override
  String? get typeFilter;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;

  /// Create a copy of FilterBy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterByImplCopyWith<_$FilterByImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
