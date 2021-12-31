import 'package:flutter/material.dart';
import 'package:tabsyst_app/presentation/components/text_field_container.dart';


class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController password;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: (value) {
          return value!.isNotEmpty ? null : "Please enter password";
        },
        controller: password,
        obscureText: true,
        onChanged: onChanged,
        cursorColor: Color(0xFF6F35A5),
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: Color(0xFF6F35A5),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
