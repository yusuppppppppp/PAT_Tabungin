import 'package:get/get.dart';

class HomeController extends GetxController {
  // Mengatur indeks yang dipilih di BottomNavigationBar
  var selectedIndex = 0.obs; // Untuk melacak indeks navigasi saat ini

  // Fungsi untuk memperbarui indeks saat navigasi
  void updateIndex(int index) {
    selectedIndex.value = index;
  }

  // Contoh fitur tambahan (counter)
  final count = 0.obs;

  // Fungsi untuk menambahkan nilai counter
  void increment() {
    count.value++;
  }

  @override
  void onInit() {
    super.onInit();
    // Tambahkan inisialisasi atau logika lainnya di sini jika diperlukan
    print("HomeController initialized");
  }

  @override
  void onClose() {
    super.onClose();
    // Tambahkan logika cleanup jika diperlukan
    print("HomeController disposed");
  }
}
