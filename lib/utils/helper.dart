import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:teledentistry_app/utils/constants.dart';


var logger = Logger(printer: PrettyPrinter());

buildProgressndicator(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(kPrimaryLightColor),
            ),
          );
        });
}

