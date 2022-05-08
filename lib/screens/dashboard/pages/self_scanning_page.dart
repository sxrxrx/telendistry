import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teledentistry_app/screens/dashboard/widgets/camera/camera_screen.dart';
import 'package:teledentistry_app/utils/constants.dart';

class SelfScanningPage extends StatefulWidget {
  const SelfScanningPage({Key? key}) : super(key: key);

  @override
  State<SelfScanningPage> createState() => _SelfScanningPageState();
}

class _SelfScanningPageState extends State<SelfScanningPage> {
  String? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 6),
          child: Center(
            child: Column(
              children: [
                (imageFile != null)
                    ? Flexible(
                        flex: 4,
                        child: Image.file(
                          File(imageFile!),
                        ),
                      )
                    : Flexible(
                        flex: 4,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 530,
                              color: Colors.grey[200],
                            ),
                            Center(
                              child: SvgPicture.asset(
                                'assets/icons/aim.svg',
                              ),
                            ),
                          ],
                        ),
                      ),
                const SizedBox(
                  height: 12,
                ),
                Flexible(
                  flex: 1,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor,
                        onPrimary: Colors.white,
                        fixedSize: const Size(196, 58),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/scan.svg'),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text('SCAN IMAGE'),
                        ],
                      ),
                      onPressed: () async {
                        imageFile = await Navigator.push<String?>(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const CameraScreen()));
                        setState(() {});
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
