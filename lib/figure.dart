import 'package:figar/3dview.dart';
import 'package:figar/arview.dart';
import 'package:flutter/material.dart';

class Figure extends StatefulWidget {
  final String model;
  final int fig;
  Figure({@required this.model, @required this.fig});

  @override
  _FigureState createState() => _FigureState();
}

class _FigureState extends State<Figure> {
  Map modelMap = {
    "model1": "cube",
    "model2": "cone",
    "model3": "cylinder",
    "model4": "pyramid",
    "model5": "sphere",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Figure ${widget.fig}"),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(2, (index) {
          return Center(
            child: Container(
              height: 80,
              width: 140,
              child: TextButton(
                onPressed: () {
                  if (index == 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ARview(name: modelMap[widget.model])));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DView(model: widget.model)));
                  }
                },
                child: index == 0
                    ? Center(
                        child: Text(
                        "AR View",
                        style: TextStyle(
                            fontSize: 21,
                            color: Colors.teal,
                            fontWeight: FontWeight.bold),
                      ))
                    : Center(
                        child: Text(
                        "3D View",
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
