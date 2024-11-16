import 'package:myapp/data/localstorage/college_localstorage/entities/student_entity.dart';
import 'package:isar/isar.dart';
import 'package:myapp/data/localstorage/college_localstorage/entities/teacher_entity.dart';

part 'course_entity.g.dart';

@collection
class CourseEntity {
  CourseEntity({required this.name});
  Id id = Isar.autoIncrement;
  String name;
  final teacher = IsarLink<TeacherEntity>();
  final students = IsarLinks<StudentEntity>();
}
