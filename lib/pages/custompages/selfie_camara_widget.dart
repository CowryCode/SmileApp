// import 'dart:async';
// import 'dart:io';
//
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
//
// class SelfieCameraWidget extends StatefulWidget {
//   static SelfieCameraWidgetState of(BuildContext context) =>
//       context.ancestorStateOfType(const TypeMatcher<SelfieCameraWidgetState>());
//
//   @override
//   State<StatefulWidget> createState() => new SelfieCameraWidgetState();
// }
//
// class SelfieCameraWidgetState extends State<SelfieCameraWidget> {
//   List<CameraDescription>? cameras;
//   CameraController? controller;
//   bool isReady = false;
//   bool noCameraDevice = false;
//   int selectedCamera = 1;
//
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _setupCamera();
//   }
//
//   Future<void> _setupCamera() async {
//     try {
//       // initialize cameras.
//       cameras = await availableCameras();
//       // initialize camera controllers.
//       controller = new CameraController(
//           cameras[selectedCamera], ResolutionPreset.medium
//       );
//
//       await controller!.initialize();
//     } on CameraException catch (_) {
//       debugPrint("Some error occured!");
//     }
//
//     if (!mounted) {
//       return;
//     }
//
//     setState(() {
//       isReady = true;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (controller == null || !controller!.value.isInitialized) {
//       return new Container();
//     }
//     return new AspectRatio(
//         aspectRatio: controller!.value.aspectRatio,
//         child: new CameraPreview(controller!));
//   }
//
//   String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
//
//   void showInSnackBar(String message) {
//     _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(message)));
//   }
//
//   void logError(String code, String message) =>
//       print('Error: $code\nError Message: $message');
//
//   void toggleCamera(){
//     setState(() {
//       selectedCamera = (selectedCamera == 1) ? 0: 1;
//       _setupCamera();
//     });
//   }
//
//   Future<String> takePicture() async {
//     if (!controller.value.isInitialized) {
//       showInSnackBar('Error: select a camera first.');
//       return null;
//     }
//     final Directory extDir = await getApplicationDocumentsDirectory();
//     final String dirPath = '${extDir.path}/Pictures/trekker_trek';
//     await Directory(dirPath).create(recursive: true);
//     final String filePath = '$dirPath/${timestamp()}.jpg';
//
//     if (controller.value.isTakingPicture) {
//       // A capture is already pending, do nothing.
//       return null;
//     }
//
//     try {
//       await controller.takePicture(filePath);
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       return null;
//     }
//     return filePath;
//   }
//
//   void _showCameraException(CameraException e) {
//     logError(e.code, e.description);
//     showInSnackBar('Error: ${e.code}\n${e.description}');
//   }
// }