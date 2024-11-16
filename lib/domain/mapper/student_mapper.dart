import 'package:isar/isar.dart';
import 'package:myapp/data/localstorage/college_localstorage/entities/student_entity.dart';
import 'package:myapp/domain/model/student.dart';

extension IsarLinksStudentMapper on IsarLinks<StudentEntity> {
  List<Student> get toDomain {
    return map(
      (entity) => Student(
        id: "${entity.id}",
        name: entity.name,
      ),
    ).toList();
  }
}
