library counter_7.globals;
import 'package:counter_7/pages/budget_adder.dart';

class BudgetProperty {
  late String judul;
  late int nominal;
  late String jenisBudget;
  late DateTime date;

  BudgetProperty(
      {required this.judul, required this.nominal, required this.jenisBudget, required this.date});
}

List<BudgetProperty> budget_list = [];