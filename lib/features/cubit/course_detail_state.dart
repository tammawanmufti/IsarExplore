part of 'course_detail_cubit.dart';

@freezed
class CourseDetailState with _$CourseDetailState {
  const factory CourseDetailState.initial() = _Initial;
  const factory CourseDetailState.loaded({
    required Course course,
  }) = _Loading;
  const factory CourseDetailState.error({
    required String message,
  }) = _Error;
}
