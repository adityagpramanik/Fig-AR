import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class Figure extends StatefulWidget {
  final int fig;
  Figure({Key key, @required this.fig}) : super(key: key);

  @override
  _FigureState createState() => _FigureState();
}

class _FigureState extends State<Figure> {
  ArCoreController arCoreController;

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;

    // _addCube(arCoreController);
    arCoreController.onPlaneTap = _handleOnPlaneTap;
  }

  void _handleOnPlaneTap(List<ArCoreHitTestResult> hits) {
    final hit = hits.first;
    _addToucano(hit);
  }

  void _addToucano(ArCoreHitTestResult plane) {
    final toucanNode = ArCoreReferenceNode(
        name: "Toucano",
        objectUrl: "https://github.com/adityagpramanik/D-Vis/blob/main/cube.gltf",
        // objectUrl:
        //     "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF/Duck.gltf",
        position: plane.pose.translation,
        rotation: plane.pose.rotation);

    arCoreController.addArCoreNodeWithAnchor(toucanNode);
  }
  // void _addCube(ArCoreController controller) {
  //   final material = ArCoreMaterial(
  //     color: Color.fromARGB(120, 66, 134, 244),
  //     metallic: 1.0,
  //   );
  //   final cube = ArCoreCube(
  //     materials: [material],
  //     size: vector.Vector3(0.5, 0.5, 0.5),
  //   );
  //   final node = ArCoreNode(
  //     shape: cube,
  //     position: vector.Vector3(-0.5, 0.5, -3.5),
  //   );
  //   controller.addArCoreNode(node);
  // }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Figure ${widget.fig}"),
        centerTitle: true,
      ),
      body: ArCoreView(onArCoreViewCreated: _onArCoreViewCreated),
    );
  }
}
