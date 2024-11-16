import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myapp/domain/model/course.dart';
import 'package:myapp/domain/repository/course_repository.dart';

part 'course_detail_state.dart';
part 'course_detail_cubit.freezed.dart';

class CourseDetailCubit extends Cubit<CourseDetailState> {
  CourseDetailCubit({
    required this.courseRepository,
  }) : super(const CourseDetailState.initial());

  final CourseRepository courseRepository;

  void loadCourse(int courseId) {
    final course = courseRepository.getCourse(courseId);
    if (course == null) {
      emit(const CourseDetailState.error(message: 'Course not found'));
      return;
    }
    emit(CourseDetailState.loaded(course: course));
  }

  Future<void> createAndAssignStudent(
    String name,
  ) async {
    final courseId = state.maybeWhen(
      loaded: (course) => course.id,
      orElse: () => null,
    );

    if (courseId == null) {
      emit(const CourseDetailState.error(message: 'Course not found'));
      return;
    }

    final student = await courseRepository.createStudent(name);
    await courseRepository.assignStudentToCourse(
        courseId: courseId, studentId: student.id);
    loadCourse(courseId);
  }
}
