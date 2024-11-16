import 'package:myapp/data/localstorage/college_localstorage/entities/course_entity.dart';
import 'package:myapp/domain/mapper/student_mapper.dart';
import 'package:myapp/domain/mapper/teacher_mapper.dart';
import 'package:myapp/domain/model/course.dart';

extension IsarCollectionCourseMapper on List<CourseEntity> {
  List<Course> get toDomain {
    return map((entity) => Course(
          id: '${entity.id}',
          name: entity.name,
          teacher: entity.teacher.toDomain,
          students: entity.students.toDomain,
        )).toList();
  }
}
