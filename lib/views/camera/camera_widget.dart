import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:bweird_flutter_toolkit/shared/components/appbar_widget.dart';

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    availableCameras().then((value) => initialCamera(value));
  }

  initialCamera(value) {
    controller = CameraController(value[0], ResolutionPreset.ultraHigh);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null) {
      return Container();
    }
    return Scaffold(
      appBar: AppbarWidget(title: "ថតរូប"),
      body: CameraPreview(controller),
    );
  }
}
