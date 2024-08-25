import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:demo_share_project/controller/convert_image_data_controller.dart';
import 'package:demo_share_project/controller/share_image_and_text_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScreenshotController _screenShotController = ScreenshotController();
  final ShareImageAndTextController _shareImageAndTextController =
      ShareImageAndTextController();
  final ConvertImageDataController _convertImageDataController =
      ConvertImageDataController();

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: _screenShotController,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('Take screenshot and share'),
            onPressed: () async {
              final screenshot = await _screenShotController.capture(
                delay: const Duration(milliseconds: 500),
              );
              final imageXfile = await _convertImageDataController
                  .convertImageData(screenshot);

              _shareImageAndTextController.shareImageAndText(
                  imageXfile, 'Test subject!', 'Test to share!');
            },
          ),
        ),
      ),
    );
  }
}
