import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tabsyst_app/data/models/user_model.dart';

class AppProvider extends ChangeNotifier {
  bool _isLoading = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  File? _image;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<User> _userList = [];

  bool get isLoading => _isLoading;
  TextEditingController get usernameController => _usernameController;
  TextEditingController get passwordController => _passwordController;

  TextEditingController get nameController => _nameController;
  TextEditingController get descriptionController => _descriptionController;
  File? get image => _image;
  GlobalKey<FormState> get formKey => _formKey;
  List<User> get userList => _userList;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future imgFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageFile = File(image.path);
      _image = imageFile;
      notifyListeners();
    } on PlatformException catch (e) {
      print(e);
    }
  }

  void submit() {
    _userList.add(User(name: _nameController.text, description: _descriptionController.text,image: _image));
    notifyListeners();
  }

  void clear() {

    _nameController.clear();
    _descriptionController.clear();
    _image = null;
    notifyListeners();
  }
  bool login() {
    if (_formKey.currentState!.validate()) {
      setLoading(true);
      Future.delayed(const Duration(seconds: 3), () {
        setLoading(false);
      });
      if (_usernameController.text == 'admin' &&
          _passwordController.text == '123') {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
