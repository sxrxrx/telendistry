import 'package:flutter/material.dart';
import 'package:teledentistry_app/components/text_field_container.dart';
import 'package:teledentistry_app/utils/constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<dynamic> onChanged;
  final TextEditingController controller;

  const RoundedPasswordField({
    Key? key,
    this.icon = Icons.lock,
    required this.hintText,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  var isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
            obscureText: isObsecure,
            onChanged: widget.onChanged,
            controller: widget.controller,
            decoration: InputDecoration(
                hintText: widget.hintText,
                icon: Icon(
                  widget.icon,
                  color: kPrimaryColor,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    isObsecure ? Icons.visibility : Icons.visibility_off,
                    color: kPrimaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      isObsecure = !isObsecure;
                    });
                  },
                ),
                border: InputBorder.none)));
  }
}
