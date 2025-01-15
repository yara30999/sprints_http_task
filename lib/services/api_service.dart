import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sprints_http_task/models/employee.dart';

class ApiService {
  // static const String apiUrl =
  //     'https://hub.dummyapis.com/employee?noofRecords=10&idStarts=1001';

  static const String apiUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<List<Employee>> getEmployees() async {
    List<Employee> employees = [];
    final response = await http.get(
      Uri.parse(apiUrl),
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      employees = data.map((json) => Employee.fromJson(json)).toList();
      return employees;
    } else {
      throw Exception('Failed to load employee data');
    }
  }
}
