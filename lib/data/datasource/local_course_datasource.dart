import 'package:isar/isar.dart';
import 'package:myapp/data/localstorage/college_localstorage/entities/course_entity.dart';
import 'package:myapp/data/localstorage/college_localstorage/entities/student_entity.dart';
import 'package:myapp/data/localstorage/college_localstorage/entities/teacher_entity.dart';

abstract class LocalCourseDataSource {
  List<CourseEntity> getAllCourses();
  List<StudentEntity>? getStudentsByCourseId(Id courseId);
  TeacherEntity? getTeacherByCourseId(Id courseId);
  Future<CourseEntity> createCourse(CourseEntity input);
  Future<StudentEntity> createStudent(StudentEntity input);
  Future<TeacherEntity> createTeacher(TeacherEntity input);
}
