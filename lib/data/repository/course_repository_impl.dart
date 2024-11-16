import 'package:myapp/data/datasource/local_course_datasource.dart';
import 'package:myapp/domain/mapper/course_mapper.dart';
import 'package:myapp/domain/model/course.dart';
import 'package:myapp/domain/model/student.dart';
import 'package:myapp/domain/model/teacher.dart';
import 'package:myapp/domain/repository/course_repository.dart';

class CourseRepositoryImpl extends CourseRepository {
  CourseRepositoryImpl({required this.localCourseDatasource});

  final LocalCourseDataSource localCourseDatasource;

  @override
  Course assignStudentToCourse(
      {required int courseId, required int studentId}) {
    // TODO: implement assignStudentToCourse
    throw UnimplementedError();
  }

  @override
  Course assignTeacherToCourse(
      {required int courseId, required int teacherId}) {
    // TODO: implement assignTeacherToCourse
    throw UnimplementedError();
  }

  @override
  Course createCourse(String name) {
    // TODO: implement createCourse
    throw UnimplementedError();
  }

  @override
  Student createStudent(String name) {
    // TODO: implement createStudent
    throw UnimplementedError();
  }

  @override
  Teacher createTeacher(String name) {
    // TODO: implement createTeacher
    throw UnimplementedError();
  }

  @override
  List<Course> getAllCourse() {
    final courses = localCourseDatasource.getAllCourses();
    return courses.toDomain;
  }

  @override
  List<Student> getStudentsByCourseId(int courseId) {
    // TODO: implement getStudentsByCourseId
    throw UnimplementedError();
  }
}