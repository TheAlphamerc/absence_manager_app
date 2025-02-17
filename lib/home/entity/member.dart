import 'package:freezed_annotation/freezed_annotation.dart';
part 'member.g.dart';
part 'member.freezed.dart';

@freezed
class Member with _$Member {
  const factory Member({
    required int crewId,
    required int userId,
    required int id,
    required String name,
    required String image,
  }) = _Member;
  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}
