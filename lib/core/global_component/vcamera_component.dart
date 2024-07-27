import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:merchant_app/core/global_component/vcustom_button.dart';
import 'package:merchant_app/core/global_component/vdefault_screen_loading.dart';
import 'package:merchant_app/core/utils/cconstant.dart';
import 'package:merchant_app/core/utils/vcolor_utils.dart';
import 'package:merchant_app/core/utils/vimage_constant.dart';
import 'package:path_provider/path_provider.dart';

class VCameraComponent extends StatefulWidget {
  const VCameraComponent({
    super.key,
    this.child,
    required this.getDataScan,
  });

  final Widget? child;
  final Function(List<String>) getDataScan;

  @override
  State<VCameraComponent> createState() => _VCameraComponentState();
}

class _VCameraComponentState extends State<VCameraComponent> {
  late List<CameraDescription> camerasPort;

  CameraController? controller;
  bool flashlightStatus = false;
  bool isCameraInitialized = false;
  String statusTitle = "on";

  bool loading = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  initializeCamera() async {
    camerasPort = await availableCameras();
    controller = CameraController(camerasPort[0], ResolutionPreset.max);
    controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        isCameraInitialized = true;
      });
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  setFlashLight() async {
    try {
      if (flashlightStatus == false) {
        await controller?.setFlashMode(FlashMode.torch);
        setState(() {
          flashlightStatus = true;
        });
        setState(() {
          statusTitle = "off";
        });
      } else {
        await controller?.setFlashMode(FlashMode.off);
        setState(() {
          flashlightStatus = false;
        });
        setState(() {
          statusTitle = "on";
        });
      }
    } catch (e) {
      LogUtility.writeLog("error camera : $e");
    }
  }

  takePictureAndScan() async {
    setState(() {
      loading = true;
    });

    try {
      // create base path
      final Directory appDir = await getApplicationDocumentsDirectory();
      final String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      final String filePath = '${appDir.path}/$fileName';

      // take picture and save to base path
      final takePicture = await controller?.takePicture();
      File imageFile = File(filePath);
      await takePicture?.saveTo(imageFile.path);

      // do a text recognition using google ml kit
      final inputImage = InputImage.fromFile(imageFile);
      final textRecognizer =
          TextRecognizer(script: TextRecognitionScript.latin);
      final RecognizedText recognizedTextResult =
          await textRecognizer.processImage(inputImage);

      LogUtility.writeLog("data scan : ${recognizedTextResult.text}");

      List<String> listResult = recognizedTextResult.blocks
          .expand((block) => block.lines)
          .map((line) => line.text)
          .toList();

      List<String> testResult =
          recognizedTextResult.blocks.map((line) => line.text).toList();

      LogUtility.writeLog(testResult);

      widget.getDataScan(listResult);
    } catch (e) {
      LogUtility.writeLog("error : $e");
    }

    setState(() {
      loading = false;
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Cconstant.getFullHeight(context),
        child: isCameraInitialized
            ? CameraPreview(
                controller!,
                child: widget.child ??
                    Stack(
                      // alignment: Alignment.bottomCenter,
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            VImageConstant.cardOverlay, // Your image asset here
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(27.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              VcustomButton(
                                titleButton: "Take Picture",
                                onPressed: () {
                                  takePictureAndScan();
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomButton(
                                onPressed: () {
                                  setFlashLight();
                                },
                                titleButton: "Turn $statusTitle Flashlight",
                                fontSize: 17,
                                fontColor: VColorUtils.backgroundColors,
                                fontWeight: FontWeight.w700,
                                buttonHeight: 54,
                                backgroundColors: VColorUtils.backgroundColors
                                    .withOpacity(0.4),
                                needBorder: true,
                                borderColors: VColorUtils.textWhiteColors,
                                borderRadius: 30,
                                removeElevation: true,
                              ),
                            ],
                          ),
                        ),
                        loading
                            ? const VdefaultScreenLoading()
                            : const SizedBox()
                      ],
                    ),
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: VColorUtils.primaryColors,
                ),
              ));
  }
}
