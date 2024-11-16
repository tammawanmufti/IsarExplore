import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/add_dialog.dart';
import 'package:myapp/features/course_detail_page.dart';
import 'package:myapp/features/cubit/course_cubit.dart';

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
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return CourseDetailPage(course: courses[index]);
                      }));
                    },
                    title: Text(courses[index].name),
                  );
                });
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final courseName = await showAdaptiveDialog(
              context: context,
              builder: (context) => const AddDialog(title: 'Add Course'));
          if (mounted && courseName != null) {
            context.read<CourseCubit>().createCourse(courseName);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
