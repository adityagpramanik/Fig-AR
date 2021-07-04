import 'package:figar/chapter.dart';
import 'package:figar/myHome.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Subject extends StatefulWidget {
  final int sub;
  final int std;
  final String name;
  Subject({@required this.sub, @required this.std, @required this.name});

  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  int chapters = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(chapters, (index) {
          return Center(
            child: Container(
              height: 80,
              width: 100,
              child: TextButton(
                onPressed: () {
                  bool check = false;
                  for (int i = 0; i < figures.length; i++) {
                    if (figures["model${i + 1}"]["class"] == widget.std &&
                        figures["model${i + 1}"]["sub"] == widget.sub &&
                        figures['model${i + 1}']["chap"] == index + 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Chapter(
                                    chap: index + 1,
                                    std: widget.std,
                                    sub: widget.sub,
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
                child: Column(
                  children: [
                    Text(
                      (index + 1).toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Chapter",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.teal[300],
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
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
