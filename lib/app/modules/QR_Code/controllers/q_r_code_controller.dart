import 'package:get/get.dart';

class QRCodeController extends GetxController {
  // Last scanned QR code value
  final scannedCode = ''.obs;

  // Number of successful scans
  final scanCount = 0.obs;

  // Method to handle a newly scanned QR code
  void handleQRCode(String code) {
    scannedCode.value = code;
    scanCount.value++;
  }

  // Method to reset the scan data
  void resetScans() {
    scannedCode.value = '';
    scanCount.value = 0;
  }

  @override
  void onInit() {
    super.onInit();
    // Any initialization logic can be added here
    print("QRCodeController initialized");
  }

  @override
  void onReady() {
    super.onReady();
    print("QRCodeController is ready");
  }

  @override
  void onClose() {
    super.onClose();
    print("QRCodeController is closed");
  }
}
