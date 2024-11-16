import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/data/datasource/local_course_datasource.dart';
import 'package:myapp/data/datasource/local_course_datasource_impl.dart';
import 'package:myapp/data/localstorage/college_localstorage/college_local_db.dart';
import 'package:myapp/data/repository/course_repository_impl.dart';
import 'package:myapp/domain/repository/course_repository.dart';
import 'package:myapp/features/cubit/course_cubit.dart';
import 'package:provider/provider.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CollegeLocalDB>(create: (context) => CollegeLocalDB()..init()),
        Provider<LocalCourseDataSource>(
          create: (context) => LocalCourseDatasourceImpl(
            context.read(),
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
        child: const CoursePage(),
      ),
    );
  }
}

class CoursePage extends StatefulWidget {
  const CoursePage({
    super.key,
  });

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  void initState() {
    context.read<CourseCubit>().loadAllCourse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Isar Course App'),
      ),
      body: BlocBuilder<CourseCubit, CourseState>(
        builder: (context, state) {
          return state.maybeWhen(orElse: () {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }, loaded: (courses) {
            return ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(courses[index].name),
                  );
                });
          });
        },
      ),
    );
  }
}
