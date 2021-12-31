import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabsyst_app/logic/providers/app_provider.dart';
import 'package:tabsyst_app/presentation/components/rounded_button.dart';
import 'package:tabsyst_app/presentation/components/rounded_input_field.dart';
import 'package:tabsyst_app/presentation/components/rounded_password_field.dart';
import 'package:tabsyst_app/presentation/router/router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabSyst'),
      ),
      body: Consumer<AppProvider>(
        builder: (context, provider, child) {
          return Center(
            child: Form(
              key: provider.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RoundedInputField(
                    hintText: "Username",
                    onChanged: (value) {},
                    username: provider.usernameController,
                  ),
                  RoundedPasswordField(
                    password: provider.passwordController,
                    onChanged: (value) {},
                  ),
                  RoundedButton(
                      child: provider.isLoading
                          ? const SizedBox(
                              height: 14.0,
                              width: 14.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              "LOGIN",
                              style: TextStyle(color: Colors.white),
                            ),
                      press: () async {
                        if (Provider.of<AppProvider>(context, listen: false)
                            .login()) {
                        Navigator.pushReplacementNamed(context, homeRoute);
                        } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Login Failed"),
                          backgroundColor: Colors.red,
                        ));
                        }
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
