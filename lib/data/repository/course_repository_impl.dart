import 'package:myapp/data/datasource/local_course_datasource.dart';
import 'package:myapp/data/localstorage/college_localstorage/entities/course_entity.dart';
import 'package:myapp/data/localstorage/college_localstorage/entities/student_entity.dart';
import 'package:myapp/data/localstorage/college_localstorage/entities/teacher_entity.dart';
import 'package:myapp/domain/mapper/course_mapper.dart';
import 'package:myapp/domain/mapper/student_mapper.dart';
import 'package:myapp/domain/mapper/teacher_mapper.dart';
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
      courseId: courseId,
      studentId: studentId,
    );
  }

  @override
  Future<void> assignTeacherToCourse(
      {required int courseId, required int teacherId}) async {
    await localCourseDatasource.assignTeacherToCourse(
      courseId: courseId,
      teacherId: teacherId,
    );
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
  Future<Teacher> createTeacher(String name) async {
    final input = TeacherEntity(name: name);
    final result = await localCourseDatasource.createTeacher(input);
    return result.toDomain;
  }

  @override
  List<Course> getAllCourse() {
    final courses = localCourseDatasource.getAllCourses();
    return courses.toDomain;
  }

  @override
  Course? getCourse(int courseId) {
    final course = localCourseDatasource.getCourse(courseId);
    return course?.toDomain;
  }
}
