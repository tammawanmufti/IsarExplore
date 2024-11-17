import 'package:myapp/domain/model/course.dart';
import 'package:myapp/domain/model/student.dart';
import 'package:myapp/domain/model/teacher.dart';

abstract class CourseRepository {
  List<Course> getAllCourse();
  Future<Course> createCourse(String name);
  Future<Student> createStudent(String name);
  Future<Teacher> createTeacher(String name);
  Future<void> assignStudentToCourse(
      {required int courseId, required int studentId});
  Future<void> assignTeacherToCourse(
      {required int courseId, required int teacherId});
  Course? getCourse(int courseId);
}
