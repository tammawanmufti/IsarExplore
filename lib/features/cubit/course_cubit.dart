import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myapp/domain/model/course.dart';
import 'package:myapp/domain/repository/course_repository.dart';

part 'course_state.dart';
part 'course_cubit.freezed.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit({required this.courseRepository})
      : super(const CourseState.initial());

  final CourseRepository courseRepository;

  void loadAllCourse() {
    final courses = courseRepository.getAllCourse();
    emit(CourseState.loaded(courses: courses));
  }

  Future<void> createCourse(String name) async {
    await courseRepository.createCourse(name);
    loadAllCourse();
  }

  Future<void> createAndAssignStudent(String name, int courseId) async {
    final student = courseRepository.createStudent(name);
    final course = courseRepository.assignStudentToCourse(
        courseId: 1, studentId: student.id);
    loadAllCourse();
  }
}
