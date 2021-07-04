import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';

class ARview extends StatefulWidget {
  final String name;
  ARview({Key key, @required this.name}) : super(key: key);

  @override
  _ARviewState createState() => _ARviewState(name);
}

class _ARviewState extends State<ARview> {
  String name;
  _ARviewState(this.name);
  
  ArCoreController arCoreController;

  void onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onNodeTap = (name) => onTapHandler(name);
    arCoreController.onPlaneTap = _handleOnPlaneTap;
  }

  void _handleOnPlaneTap(List<ArCoreHitTestResult> hits) {
    final hit = hits.first;
    addModel(hit);
  }

  void addModel(ArCoreHitTestResult plane) {
    final toucanNode = ArCoreReferenceNode(
        name: name,
        objectUrl:
            "https://github.com/adityagpramanik/Models-Fig-AR/raw/master/${name}_static.gltf",
        position: plane.pose.translation,
        rotation: plane.pose.rotation);

    arCoreController.addArCoreNodeWithAnchor(toucanNode);
  }

  void onTapHandler(String name) {
    print("Flutter: onNodeTap");
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Row(
          children: <Widget>[
            Text('Remove $name?'),
            IconButton(
                icon: Icon(
                  Icons.delete,
                ),
                onPressed: () {
                  arCoreController.removeNode(nodeName: name);
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    arCoreController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AR View"),
      ),
      body: ArCoreView(onArCoreViewCreated: onArCoreViewCreated),
    );
  }
}
