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
    try {
      final course =
          db().courseEntitys.filter().idEqualTo(courseId).findFirstSync();
      final student =
          db().studentEntitys.filter().idEqualTo(studentId).findFirstSync();

      if (course != null && student != null) {
        course.students.add(student);
        await db().writeTxn(() async {
          db().courseEntitys.put(course);
        });
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }
}
