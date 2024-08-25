import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareImageAndTextController {
  void shareImageAndText(XFile? image, String? subject, String text) async {
    try {
      if (image != null) {
        await Share.shareXFiles(
          [
            image,
          ],
          subject: subject,
          text: text,
        );
      } else {
        await Share.share(
          text,
          subject: subject,
        );
      }
    } catch (e) {
      debugPrint('*** ${DateTime.now()} | shareImageAndText: error: $e');
    }
  }
}
