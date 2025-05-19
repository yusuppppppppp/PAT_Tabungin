import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GoalsView extends StatefulWidget {
  const GoalsView({super.key});

  @override
  State<GoalsView> createState() => _GoalsViewState();
}

class _GoalsViewState extends State<GoalsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 50),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SavingsCardSection(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          imageHeight: 100,
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Text(
                                "Goals",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: IconButton(
                                onPressed: () {
                                  _showAddGoalBottomSheet(context);
                                },
                                icon: const Icon(Icons.add,
                                    color: Color(0xFFFFC107)),
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ListView(
                            children: [
                              _buildGoalCard(
                                context,
                                title: "Sepedah impian",
                                text: "Rp. 2.000.000/5.000.000",
                                percentage: 40,
                                asset: 'assets/image/goals/Group19.png',
                              ),
                              const SizedBox(height: 16),
                              _buildGoalCard(
                                context,
                                title: "Laptop impian",
                                text: "Rp. 7.000.000/10.000.000",
                                percentage: 70,
                                asset: 'assets/image/goals/Vector.png',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Fixed header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).padding.top + 44,
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddGoalBottomSheet(BuildContext context) {
    final _goalController = TextEditingController();
    final _priceController = TextEditingController();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              color:
                  Color.fromARGB(255, 255, 255, 255), // Yellow background color
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Progress Card
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 0,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          // Yellow square with upload icon
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFC107),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.upload,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Progress details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Dotted line
                                const Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "........................................",
                                        maxLines: 1,
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                // Percentage
                                const Text(
                                  "0%",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                // Progress bar
                                Container(
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 0, // 0% progress
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFFFC107),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Goal Input Label
                  const Text(
                    "Masukkan Goals",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Goal Input Field
                  Container(
                    height: 50, // Smaller height
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: const Color(0xFFBDBDBD),
                          width: 1), // Add black border
                    ),
                    child: TextField(
                      controller: _goalController,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan Goals',
                        hintStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0x52D4D4D4),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12), // Reduced vertical padding
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Price Input Label
                  const Text(
                    "Masukkan Harga Barang",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Price Input Field
                  Container(
                    height: 50, // Smaller height
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: const Color(0xFFBDBDBD),
                          width: 1), // Add black border
                    ),
                    child: TextField(
                      controller: _priceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(fontSize: 12),
                        hintText: 'Masukkan Harga Barang',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0x52D4D4D4),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12), // Reduced vertical padding
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Save Button
                  SizedBox(
                    width: 400,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        // Logic untuk menyimpan data
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFC107),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Simpan',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGoalCard(
    BuildContext context, {
    required String title,
    required String text,
    required int percentage,
    required String asset,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFFBBC04),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Image.asset(
                  asset,
                  width: 30,
                  height: 30,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    text,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                      color: Color.fromARGB(255, 116, 116, 116),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: percentage / 100,
                            backgroundColor: Colors.grey[200],
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFFFBBC04),
                            ),
                            minHeight: 5,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '$percentage%',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFBBC04),
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero, // Hilangkan padding tambahan
                        constraints:
                            const BoxConstraints(), // Sesuaikan ukuran tombol
                        icon: const Icon(
                          Icons.add_circle,
                          color: Color(0xFFFBBC04),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled:
                                true, // Ensure the bottom sheet adjusts for the keyboard
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                            ),
                            builder: (BuildContext context) {
                              final TextEditingController _controller =
                                  TextEditingController();
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: 16.0,
                                  right: 16.0,
                                  top: 16.0,
                                  bottom: MediaQuery.of(context)
                                      .viewInsets
                                      .bottom, // Adjust padding for keyboard
                                ),
                                child: SingleChildScrollView(
                                  // Allows content to scroll if needed
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Masukkan Nominal",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      TextField(
                                        controller: _controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: "Nominal",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 40),
                                      // Tombol Simpan dan Batal
                                      Row(
                                        children: [
                                          // Tombol Batal
                                          Expanded(
                                            flex: 1,
                                            child: ElevatedButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 255, 0, 0),
                                                foregroundColor:
                                                    const Color.fromARGB(
                                                        255, 255, 255, 255),
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12),
                                              ),
                                              child: const Text(
                                                'Batal',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 12),

                                          // Tombol Simpan
                                          Expanded(
                                            flex: 2,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                // Implementasi logika simpan informasi
                                                Navigator.pop(context);
                                                // Tambahkan logika untuk memperbarui informasi di sini
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black,
                                                foregroundColor: Colors.white,
                                                elevation: 2,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12),
                                              ),
                                              child: const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.check_circle,
                                                    color: Color(0xFFFFC107),
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 8),
                                                  Text(
                                                    'Simpan Perubahan',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 35),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SavingsCardSection extends StatelessWidget {
  final double width;
  final double height;
  final double imageHeight;

  const SavingsCardSection({
    super.key,
    required this.width,
    required this.height,
    this.imageHeight = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
        ),
        Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFFBBC04),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8.0,
                spreadRadius: 2.0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tabungan Anda:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Rp. 1.000.000',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 1,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _showWithdrawBottomSheet(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: Image.asset(
                    'assets/icon/goals/Vector.png',
                    width: 24,
                    height: 24,
                  ),
                  label: const Text(
                    'Withdraw',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                left: 125,
                top: -30,
                child: Image.asset(
                  'assets/image/home/Group7.png',
                  height: 200,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showWithdrawBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return WithdrawFormBottomSheet();
      },
    );
  }
}

class WithdrawFormBottomSheet extends StatefulWidget {
  const WithdrawFormBottomSheet({Key? key}) : super(key: key);

  @override
  _WithdrawFormBottomSheetState createState() =>
      _WithdrawFormBottomSheetState();
}

class _WithdrawFormBottomSheetState extends State<WithdrawFormBottomSheet> {
  final TextEditingController _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Start with "0" so the prefix is visible immediately
    _amountController.text = "0";
  }

  // Format currency to Rupiah
  String _formatCurrency(String value) {
    if (value.isEmpty) return '0';

    // Remove non-digit characters
    String digits = value.replaceAll(RegExp(r'[^\d]'), '');

    // Format with thousand separators
    final formatter = NumberFormat("#,###", "id_ID");
    if (digits.isNotEmpty) {
      return formatter.format(int.parse(digits));
    }
    return '0';
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _navigateToNextPage() {
    Navigator.pop(context); // Close current bottom sheet

    // Navigate to the next page (replace with your actual navigation)
    Navigator.pushNamed(context, '/q-r-code');
  }

   @override
  Widget build(BuildContext context) {
    // Warna tema kekuningan
    final Color primaryYellow = Color(0xFFFFCC00);
    final Color secondaryYellow = Color(0xFFFFF5D6);
    final Color darkYellow = Color(0xFFD4A400);
    final Color textColor = Color(0xFF5C4D00);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 20,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 6,
                  decoration: BoxDecoration(
                    color: primaryYellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 40),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: secondaryYellow,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: primaryYellow.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nominal Withdraw',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: primaryYellow, width: 1.5),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: primaryYellow.withOpacity(0.1),
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Fixed Prefix container with correct height and styling
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            height: 54, // Match the height of TextFormField
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: primaryYellow,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.5),
                                bottomLeft: Radius.circular(10.5),
                              ),
                            ),
                            child: Text(
                              'Rp',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: textColor,
                              ),
                            ),
                          ),
                          // Text field tanpa border
                          Expanded(
                            child: TextFormField(
                              controller: _amountController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: textColor,
                              ),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 10),
                                border: InputBorder.none,
                                hintText: '0 Masukkan nominal withdraw',
                                hintStyle: TextStyle(color: Colors.grey),
                                errorStyle: TextStyle(
                                    height: 0), // Hide error text inside field
                              ),

                              // logic gwa matikan
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'Masukkan nominal top up';
                              //   }
                              //   final amount = int.tryParse(
                              //       value.replaceAll(RegExp(r'[^\d]'), ''));
                              //   if (amount == null || amount <= 0) {
                              //     return 'Nominal harus lebih dari 0';
                              //   }
                              //   return null;
                              // },
                              // done

                              onChanged: (value) {
                                // Remove initial "0" when user starts typing
                                if (value.startsWith('0') && value.length > 1) {
                                  String newValue = value.substring(1);
                                  String formattedValue =
                                      _formatCurrency(newValue);
                                  _amountController.value = TextEditingValue(
                                    text: formattedValue,
                                    selection: TextSelection.collapsed(
                                        offset: formattedValue.length),
                                  );
                                } else {
                                  // Normal formatting for other cases
                                  String formattedValue =
                                      _formatCurrency(value);
                                  _amountController.value = TextEditingValue(
                                    text: formattedValue,
                                    selection: TextSelection.collapsed(
                                        offset: formattedValue.length),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Tanggal Transaksi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: primaryYellow),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: primaryYellow.withOpacity(0.1),
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DateFormat('dd MMMM yyyy').format(_selectedDate),
                              style: TextStyle(
                                fontSize: 16,
                                color: textColor,
                              ),
                            ),
                            Icon(
                              Icons.calendar_today,
                              color: darkYellow,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _navigateToNextPage();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFCC00),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Selanjutnya',
                    style: TextStyle(
                      color: Color(0xFF5C4D00),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
