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
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 138, 9, 9),
          child: Text(
            employee.id.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: Text(employee.name),
        subtitle: Text('Username: ${employee.username}'),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email: ${employee.email}'),
                Text('Phone: ${employee.phone}'),
                Text('Website: ${employee.website}'),
                const SizedBox(height: 8),
                Text('Address:',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('Street: ${employee.address.street}'),
                Text('Suite: ${employee.address.suite}'),
                Text('City: ${employee.address.city}'),
                Text('Zipcode: ${employee.address.zipcode}'),
                const SizedBox(height: 8),
                Text('Company:',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('Name: ${employee.company.name}'),
                Text('Catchphrase: ${employee.company.catchPhrase}'),
                Text('BS: ${employee.company.bs}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
