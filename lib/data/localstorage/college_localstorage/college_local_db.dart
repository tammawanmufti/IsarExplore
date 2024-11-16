import 'package:myapp/data/localstorage/college_localstorage/entities/course_entity.dart';
import 'package:myapp/data/localstorage/college_localstorage/entities/student_entity.dart';
import 'package:myapp/data/localstorage/college_localstorage/entities/teacher_entity.dart';
import 'package:myapp/data/localstorage/local_db.dart';

class CollegeLocalDB extends LocalDB {
  CollegeLocalDB()
      : super(collectionSchemas: [
          CourseEntitySchema,
          StudentEntitySchema,
          TeacherEntitySchema
        ]);
}
