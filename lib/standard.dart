import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:figar/subject.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:flutter/material.dart';

List<int> subjects = [3, 3, 4, 4, 4, 6, 6, 6, 6, 6, 7, 7];

class Standard extends StatefulWidget {
  final int std;
  Standard({Key key, @required this.std}) : super(key: key);

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
          children: List.generate(subjects[widget.std], (index) {
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
                              builder: (context) => Subject(sub: 0)));
                    }
                  },
                  style: TextButton.styleFrom(
                    onSurface: Colors.blue,
                  ),
                  child: Center(
                      child: Text(
                    "Subject ${index + 1}",
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
