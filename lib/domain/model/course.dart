import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myapp/domain/model/student.dart';
import 'package:myapp/domain/model/teacher.dart';

part 'course.freezed.dart';

@freezed
class Course with _$Course {
  const factory Course({
    required String id,
    required String name,
    required Teacher teacher,
    required List<Student> students,
  }) = _Course;
}
