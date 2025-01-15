import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sprints_http_task/models/employee.dart';
import 'package:sprints_http_task/screens/widgets/employee_card.dart';
import 'package:sprints_http_task/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();
  List<Employee> employees = [];

  Future<void> getEmployeeData() async {
    try {
      final data = await apiService.getEmployees();
      setState(() {
        employees = data;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (employees.isEmpty)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 60,
                children: [
                  Lottie.asset('assets/loading.json', height: 300),
                  Text('Click the Get Employees button.')
                ],
              ),
            ),
          if (employees.isNotEmpty)
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
              onPressed: getEmployeeData,
              child: Text('Get Employees'),
            ),
          ),
        ],
      ),
    );
  }
}
