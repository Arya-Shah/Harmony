import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opencv/opencv.dart';
import 'package:camera/camera.dart';

import 'package:flutter_camera_ml_vision/flutter_camera_ml_vision.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';


import 'package:material_kit_flutter/screens/camera_view_singleton.dart';

//widgets


class detection extends StatefulWidget{
  _detectionstate createState() => _detectionstate();
}
class _detectionstate extends State<detection>{

  bool switchValueOne;
  bool switchValueTwo;
  /// List of available cameras
  List<CameraDescription> cameras;

  /// Controller
  CameraController cameraController;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    //initializeCamera();

  }
  List<Face> _faces = [];
  final _scanKey = GlobalKey<CameraMlVisionState>();
  CameraLensDirection cameraLensDirection = CameraLensDirection.front;
  FaceDetector detector =
  FirebaseVision.instance.faceDetector(FaceDetectorOptions(
    enableTracking: true,
    mode: FaceDetectorMode.accurate,
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detection"),
      ),
      body: SizedBox.expand(
        child: CameraMlVision<List<Face>>(
          key: _scanKey,
          cameraLensDirection: cameraLensDirection,
          detector: detector.processImage,
          overlayBuilder: (c) {
            return CustomPaint(
              painter: FaceDetectorPainter(
                  _scanKey.currentState.cameraValue.previewSize.flipped, _faces,
                  reflection: cameraLensDirection == CameraLensDirection.front),
            );
          },
          onResult: (faces) {
            if (faces == null || faces.isEmpty || !mounted) {
              return;
            }
            setState(() {
              _faces = [...faces];
            });
          },
          onDispose: () {
            detector.close();
          },
        ),
      ),
    );
  }
}

class FaceDetectorPainter extends CustomPainter {
  FaceDetectorPainter(this.imageSize, this.faces, {this.reflection = false});

  final bool reflection;
  final Size imageSize;
  final List<Face> faces;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = Colors.red;

    for (final face in faces) {
      final faceRect =
      _reflectionRect(reflection, face.boundingBox, imageSize.width);
      canvas.drawRect(
        _scaleRect(
          rect: faceRect,
          imageSize: imageSize,
          widgetSize: size,
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(FaceDetectorPainter oldDelegate) {
    return oldDelegate.imageSize != imageSize || oldDelegate.faces != faces;
  }
}

Rect _reflectionRect(bool reflection, Rect boundingBox, double width) {
  if (!reflection) {
    return boundingBox;
  }
  final centerX = width / 2;
  final left = ((boundingBox.left - centerX) * -1) + centerX;
  final right = ((boundingBox.right - centerX) * -1) + centerX;
  return Rect.fromLTRB(left, boundingBox.top, right, boundingBox.bottom);
}

Rect _scaleRect({
  @required Rect rect,
  @required Size imageSize,
  @required Size widgetSize,
}) {
  final scaleX = widgetSize.width / imageSize.width;
  final scaleY = widgetSize.height / imageSize.height;

  final scaledRect = Rect.fromLTRB(
    rect.left.toDouble() * scaleX,
    rect.top.toDouble() * scaleY,
    rect.right.toDouble() * scaleX,
    rect.bottom.toDouble() * scaleY,
  );
  return scaledRect;
}


    /*void initializeCamera() async {
   //WidgetsFlutterBinding.ensureInitialized();


    cameras = await availableCameras();

    // cameras[0] for rear-camera
    cameraController =
        CameraController(cameras[1], ResolutionPreset.veryHigh, enableAudio: false);
   cameraController.initialize();


    cameraController.initialize().then((_) async {
      // Stream of image passed to [onLatestImageAvailable] callback
      //await cameraController.startImageStream(onLatestImageAvailable);

      /// previewSize is size of each image frame captured by controller
      ///
      /// 352x288 on iOS, 240p (320x240) on Android with ResolutionPreset.low
      Size previewSize = cameraController.value.previewSize;

      /// previewSize is size of raw input image to the model
      //CameraViewSingleton.inputImageSize = previewSize;

      // the display width of image on screen is
      // same as screenWidth while maintaining the aspectRatio
      final Size screenSize = MediaQuery.of(context).size;
      CameraViewSingleton.screenSize = screenSize;
      CameraViewSingleton.ratio = screenSize.width / previewSize.height;
      _initializeControllerFuture = cameraController.initialize();


    });
  }

  @override
  Widget build(BuildContext context) {


    //final Size screenSize = MediaQuery.of(context).size;


      // Return empty container while the camera is not initialized
      if (cameraController == null || !cameraController.value.isInitialized) {

        return Center(child: CircularProgressIndicator());
      } else {

        return AspectRatio(
            aspectRatio: cameraController.value.aspectRatio,
            child: CameraPreview(cameraController));
      }



  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      cameraController != null
          ? _initializeControllerFuture = cameraController.initialize()
          : null; //on pause camera is disposed, so we need to call again "issue is only for android"
    }
  }
  @override
  void dispose() {
    //WidgetsBinding.instance.removeObserver(this);
    cameraController.dispose();
    super.dispose();
  }
*/



