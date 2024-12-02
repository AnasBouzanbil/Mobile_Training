import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Generate extends StatefulWidget {
  const Generate({super.key});

  @override
  State<Generate> createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  final TextEditingController controller = TextEditingController();
  String qrData = '';
  bool isGenerating = false;
  int errorCorrectionLevel = QrErrorCorrectLevel.L;  // Using int instead of enum
  double qrSize = 200.0;

  void generateQRCode() {
    setState(() {
      isGenerating = true;
      qrData = controller.text;
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isGenerating = false;
      });
    });
  }

  Future<void> saveQRCode() async {
    try {
      if (qrData.isEmpty) return;

      // Generate QR image as bytes
      final qrPainter = QrPainter(
        data: qrData,
        version: QrVersions.auto,
        errorCorrectionLevel: errorCorrectionLevel,  // Using integer value here
        gapless: false,
      );
      final picData = await qrPainter.toImageData(300);
      if (picData == null) return;

      // Request storage permissions
      if (await Permission.storage.request().isGranted) {
        final directory = await getExternalStorageDirectory();
        final folder = Directory('${directory!.path}/QR_Generated');
        if (!folder.existsSync()) {
          folder.createSync(recursive: true);
        }

        final file = File('${folder.path}/qr_${DateTime.now().millisecondsSinceEpoch}.png');
        await file.writeAsBytes(picData.buffer.asUint8List());

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('QR Code saved to ${file.path}')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Storage permission denied')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving QR Code: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Generate QR Code",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'Enter data to generate QR code',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  prefixIcon: const Icon(Icons.text_fields),
                ),
                keyboardType: TextInputType.text,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              DropdownButton<int>(
                value: errorCorrectionLevel,
                onChanged: (value) {
                  setState(() {
                    errorCorrectionLevel = value!;
                  });
                },
                items: const [
                  DropdownMenuItem(
                    value: QrErrorCorrectLevel.L,
                    child: Text('Low (L)'),
                  ),
                  DropdownMenuItem(
                    value: QrErrorCorrectLevel.M,
                    child: Text('Medium (M)'),
                  ),
                  DropdownMenuItem(
                    value: QrErrorCorrectLevel.Q,
                    child: Text('Quartile (Q)'),
                  ),
                  DropdownMenuItem(
                    value: QrErrorCorrectLevel.H,
                    child: Text('High (H)'),
                  ),
                ],
                hint: const Text("Select Error Correction Level"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: isGenerating ? null : generateQRCode,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: isGenerating
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        'Generate QR Code',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
              ),
              const SizedBox(height: 20),
              if (qrData.isNotEmpty) ...[
                Center(
                  child: QrImageView(
                    data: qrData,
                    size: qrSize,
                    gapless: false,
                    errorCorrectionLevel: errorCorrectionLevel,  // Using integer value here
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: saveQRCode,
                  icon: const Icon(Icons.download),
                  label: const Text('Save QR Code'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
