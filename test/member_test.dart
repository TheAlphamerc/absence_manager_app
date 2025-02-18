import 'package:absence_manager_app/feature/home/entity/member.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Member model test', () {
    // Given
    final model = Member(
      crewId: 1,
      userId: 1,
      id: 1,
      name: 'Name',
      image: 'Image',
    );

    // Then
    expect(model.crewId, isA<int>());
    expect(model.userId, isA<int>());
    expect(model.id, isA<int>());
    expect(model.name, isA<String>());
    expect(model.image, isA<String>());
  });

  test('Member model fromJson test', () {
    // Given
    final member = Member.fromJson({
      'crewId': 1,
      'userId': 1,
      'id': 1,
      'name': 'Name',
      'image': 'Image',
    });

    // Then
    expect(member.crewId, isA<int>());
    expect(member.userId, isA<int>());
    expect(member.id, isA<int>());
    expect(member.name, isA<String>());
    expect(member.image, isA<String>());
  });

  test('Member model toJson test', () {
    // Given
    final member = Member(
      crewId: 1,
      userId: 1,
      id: 1,
      name: 'Name',
      image: 'Image',
    );

    // When
    final json = member.toJson();

    // Then
    expect(json['crewId'], isA<int>());
    expect(json['userId'], isA<int>());
    expect(json['id'], isA<int>());
    expect(json['name'], isA<String>());
    expect(json['image'], isA<String>());
  });
}
