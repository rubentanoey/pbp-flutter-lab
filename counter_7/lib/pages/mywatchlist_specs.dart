import 'package:counter_7/models/mywatchlist_store.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/nav_burger.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class MWLSpecsRoute extends StatelessWidget {
  final MyWatchList movie;

  const MWLSpecsRoute({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('MMM dd, yyyy');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      drawer: const NavBurger(),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Column(
                    children: [
                      Text(
                        movie.fields.title,
                        style: const TextStyle(
                            fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ListTile(
                        leading: const Text(
                          'Release Date: ',
                          style: TextStyle(
                              fontSize: 14),
                        ),
                        trailing: Text(
                          formatter.format(movie.fields.releaseDate).toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                        dense: true,
                      ),
                      ListTile(
                        leading: const Text(
                          'Rating: ',
                          style: TextStyle(
                              fontSize: 14),
                        ),
                        trailing: Text(
                          '${movie.fields.rating} / 5',
                          style: const TextStyle(fontSize: 20),
                        ),
                        dense: true,
                      ),
                      ListTile(
                        leading: const Text(
                          'Status: ',
                          style: TextStyle(
                              fontSize: 14),
                        ),
                        trailing: Text(
                          movie.fields.watched ? "Watched" : "Not Watched",
                          style: const TextStyle(fontSize: 20),
                        ),
                        dense: true,
                      ),
                      ListTile(
                          title: const Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              'Review: ',
                              style: TextStyle(
                                  fontSize: 14),
                            ),
                          ),
                          dense: true,
                          subtitle: Text(
                            movie.fields.review,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black),
                          )),
                    ],
                  ),
                  const Spacer(),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.all(15.0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.center),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Back",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}