import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';

class DView extends StatefulWidget {
  final String model;
  DView({Key key, @required this.model}) : super(key: key);

  @override
  _DViewState createState() => _DViewState();
}

class _DViewState extends State<DView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("3D View"),
      ),
      body: ModelViewer(
        backgroundColor: Colors.teal[50],
        src: 'assets/${widget.model}.gltf',
        alt: "A 3D model of an astronaut",
        ar: true,
        cameraControls: true,
        autoPlay: true,
      ),
    );
  }
}
