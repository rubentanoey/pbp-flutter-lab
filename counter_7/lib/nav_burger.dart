import 'package:counter_7/add_budget.dart';
import 'package:counter_7/budget_data.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';

class NavBurger extends StatelessWidget {
  const NavBurger({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('counter_7'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(title: 'counter_7')),
              );
            },
          ),
          ListTile(
            title: const Text('Tambah Budget'),
            onTap: () {
              // Route menu ke halaman tambah budget
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddBudget()),
              );
            },
          ),
          ListTile(
            title: const Text('Data Budget'),
            onTap: () {
              // Route menu ke halaman data budget
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BudgetData()),
              );
            },
          ),
        ],
      ),
    );
  }
}