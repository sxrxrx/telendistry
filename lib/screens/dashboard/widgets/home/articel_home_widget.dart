import 'package:flutter/material.dart';
import 'package:teledentistry_app/screens/dashboard/containers/articel_container.dart';
import 'package:teledentistry_app/screens/dashboard/containers/text_row_articel_container.dart';


class ArticelDashboardWidget extends StatelessWidget {
  const ArticelDashboardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TextRowArticelContainer(
              title: 'Artikel Medis', textClicked: 'Lihat semua >'),
          SizedBox(height: 14),
          ArticelContainer(),
        ],
      ),
    );
  }
}