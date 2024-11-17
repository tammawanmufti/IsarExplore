import 'package:isar/isar.dart';
import 'package:myapp/data/datasource/local_course_datasource.dart';
import 'package:myapp/data/localstorage/college_localstorage/college_local_db.dart';
import 'package:myapp/data/localstorage/college_localstorage/entities/course_entity.dart';
import 'package:myapp/data/localstorage/college_localstorage/entities/student_entity.dart';
import 'package:myapp/data/localstorage/college_localstorage/entities/teacher_entity.dart';

class LocalCourseDatasourceImpl extends LocalCourseDataSource {
  LocalCourseDatasourceImpl(this.db);
  final CollegeLocalDB db;

  @override
  Future<CourseEntity> createCourse(CourseEntity input) async {
    await db().writeTxn(() async {
      await db().courseEntitys.put(input);
    });

    return input;
  }

  @override
  Future<StudentEntity> createStudent(StudentEntity input) async {
    await db().writeTxn(() async {
      await db().studentEntitys.put(input);
    });
    return input;
  }

  @override
  Future<TeacherEntity> createTeacher(TeacherEntity input) async {
    await db().writeTxn(() async {
      await db().teacherEntitys.put(input);
    });
    return input;
  }

  @override
  List<CourseEntity> getAllCourses() {
    return db.instance.courseEntitys.where().findAllSync();
  }

  @override
  List<StudentEntity> getStudentsByCourseId(Id courseId) {
    final course =
        db.instance.courseEntitys.filter().idEqualTo(courseId).findFirstSync();
    return course?.students.toList() ?? [];
  }

  @override
  TeacherEntity? getTeacherByCourseId(Id courseId) {
    final course =
        db.instance.courseEntitys.filter().idEqualTo(courseId).findFirstSync();
    return course?.teacher.value;
  }

  @override
  Future<bool> assignStudentToCourse(
      {required int courseId, required int studentId}) async {
    final course =
        db().courseEntitys.filter().idEqualTo(courseId).findFirstSync();
    final student =
        db().studentEntitys.filter().idEqualTo(studentId).findFirstSync();

    if (course != null && student != null) {
      await db().writeTxn(() async {
        course.students.add(student);
        await course.students.save();
      });
      return true;
    }

    return false;
  }

  @override
  CourseEntity? getCourse(int courseId) {
    return db().courseEntitys.filter().idEqualTo(courseId).findFirstSync();
  }

  @override
  Future<bool> assignTeacherToCourse(
      {required int courseId, required int teacherId}) async {
    final course =
        db().courseEntitys.filter().idEqualTo(courseId).findFirstSync();
    final teacher =
        db().teacherEntitys.filter().idEqualTo(teacherId).findFirstSync();

    if (course != null && teacher != null) {
      course.teacher.value = teacher;
      await db().writeTxn(() async {
        await course.teacher.save();
      });
      return true;
    }

    return false;
  }
}
