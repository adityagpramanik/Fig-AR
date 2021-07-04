import 'package:figar/standard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Map figures = {
  "model1": {"class": 7, "sub": 1, "chap": 15, "fig": 1},
  "model2": {"class": 7, "sub": 1, "chap": 15, "fig": 2},
  "model3": {"class": 7, "sub": 1, "chap": 15, "fig": 3},
  "model4": {"class": 7, "sub": 1, "chap": 15, "fig": 4},
  "model5": {"class": 7, "sub": 1, "chap": 15, "fig": 5},
};

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, @required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          title: Text('Fig-AR'),
          centerTitle: true,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(12, (index) {
            return Center(
              child: Container(
                height: 80,
                width: 140,
                child: TextButton(
                  onPressed: () {
                    bool check = false;
                    for (int i = 0; i < figures.length; i++) {
                      if (figures["model${i + 1}"]["class"] == index + 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Standard(std: index + 1)));
                        check = true;
                        break;
                      }
                    }
                    print("Class ${index + 1}");
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
                    "Class ${index + 1}",
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
      ),
    );
  }
}
