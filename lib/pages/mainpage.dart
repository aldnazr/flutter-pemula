import 'package:flutter/material.dart';
import 'package:myapp/pages/loginpage.dart';

class MainPage extends StatefulWidget {
  final String nama;
  final String umur;

  const MainPage({super.key, required this.nama, required this.umur});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late String textfieldNamaValue;
  late String textfieldUmurValue;
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();

  @override
  void initState() {
    super.initState();
    textfieldNamaValue = widget.nama;
    textfieldUmurValue = widget.umur;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          'Hello $textfieldNamaValue',
        ),
        leading: null,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Nama anda: $textfieldNamaValue',
                    style: const TextStyle(
                        fontWeight: FontWeight.w300, fontSize: 20),
                  ),
                  Text(
                    'Umur anda: $textfieldUmurValue',
                    style: const TextStyle(
                        fontWeight: FontWeight.w300, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 58,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: controllerName,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(), labelText: 'Nama'),
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
                          border: UnderlineInputBorder(), labelText: 'Umur'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                          onPressed: () {
                            if (controllerName.text.isEmpty &&
                                controllerAge.text.isEmpty) {
                              showAlertDialog(
                                  context, 'Harap masukkan nama atau umur');
                              return;
                            }

                            if (controllerName.text.isEmpty) {
                              setState(() {
                                textfieldUmurValue = controllerAge.text;
                              });
                              return;
                            }

                            if (controllerAge.text.isEmpty) {
                              setState(() {
                                textfieldNamaValue = controllerName.text;
                              });
                              return;
                            }

                            setState(() {
                              textfieldNamaValue = controllerName.text;
                              textfieldUmurValue = controllerAge.text;
                            });
                          },
                          child: const Text(
                            'Update',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
