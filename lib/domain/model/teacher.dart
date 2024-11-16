import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher.freezed.dart';

@freezed
class Teacher with _$Teacher {
  const factory Teacher({
    required String id,
    required String name,
  }) = _Teacher;
}
