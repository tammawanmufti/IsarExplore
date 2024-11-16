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
  CourseEntity createCourse(CourseEntity input) {
    db().writeTxnSync(() {
      db().courseEntitys.put(input);
    });
    return input;
  }

  @override
  StudentEntity createStudent(StudentEntity input) {
    db().writeTxnSync(() {
      db().studentEntitys.put(input);
    });
    return input;
  }

  @override
  TeacherEntity createTeacher(TeacherEntity input) {
    db().writeTxnSync(() {
      db().teacherEntitys.put(input);
    });
    return input;
  }

  @override
  List<CourseEntity> getAllCourses() {
    return db().courseEntitys.where().findAllSync();
  }

  @override
  List<StudentEntity> getStudentsByCourseId(Id courseId) {
    final course =
        db().courseEntitys.filter().idEqualTo(courseId).findFirstSync();
    return course?.students.toList() ?? [];
  }

  @override
  TeacherEntity? getTeacherByCourseId(Id courseId) {
    final course =
        db().courseEntitys.filter().idEqualTo(courseId).findFirstSync();
    return course?.teacher.value;
  }
}
