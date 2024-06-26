import 'package:flutter/material.dart';
import 'package:myapp/pages/mainpage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Daftar',
                  style: TextStyle(fontSize: 30),
                ),
                const Text('Daftar untuk bisa menggunakan aplikasi'),
                const SizedBox(
                  height: 35,
                ),
                SizedBox(
                  height: 58,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: controllerName,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Nama'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 58,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controllerAge,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Umur'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                        onPressed: () {
                          if (controllerName.text.isEmpty ||
                              controllerAge.text.isEmpty) {
                            showAlertDialog(
                                context, 'Harap masukkan nama dan umur');
                            return;
                          }
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPage(
                                      nama: controllerName.text,
                                      umur: controllerAge.text)));
                        },
                        child: const Text(
                          'Daftar',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showAlertDialog(BuildContext context, String pesan) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text(
              'Error',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            content: Text(pesan),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'))
            ],
          ));
}
