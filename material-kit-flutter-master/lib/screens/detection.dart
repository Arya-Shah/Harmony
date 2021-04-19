import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opencv/opencv.dart';
import 'package:camera/camera.dart';



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
    initializeCamera();

  }
  void initializeCamera() async {
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



}
