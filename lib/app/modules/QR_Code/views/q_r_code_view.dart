import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRCodeView extends StatefulWidget {
  const QRCodeView({super.key});

  @override
  State<QRCodeView> createState() => _QRCodeViewState();
}

class _QRCodeViewState extends State<QRCodeView> {
  String scannedCode = "";
  late MobileScannerController controller; 

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController(); 
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onQRCodeDetected(String? code) {
    if (code != null && code != scannedCode) {
      setState(() {
        scannedCode = code;
      });

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("QR Code Result"),
          content: Text(code),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                MobileScanner(
                  controller: controller, 
                  onDetect: (BarcodeCapture capture) {
                    final String? code = capture.barcodes.first.rawValue;
                    onQRCodeDetected(code);
                  },
                ),
                
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.yellow, width: 4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              scannedCode.isEmpty
                  ? "Waiting for QR Code..."
                  : "Last Scanned: $scannedCode",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
