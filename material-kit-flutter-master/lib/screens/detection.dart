import 'dart:async';
import 'dart:math';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opencv/opencv.dart';
import 'package:camera/camera.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart';
import 'package:image/image.dart' as imageLib;
import 'package:path_provider/path_provider.dart';
import 'package:material_kit_flutter/screens/image_utils.dart';
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


  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    //initializeCamera();
    //startimage();

  }


  List<Face> _faces = [];
  final _scanKey = GlobalKey<CameraMlVisionState>();
  CameraLensDirection cameraLensDirection = CameraLensDirection.front;
  FaceDetector detector =
  FirebaseVision.instance.faceDetector(FaceDetectorOptions(
    enableClassification: true,
    enableTracking: true,
    enableContours: true,
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
              startimage();
            });
          },

          onDispose: () {

            detector.close();
          },
        ),
      ),
    );
  }
  //CameraController cameraController = CameraMlVisionState().cameraController;
  void startimage() async  {
    //cameraController.initialize();
    CameraImage cam;
    await CameraMlVisionState().cameraController.startImageStream(onLatestImageAvailable(cam) );




  }
  Interpreter _interpreter;

  void loadModel({Interpreter interpreter}) async {

    _interpreter = interpreter ??
        await Interpreter.fromAsset(
          "emotion_model.tflite",
          options: InterpreterOptions()
            ..threads = 2,
        );
  }
  ImageProcessor imageProcessor;
  TensorImage getProcessedImage(TensorImage inputImage) {
    //padSize = max(inputImage.height, inputImage.width);
    if (imageProcessor == null) {
      imageProcessor = ImageProcessorBuilder().add(ResizeOp(48, 48, ResizeMethod.NEAREST_NEIGHBOUR)).build();
    }
    inputImage = imageProcessor.process(inputImage);
    return inputImage;
  }
//Interpreter _interpreter = Interpreter.fromAsset("assets/emotion_model.tflite");
  onLatestImageAvailable(cam) async {
  /*Map <int, String> emotion = {0: "Angry", 1: "Disgusted", 2: "Fearful", 3: "Happy", 4: "Neutral", 5: "Sad", 6: "Surprised"};
  List <Face> inb = _faces;

  int left = lef.round();
  int right = rig.round();
  int top = boundingbox.top.round();
  int bottom = boundingbox.bottom.round();
  int scalx = scalex.round();
  int scaly = scaley.round();
  Object oi;

  imageLib.Image rgbimg = ImageUtils.convertCameraImage(cam);
  imageLib.Image grayimg = ImageUtils.grayscale(rgbimg);
  imageLib.Image croppedImage = imageLib.copyCrop(grayimg, left * scalx, top * scaly, right * scalx, bottom * scaly);
  /*imageLib.Image resiz = imageLib.copyResize(croppedImage, height: 48,
      width: 48,
      interpolation: Interpolation.nearest);*/
  TensorImage inputImage = TensorImage.fromImage(croppedImage);
  TensorImage inp = getProcessedImage(inputImage);


  loadModel();
  Object inputs = inp.buffer;
  TensorBuffer output ;
  _interpreter.run(inputs, output);
  oi = output.buffer;
  //sleep(new Duration(seconds: 2));
*/

//for(int i = 0; i <= 10000;i++ ){
//print("he");
//}
Timer(const Duration(milliseconds: 3000), (){
  int oi = 0;
  if(oi == 0){
    Navigator.pushReplacementNamed(context, "/angry");

  }else if (oi == 1 || oi == 2){
    Navigator.pushReplacementNamed(context, "/fear");
  }
  else if (oi == 3 || oi == 6){
    Navigator.pushReplacementNamed(context, "/happy");
  }
  else if (oi == 4 || oi == 5){
    Navigator.pushReplacementNamed(context, "/sad");

  }

});

  }
}

final picker = ImagePicker();
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

Rect boundingbox;
double lef, rig, cen, scalex,scaley;
Rect _reflectionRect(bool reflection, Rect boundingBox, double width) {
 boundingbox  = boundingBox;
  if (!reflection) {
    return boundingBox;
  }
  final centerX = width / 2;
  cen = centerX;
  final left = ((boundingBox.left - centerX) * -1) + centerX;
  lef = left;
  final right = ((boundingBox.right - centerX) * -1) + centerX;
  rig = right;
  return Rect.fromLTRB(left, boundingBox.top, right, boundingBox.bottom);
}

Rect _scaleRect({

  @required Rect rect,
  @required Size imageSize,
  @required Size widgetSize,
}) {
  final scaleX = widgetSize.width / imageSize.width;
  scalex = scaleX;
  final scaleY = widgetSize.height / imageSize.height;
  scaley = scaleY;
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
        CameraController(cameras[1], ResolutionPreset.high, enableAudio: false);
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
            aspectRatio: cameraController.value.aspectRatio:1,
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



