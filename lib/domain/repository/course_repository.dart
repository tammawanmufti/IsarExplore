import 'package:myapp/domain/model/course.dart';
import 'package:myapp/domain/model/student.dart';
import 'package:myapp/domain/model/teacher.dart';

abstract class CourseRepository {
  List<Course> getAllCourse();
  List<Student> getStudentsByCourseId(int courseId);
  Future<Course> createCourse(String name);
  Future<Student> createStudent(String name);
  Teacher createTeacher(String name);
  Course assignStudentToCourse({required int courseId, required int studentId});
  Course assignTeacherToCourse({required int courseId, required int teacherId});
}
