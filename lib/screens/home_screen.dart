import 'package:flutter/material.dart';
import 'package:sprints_http_task/models/employee.dart';
import 'package:sprints_http_task/screens/widgets/employee_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Employee> employees = [
    Employee(
        id: 123,
        employeeName: 'yara',
        employeeSalary: 125648,
        employeeAge: 66,
        profileImage: 'profileImage'),
    Employee(
        id: 123,
        employeeName: 'yara',
        employeeSalary: 125648,
        employeeAge: 66,
        profileImage: 'profileImage'),
    Employee(
        id: 123,
        employeeName: 'yara',
        employeeSalary: 125648,
        employeeAge: 66,
        profileImage: 'profileImage'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                final employee = employees[index];
                return EmployeeCard(employee: employee);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.green),
                foregroundColor: WidgetStateProperty.all(Colors.white),
              ),
              onPressed: () {},
              child: Text('Get Employees'),
            ),
          ),
        ],
      ),
    );
  }
}
