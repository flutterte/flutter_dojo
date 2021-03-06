import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class ValueNotifierWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> valueNotifier = ValueNotifier<String>('Init String Data');
    PersonNotifier customNotifier = PersonNotifier(People('xuyisheng', 18));

    return Column(
      children: <Widget>[
        MainTitleWidget('ValueNotifier基本使用'),
        SubtitleWidget('在需要响应的Widget中addListener之后，一旦ValueNotifier的值发生改变，就会触发通知'),
        NotifierWidget(data: valueNotifier),
        ElevatedButton(
          onPressed: () => valueNotifier.value = 'New Value ${Random().nextInt(100)}',
          child: Text('Change'),
        ),
        MainTitleWidget('Custom ValueNotifier'),
        CustomNotifierWidget(data: customNotifier),
        ElevatedButton(
          onPressed: () => customNotifier.changePeopleName('zhujia'),
          child: Text('Change'),
        ),
      ],
    );
  }
}

class NotifierWidget extends StatefulWidget {
  final ValueNotifier<String> data;

  NotifierWidget({this.data});

  @override
  _NotifierWidgetState createState() => _NotifierWidgetState();
}

class _NotifierWidgetState extends State<NotifierWidget> {
  String info;

  @override
  initState() {
    super.initState();
    widget.data.addListener(changeNotifier);
    info = '${widget.data.value}';
  }

  void changeNotifier() {
    setState(() => info = '${widget.data.value}');
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      info,
      style: TextStyle(fontSize: 30),
    );
  }

  @override
  dispose() {
    widget.data.removeListener(changeNotifier);
    super.dispose();
  }
}

class CustomNotifierWidget extends StatefulWidget {
  final ValueNotifier<People> data;

  CustomNotifierWidget({this.data});

  @override
  _CustomNotifierWidgetState createState() => _CustomNotifierWidgetState();
}

class _CustomNotifierWidgetState extends State<CustomNotifierWidget> {
  People info;

  @override
  initState() {
    super.initState();
    widget.data.addListener(changeNotifier);
    info = widget.data.value;
  }

  void changeNotifier() {
    setState(() => info = widget.data.value);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${info.name},${info.age}',
      style: TextStyle(fontSize: 30),
    );
  }

  @override
  dispose() {
    widget.data.removeListener(changeNotifier);
    super.dispose();
  }
}

class People {
  String name;
  int age;

  People(this.name, this.age);
}

class PersonNotifier extends ValueNotifier<People> {
  PersonNotifier(People value) : super(value);

  void changePeopleName(String name) {
    value.name = name;
    notifyListeners();
  }
}
