import 'package:figar/chapter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Subject extends StatefulWidget {
  final int sub;
  Subject({Key key, @required this.sub}) : super(key: key);

  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  int chapters = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subject ${widget.sub}"),
        centerTitle: true,
      ),
      body: GridView.count(
          crossAxisCount: 3,
          children: List.generate(chapters , (index) {
            return Center(
              child: Container(
                height: 55,
                width: 100,
                child: TextButton(
                  onPressed: () {
                    print("Chapter ${index + 1}");
                    if (index + 1 != 15) {
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
                              builder: (context) => Chapter(chapt: 15)));
                    }
                  },
                  style: TextButton.styleFrom(
                    onSurface: Colors.blue,
                  ),
                  child: Center(
                      child: Text(
                    "Chapter ${index + 1}",
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
