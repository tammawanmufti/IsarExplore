part of 'course_cubit.dart';

@freezed
class CourseState with _$CourseState {
  const factory CourseState.initial() = _Initial;
  const factory CourseState.loaded({
    required List<Course> courses,
  }) = _Loaded;
  const factory CourseState.failure({
    required String message,
  }) = _Failure;
}
