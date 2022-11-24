import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/pages/budget_adder.dart';
import 'package:counter_7/nav_burger.dart';
import '../models/budget_store.dart' as stored;

class BudgetRoute extends StatefulWidget {
  const BudgetRoute({super.key});

  @override
  State<BudgetRoute> createState() => _DataBudgetState();
}

class _DataBudgetState extends State<BudgetRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Budget'),
      ),
      drawer: const NavBurger(),
      body: Center(
          child: ListView.builder(
            itemCount: stored.budget_list.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(5.0),
                    shadowColor: Colors.blueGrey,
                    child: ListTile(
                      title: Text(stored.budget_list[index].judul),
                      subtitle: Text(stored.budget_list[index].nominal.toString()),
                      trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(stored.budget_list[index].jenisBudget),
                            Text(
                              stored.budget_list[index].date.toString(),
                              style: const TextStyle(color: Colors.teal),
                            )
                          ]),
                    )),
              );
            }),
          )),
    );
  }
}