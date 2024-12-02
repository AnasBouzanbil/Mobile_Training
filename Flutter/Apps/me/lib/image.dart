import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';

class PictureEditor extends StatefulWidget {
  @override
  _PictureEditorState createState() => _PictureEditorState();
}

class _PictureEditorState extends State<PictureEditor> {
  final ImagePicker _picker = ImagePicker();
  final SignatureController _signatureController = SignatureController(
    penColor: Colors.red,
    penStrokeWidth: 3.0,
  );

  File? _imageFile;

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _signatureController.clear();
      });
    }
  }

  Future<void> _saveEditedImage() async {
    if (_imageFile == null) return;

    final Uint8List? signatureBytes = await _signatureController.toPngBytes();

    if (signatureBytes != null) {
      final Directory appDir = await getApplicationDocumentsDirectory();
      final String fileName = 'edited_image_${DateTime.now().millisecondsSinceEpoch}.png';
      final String filePath = '${appDir.path}/$fileName';

      final Uint8List originalImageBytes = await _imageFile!.readAsBytes();
      final ByteData editedImage = await _mergeImages(originalImageBytes, signatureBytes);

      final File editedFile = File(filePath);
      await editedFile.writeAsBytes(editedImage.buffer.asUint8List());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Saved to ${editedFile.path}")),
      );
    }
  }

  Future<ByteData> _mergeImages(Uint8List baseImage, Uint8List overlay) async {
    final codec = await instantiateImageCodec(baseImage);
    final frame = await codec.getNextFrame();
    final image = frame.image;

    final overlayCodec = await instantiateImageCodec(overlay);
    final overlayFrame = await overlayCodec.getNextFrame();
    final overlayImage = overlayFrame.image;

    final recorder = PictureRecorder();
    final canvas = Canvas(recorder, Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()));
    canvas.drawImage(image, Offset.zero, Paint());
    canvas.drawImage(overlayImage, Offset.zero, Paint());

    final resultImage = await recorder.endRecording().toImage(image.width, image.height);
    final byteData = await resultImage.toByteData(format: ImageByteFormat.png);

    return byteData!;
  }

  @override
  void dispose() {
    _signatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Picture Editor"),
        actions: [
          if (_imageFile != null)
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: _saveEditedImage,
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _imageFile == null
                ? Center(
                    child: TextButton.icon(
                      icon: const Icon(Icons.camera_alt),
                      label: const Text("Take a Picture"),
                      onPressed: _pickImage,
                    ),
                  )
                : Stack(
                    children: [
                      Image.file(_imageFile!, fit: BoxFit.cover, width: double.infinity),
                      Positioned.fill(
                        child: Signature(
                          controller: _signatureController,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
          ),
          if (_imageFile != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => _signatureController.clear(),
                ),
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: _pickImage,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
