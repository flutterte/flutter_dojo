import 'package:flutter/material.dart';
import 'package:flutter_dojo/category/widgets/inputselections/autocomplete.dart';

void main() => runApp(AutoComplete_test());

class AutoComplete_test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: AutoComplete.textfield(
              controller: TextEditingController(text: "fff")),
        ),
      ),
    );
  }
}
