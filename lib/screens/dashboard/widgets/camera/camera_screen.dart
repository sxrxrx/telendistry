import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teledentistry_app/utils/constants.dart';
import 'package:teledentistry_app/utils/helper.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;
  Future<void>? initializeControllerBuilder;

  @override
  void initState() {
    super.initState();

    initCamera();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  initCamera() async {
    var cameras = await availableCameras();
    controller = CameraController(
      cameras.first,
      ResolutionPreset.medium,
    );

    initializeControllerBuilder = controller.initialize();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<void>(
        future: initializeControllerBuilder,
        builder: (context, snapshot) =>
            (snapshot.connectionState == ConnectionState.done)
                ? cameraPage()
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
      ),
    );
  }

  cameraPage() {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Column(
          children: [
            Flexible(
              flex: 4,
              child: Container(
                margin: const EdgeInsets.all(0),
                width: size.width,
                child: CameraPreview(controller),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                width: 70,
                height: 70,
                margin: const EdgeInsets.only(
                  top: 30,
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await initializeControllerBuilder;
                      final image = await controller.takePicture();
                      Navigator.of(context).pop(image.path);
                      setState(() {});
                    } catch (e) {
                      logger.e(e);
                    }
                  },
                  child: const Icon(Icons.camera_alt_sharp),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    primary: kPrimaryColor,
                    onPrimary: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        AspectRatio(
          aspectRatio: _isLandscape()
              ? controller.value.aspectRatio
              : (1 / controller.value.aspectRatio),
          child: Image.asset('assets/images/focus.png'),
        )
      ],
    );
  }

  bool _isLandscape() {
    return <DeviceOrientation>[
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ].contains(_getApplicableOrientation());
  }

  DeviceOrientation _getApplicableOrientation() {
    return controller.value.isRecordingVideo
        ? controller.value.recordingOrientation!
        : (controller.value.previewPauseOrientation ??
            controller.value.lockedCaptureOrientation ??
            controller.value.deviceOrientation);
  }
}
