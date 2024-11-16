import 'package:isar/isar.dart';

part 'student_entity.g.dart';

@collection
class StudentEntity {
  StudentEntity({required this.name});
  String name;
  Id id = Isar.autoIncrement;
}
