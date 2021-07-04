import 'package:figar/figure.dart';
import 'package:figar/myHome.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Chapter extends StatefulWidget {
  final int chap;
  final int std, sub;
  Chapter({@required this.chap, @required this.std, @required this.sub});

  @override
  _ChapterState createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> {
  int fig = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chapter ${widget.chap}"),
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
                  bool check = false;
                  for (int i = 0; i < figures.length; i++) {
                    if (figures["model${i + 1}"]["class"] == widget.std &&
                        figures["model${i + 1}"]["sub"] == widget.sub &&
                        figures['model${i + 1}']["chap"] == widget.chap &&
                        figures['model${i + 1}']['fig'] == index + 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Figure(
                                    model: 'model${i+1}',
                                    fig: index +1,
                                  )));
                      check = true;
                      break;
                    }
                  }
                  print("Chapter ${index + 1}");
                  if (!check) {
                    Fluttertoast.showToast(
                        msg: "Empty shelves!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black26,
                        textColor: Colors.white,
                        fontSize: 16.0);
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
