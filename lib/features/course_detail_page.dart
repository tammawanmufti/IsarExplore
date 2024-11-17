import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/domain/model/course.dart';
import 'package:myapp/features/add_dialog.dart';
import 'package:myapp/features/cubit/course_detail_cubit.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({super.key, required this.course});
  final Course course;

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  @override
  void initState() {
    context.read<CourseDetailCubit>().loadCourse(widget.course.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.course.name),
      ),
      body: BlocBuilder<CourseDetailCubit, CourseDetailState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (course) => Column(
              children: [
                ListTile(
                  onTap: () async {
                    if (course.teacher == null) {
                      final name = await showAdaptiveDialog(
                          context: context,
                          builder: (context) =>
                              const AddDialog(title: 'Add Teacher'));
                      if (name != null) {
                        context
                            .read<CourseDetailCubit>()
                            .createAndAssignTeacher(name);
                      }
                    }
                  },
                  title: Text(course.teacher?.name ?? 'No Teacher Assigned'),
                  subtitle: const Text('teacher'),
                ),
                const Divider(),
                Expanded(
                    child: ListView.builder(
                        itemCount: course.students.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(course.students[index].name),
                            subtitle:
                                Text(course.students[index].id.toString()),
                          );
                        }))
              ],
            ),
            error: (message) => Center(
              child: Text(message),
            ),
            orElse: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final name = await showAdaptiveDialog(
              context: context,
              builder: (context) => const AddDialog(title: 'Add Student'));
          if (name != null) {
            context.read<CourseDetailCubit>().createAndAssignStudent(name);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
