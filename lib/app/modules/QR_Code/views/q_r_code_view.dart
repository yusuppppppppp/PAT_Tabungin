import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRCodeView extends StatefulWidget {
  const QRCodeView({super.key});

  @override
  State<QRCodeView> createState() => _QRCodeViewState();
}

class _QRCodeViewState extends State<QRCodeView> {
  String scannedCode = "";
  double zoomLevel = 1.0; // Initial zoom level
  late MobileScannerController controller; // Controller for MobileScanner

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController(); // Initialize the scanner controller
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// Callback for QR code detection
  void onQRCodeDetected(String? code) {
    if (code != null && code != scannedCode) {
      setState(() {
        scannedCode = code;
      });

      // Show the scanned QR code result in a dialog
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

  /// Ensures smooth bidirectional zoom handling
  Future<void> setCameraZoom(double zoom) async {
    try {
      await controller.setZoomScale(zoom);
    } catch (e) {
      // Handle potential zoom errors
      debugPrint("Error setting zoom: $e");
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
                // QR Scanner Area
                MobileScanner(
                  controller: controller, // Attach the controller
                  onDetect: (BarcodeCapture capture) {
                    final String? code = capture.barcodes.first.rawValue;
                    onQRCodeDetected(code);
                  },
                ),
                // Scanner Overlay Design
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
          // Scanning Status
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              scannedCode.isEmpty
                  ? "Waiting for QR Code..."
                  : "Last Scanned: $scannedCode",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          // Zoom Slider
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.remove),
                Expanded(
                  child: Slider(
                    value: zoomLevel,
                    min: 1.0,
                    max: 2.0,
                    divisions: 10, // Optional: Divisions for smoother control
                    label: "Zoom: ${zoomLevel.toStringAsFixed(1)}x",
                    onChanged: (value) async {
                      setState(() {
                        zoomLevel = value;
                      });
                      await setCameraZoom(zoomLevel); // Adjust camera zoom
                    },
                  ),
                ),
                const Icon(Icons.add),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
