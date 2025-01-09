import 'package:flutter/material.dart';
import 'package:sprints_http_task/models/employee.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({
    super.key,
    required this.employee,
  });

  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 138, 9, 9),
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
        title: Text(employee.employeeName),
        subtitle: Text(
            'Age: ${employee.employeeAge}, Salary: ${employee.employeeSalary}'),
        trailing: Text(employee.id.toString()),
      ),
    );
  }
}
