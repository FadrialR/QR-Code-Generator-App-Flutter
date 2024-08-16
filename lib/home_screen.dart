import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color whiteColor = const Color(0XFFF2F2F2);
  Color blackColor = const Color(0XFF0C110F);
  Color buttonColor = const Color(0XFF00FFAE);

  String qrData = 'https://github.com/Foxey-07';
  TextEditingController qrDataController = TextEditingController();
  final qrKey = GlobalKey();

  @override
  void dispose() {
    qrDataController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          IconlyLight.category,
          color: blackColor,
        ),
        actions: [
          Icon(
            IconlyLight.search,
            color: blackColor,
          ),
          const SizedBox(width: 12),
          Icon(
            IconlyLight.scan,
            color: blackColor,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              'Create a Personal QR-Code',
              style: GoogleFonts.raleway(
                  fontSize: 32, fontWeight: FontWeight.bold, color: blackColor),
            ),
            const SizedBox(height: 40),
            Container(
              height: 290,
              width: 290,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: RepaintBoundary(
                  key: qrKey,
                  child: QrImageView(
                    data: qrData,
                    version: QrVersions.auto,
                    size: 270,
                    dataModuleStyle: QrDataModuleStyle(
                      dataModuleShape: QrDataModuleShape.circle,
                      color: blackColor,
                    ),
                    eyeStyle: QrEyeStyle(
                      eyeShape: QrEyeShape.square,
                      color: blackColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            TextFormField(
              controller: qrDataController,
              style: GoogleFonts.raleway(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
              cursorColor: buttonColor,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  borderSide: BorderSide(
                    color: blackColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  borderSide: BorderSide(
                    color: blackColor,
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                if (qrDataController.text.isNotEmpty) {
                  setState(() {
                    qrData = qrDataController.text;
                  });
                }
              },
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: blackColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    'Generate QR-Code',
                    style: GoogleFonts.raleway(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
