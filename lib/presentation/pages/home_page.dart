import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabsyst_app/logic/providers/app_provider.dart';
import 'package:tabsyst_app/presentation/router/router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: provider.userList.isNotEmpty
            ? ListView.builder(
                itemCount: provider.userList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: provider.userList[index].image != null
                            ? ClipRect(
                                child:
                                    Image.file(provider.userList[index].image!))
                            : const Icon(Icons.person)),
                    title: Text(provider.userList[index].name.toString()),
                    subtitle:
                        Text(provider.userList[index].description.toString()),
                    tileColor: const Color(0xFFF7F3FD),
                    contentPadding: const EdgeInsets.all(16),
                  );
                })
            : const Center(child: Text('No users found')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, addUserRoute);
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
