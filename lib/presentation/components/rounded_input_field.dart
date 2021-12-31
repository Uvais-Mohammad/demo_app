import 'package:flutter/material.dart';

import 'package:tabsyst_app/presentation/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController username;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: (value) {
          return value!.isNotEmpty ? null : "Please enter username";
        },
        controller: username,
        onChanged: onChanged,
        cursorColor: Color(0xFF6F35A5),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Color(0xFF6F35A5),
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
