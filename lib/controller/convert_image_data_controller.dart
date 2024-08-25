import 'dart:io';
import 'dart:typed_data';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

class ConvertImageDataController {
  Future<XFile> convertImageData(Uint8List? imageData) async {
    XFile res = XFile('');

    if (imageData != null) {
      final directory = await getTemporaryDirectory();
      final imagePath = '${directory.path}/screenshot.png';
      final imageFile = File(imagePath);
      await imageFile.writeAsBytes(imageData);
      res = XFile(imagePath);
    }

    return res;
  }
}
