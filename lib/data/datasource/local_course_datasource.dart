import 'package:isar/isar.dart';
import 'package:myapp/data/localstorage/college_localstorage/entities/course_entity.dart';
import 'package:myapp/data/localstorage/college_localstorage/entities/student_entity.dart';
import 'package:myapp/data/localstorage/college_localstorage/entities/teacher_entity.dart';

abstract class LocalCourseDataSource {
  List<CourseEntity> getAllCourses();
  List<StudentEntity>? getStudentsByCourseId(Id courseId);
  TeacherEntity? getTeacherByCourseId(Id courseId);
  CourseEntity createCourse(CourseEntity input);
  StudentEntity createStudent(StudentEntity input);
  TeacherEntity createTeacher(TeacherEntity input);
}
