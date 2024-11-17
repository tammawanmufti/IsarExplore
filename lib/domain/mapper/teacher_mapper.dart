import 'package:isar/isar.dart';
import 'package:myapp/data/localstorage/college_localstorage/entities/teacher_entity.dart';
import 'package:myapp/domain/model/teacher.dart';

extension IsarLinkTeacherMapper on IsarLink<TeacherEntity> {
  Teacher? get toDomain {
    if (value != null) {
      return value!.toDomain;
    }
    return null;
  }
}

extension TeacherMapper on TeacherEntity {
  Teacher get toDomain {
    return Teacher(
      id: id,
      name: name,
    );
  }
}
