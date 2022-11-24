import 'package:flutter/material.dart';
import 'package:counter_7/nav_burger.dart';
import 'package:counter_7/pages/mywatchlist_specs.dart';
import 'package:counter_7/utils/mywatchlist_webgetter.dart';

class MyWatchListRoute extends StatefulWidget {
  const MyWatchListRoute({super.key});

  @override
  State<MyWatchListRoute> createState() => _DataWatchListState();
}

class _DataWatchListState extends State<MyWatchListRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Watch List'),
        ),
        drawer: const NavBurger(),
        body: FutureBuilder(
            future: getWatchList(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Watch List Kosong!",
                        style:
                        TextStyle(color: Color(0xffDC3545), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(5.0),
                            shadowColor: Colors.blueGrey,
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 2,
                                    color: snapshot.data![index].fields.watched
                                        ? const Color(0xff198754)
                                        : const Color(0xff191D87)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              leading: Checkbox(
                                activeColor: Colors.white,
                                checkColor: Colors.black,
                                focusColor: Colors.yellow,
                                value: snapshot.data![index].fields.watched,
                                onChanged: (bool? value) {
                                  setState(() {
                                    snapshot.data![index].fields.watched =
                                    value!;
                                  });
                                },
                              ),
                              title: Text(
                                  snapshot.data![index].fields.title,
                                  style: const TextStyle(
                                      color: Colors.black
                                  ),
                              ),
                              onTap: () {
                                // Route menu ke halaman utama
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MWLSpecsRoute(
                                            movie: snapshot.data![index],
                                          ),
                                    ));
                              },

                            )),
                      ));
                }
              }
            })
    );
  }
}