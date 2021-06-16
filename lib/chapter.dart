import 'package:figar/figure.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Chapter extends StatefulWidget {
  final int chapt;
  Chapter({Key key, @required this.chapt}) : super(key: key);

  @override
  _ChapterState createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> {
  int fig = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chapter ${widget.chapt}"),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(fig, (index) {
          return Center(
            child: Container(
              height: 80,
              width: 140,
              child: TextButton(
                onPressed: () {
                  print("Subject ${index + 1}");
                  if (index != 0) {
                    Fluttertoast.showToast(
                        msg: "Empty shelves!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Figure(fig: 0)));
                  }
                },
                style: TextButton.styleFrom(
                  onSurface: Colors.blue,
                ),
                child: Center(
                    child: Text(
                  "Figure ${index + 1}",
                  style: TextStyle(
                      fontSize: 21,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold),
                )),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.tealAccent[100]),
            ),
          );
        }),
      ),
    );
  }
}
