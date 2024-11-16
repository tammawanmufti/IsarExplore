import 'package:flutter/material.dart';
import 'package:myapp/domain/model/course.dart';

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
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              title: Text(course.students[index].name),
              subtitle: Text(course.students[index].id),
            );
          }))
        ],
      ),
    );
  }
}
