import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabsyst_app/logic/providers/app_provider.dart';
import 'package:tabsyst_app/presentation/components/rounded_button.dart';
import 'package:tabsyst_app/presentation/components/rounded_input_field.dart';

class AddUserpage extends StatefulWidget {
  const AddUserpage({Key? key}) : super(key: key);

  @override
  State<AddUserpage> createState() => _AddUserpageState();
}

class _AddUserpageState extends State<AddUserpage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<AppProvider>(context, listen: false).clear();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add User'),
        ),
        body: SingleChildScrollView(
          child: Consumer<AppProvider>(
            builder: (context, provider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey,
                    child: provider.image != null
                        ? Image.file(provider.image!)
                        : Icon(Icons.person),
                  ),
                  RoundedInputField(
                      hintText: "Username",
                      onChanged: (value) {},
                      username:
                          Provider.of<AppProvider>(context).nameController),
                  RoundedInputField(
                      hintText: "Description",
                      onChanged: (value) {},
                      username: Provider.of<AppProvider>(context)
                          .descriptionController),
                  RoundedButton(
                      press: () async {
                        await Provider.of<AppProvider>(context, listen: false)
                            .imgFromCamera();
                      },
                      child: const Text("Add Image")),
                  RoundedButton(
                      press: () {
                        Navigator.pop(context);
                        provider.submit();
                      },
                      child: const Text("Submit")),
                ],
              );
            },
          ),
        ));
  }
}
