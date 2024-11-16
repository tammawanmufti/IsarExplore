import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/domain/model/course.dart';
import 'package:myapp/features/add_dialog.dart';
import 'package:myapp/features/cubit/course_cubit.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({super.key, required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.name),
      ),
      body: Column(
        children: [
          ListTile(
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
                      subtitle: Text(course.students[index].id.toString()),
                    );
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final name = await showAdaptiveDialog(
              context: context,
              builder: (context) => const AddDialog(title: 'Add Student'));
          if (name != null) {
            context.read<CourseCubit>().createAndAssignStudent(name, course.id);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
