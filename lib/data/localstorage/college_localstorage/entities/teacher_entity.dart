import 'package:isar/isar.dart';

part 'teacher_entity.g.dart';

@collection
class TeacherEntity {
  TeacherEntity({required this.name});
  Id id = Isar.autoIncrement;
  String name;
}
