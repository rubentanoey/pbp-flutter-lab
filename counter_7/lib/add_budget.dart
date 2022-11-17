import 'package:counter_7/budget_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/nav_burger.dart';
import 'data_store.dart' as globals;

class AddBudget extends StatefulWidget {
    const AddBudget({super.key});

    @override
    State<AddBudget> createState() => _AddBudgetState();
}

class _AddBudgetState extends State<AddBudget> {
    final _formKey = GlobalKey<FormState>();
    String? _judul;
    int? nominal;
    String? jenisBudget;
    List<String> listJenisBudget = ['Pemasukan', 'Pengeluaran'];
    DateTime date = DateTime.now();

    onPressed(BuildContext context) {
        var data =
        globals.BudgetProperty(judul: _judul!, nominal: nominal!, jenisBudget: jenisBudget!, date: date);
        globals.budget_list.add(data);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const BudgetData()),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Form Budget'),
            ),
            drawer: const NavBurger(),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                            children: [
                                Padding(
                                    // Menggunakan padding sebesar 8 pixels
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Listrik November",
                                            labelText: "Judul",
                                            // Menambahkan circular border agar lebih rapi
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.0),
                                            ),
                                        ),
                                        // Menambahkan behavior saat nama diketik
                                        onChanged: (String? value) {
                                            setState(() {
                                                _judul = value!;
                                            });
                                        },
                                        // Menambahkan behavior saat data disimpan
                                        onSaved: (String? value) {
                                            setState(() {
                                                _judul = value!;
                                            });
                                        },
                                        // Validator sebagai validasi form
                                        validator: (String? value) {
                                            if (value == null || value.isEmpty) {
                                                return 'Judul tidak boleh kosong!';
                                            }
                                            return null;
                                        },
                                    ),
                                ),
                                Padding(
                                    // Menggunakan padding sebesar 8 pixels
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "120000",
                                            labelText: "Nominal",
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                            ),
                                        ),
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.digitsOnly
                                        ],
                                        onChanged: (String? value) {
                                            setState(() {
                                                if (value != '') {
                                                    nominal = int.parse(value!);
                                                }
                                            });
                                        },
                                        // Menambahkan behavior saat data disimpan
                                        onSaved: (String? value) {
                                            setState(() {
                                                if (value != '') {
                                                    nominal = int.parse(value!);
                                                }
                                            });
                                        },
                                        // Validator sebagai validasi form
                                        validator: (String? value) {
                                            if (value == null || value.isEmpty) {
                                                return 'Nominal tidak boleh kosong!';
                                            }
                                            return null;
                                        },
                                    ),
                                ),
                                ListTile(
                                    title: Text(date.toString()),
                                    leading: TextButton.icon(
                                        icon: const Icon(Icons.calendar_today),
                                        label: const Text("Pilih Tanggal"),
                                        onPressed: () {
                                            showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2000),
                                                lastDate: DateTime(2099),
                                            ).then((date) {
                                                //tambahkan setState dan panggil variabel _dateTime.
                                                setState(() {
                                                    this.date = date!;
                                                });
                                            });
                                        },
                                    ),
                                ),
                                DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        value: jenisBudget,
                                        icon: const Icon(Icons.arrow_drop_down),
                                        items: listJenisBudget.map((String items) {
                                            return DropdownMenuItem(
                                                value: items,
                                                child: Text(items),
                                            );
                                        }).toList(),
                                        onChanged: (String? jenis) {
                                            setState(() {
                                                jenisBudget = jenis!;
                                            });
                                        },
                                        hint: Container(
                                            width: 180, //and here
                                            child: const Text(
                                                "Pilih Jenis",
                                                style: TextStyle(color: Colors.grey),
                                                textAlign: TextAlign.center,
                                            ),
                                        ),
                                    ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                            padding: const EdgeInsets.all(16.0),
                                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            alignment: Alignment.center),
                                        onPressed: () {
                                            if (_formKey.currentState!.validate()) {
                                                if (jenisBudget == null || jenisBudget == '') {
                                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                        content: Text("Jenis budget tidak boleh kosong!"),
                                                    ));
                                                } else {
                                                    onPressed(context);
                                                }
                                            }
                                        },
                                        child: const Text(
                                            "Simpan",
                                            style: TextStyle(color: Colors.white),
                                        ),
                                    ),
                                ),
                            ],
                        ),
                    ),
                ),
            ),
        );
    }
}