import 'package:figar/myHome.dart';
import 'package:figar/subject.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

List<String> subjects = ["Maths", "Science"];

class Standard extends StatefulWidget {
  final int std;
  Standard({this.std});

  @override
  _StandardState createState() => _StandardState();
}

class _StandardState extends State<Standard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Class ${widget.std}"),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(subjects.length, (index) {
          return Center(
            child: Container(
              height: 80,
              width: 140,
              child: TextButton(
                onPressed: () {
                  bool check = false;
                  for (int i = 0; i < figures.length; i++) {
                    if (figures["model${i + 1}"]["class"] == widget.std &&
                        figures["model${i + 1}"]["sub"] == index + 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Subject(sub: index + 1, std: widget.std, name: subjects[index],)));
                      check = true;
                      break;
                    }
                  }
                  
                  print("Subject ${index + 1}");
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
                  subjects[index],
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
