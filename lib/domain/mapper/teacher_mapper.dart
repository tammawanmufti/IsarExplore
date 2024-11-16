import 'package:isar/isar.dart';
import 'package:myapp/data/localstorage/college_localstorage/entities/teacher_entity.dart';
import 'package:myapp/domain/model/teacher.dart';

extension TeacherMapper on IsarLink<TeacherEntity> {
  Teacher? get toDomain {
    if (value != null) {
      return Teacher(
        id: value!.id,
        name: value!.name,
      );
    }
    return null;
  }
}
