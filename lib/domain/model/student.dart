import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';

@freezed
class Student with _$Student {
  const factory Student({
    required String id,
    required String name,
  }) = _Student;
}
