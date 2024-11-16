import 'package:myapp/data/datasource/local_course_datasource.dart';
import 'package:myapp/data/localstorage/college_localstorage/entities/course_entity.dart';
import 'package:myapp/data/localstorage/college_localstorage/entities/student_entity.dart';
import 'package:myapp/domain/mapper/course_mapper.dart';
import 'package:myapp/domain/mapper/student_mapper.dart';
import 'package:myapp/domain/model/course.dart';
import 'package:myapp/domain/model/student.dart';
import 'package:myapp/domain/model/teacher.dart';
import 'package:myapp/domain/repository/course_repository.dart';

class CourseRepositoryImpl extends CourseRepository {
  CourseRepositoryImpl({required this.localCourseDatasource});

  final LocalCourseDataSource localCourseDatasource;

  @override
  Future<void> assignStudentToCourse(
      {required int courseId, required int studentId}) async {
    await localCourseDatasource.assignStudentToCourse(
        courseId: courseId, studentId: studentId);
  }

  @override
  Future<void> assignTeacherToCourse(
      {required int courseId, required int teacherId}) {
    throw UnimplementedError();
  }

  @override
  Future<Course> createCourse(String name) async {
    final input = CourseEntity(name: name);
    final result = await localCourseDatasource.createCourse(input);
    return result.toDomain;
  }

  @override
  Future<Student> createStudent(String name) async {
    final input = StudentEntity(name: name);
    final result = await localCourseDatasource.createStudent(input);
    return result.toDomain;
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
