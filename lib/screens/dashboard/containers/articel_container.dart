import 'package:flutter/material.dart';
import 'package:teledentistry_app/screens/dashboard/containers/articel_card_container.dart';
import 'package:teledentistry_app/screens/dashboard/pages/webview_page.dart';
import 'package:teledentistry_app/utils/constants.dart';

class ArticelContainer extends StatelessWidget {
  const ArticelContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebviewPage(
                      url:
                          articleUrl[0],
                      webviewTitle:
                          'Kapan waktu yang tepat membersihkan karang pada gigi?',
                    ),
                  ),
                );
              },
              child: const ArticelCardContainer(
                articelTitle:
                    "Kapan waktu yang tepat membersihkan karang pada gigi?",
                articelImageSource: articelImgResource1,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebviewPage(
                      url:
                          articleUrl[1],
                      webviewTitle:
                          'Apakah produk perapih gigi aman digunakan?',
                    ),
                  ),
                );
              },
              child: const ArticelCardContainer(
                articelTitle: "Apakah produk perapih gigi aman digunakan?",
                articelImageSource: articelImgResource2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
