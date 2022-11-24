import 'package:counter_7/models/mywatchlist_store.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<MyWatchList>> getWatchList() async {
  var url = Uri.parse('https://rubentanoey-pbp2.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // decoding response into json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // json to MyWatchList
  List<MyWatchList> mywatchlist = [];
  for (var d in data) {
    if (d != null) {
      mywatchlist.add(MyWatchList.fromJson(d));
    }
  }

  return mywatchlist;
}