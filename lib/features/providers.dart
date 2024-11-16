import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/data/datasource/local_course_datasource.dart';
import 'package:myapp/data/datasource/local_course_datasource_impl.dart';
import 'package:myapp/data/localstorage/college_localstorage/college_local_db.dart';
import 'package:myapp/data/repository/course_repository_impl.dart';
import 'package:myapp/domain/repository/course_repository.dart';
import 'package:myapp/features/cubit/course_cubit.dart';
import 'package:provider/provider.dart';

final _db = CollegeLocalDB();

class AppProviders extends StatelessWidget {
  const AppProviders({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _db.init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              Provider<LocalCourseDataSource>(
                create: (context) => LocalCourseDatasourceImpl(
                  _db,
                ),
              ),
              Provider<CourseRepository>(
                create: (context) => CourseRepositoryImpl(
                  localCourseDatasource: context.read(),
                ),
              ),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => CourseCubit(
                    courseRepository: context.read(),
                  ),
                ),
              ],
              child: child,
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
