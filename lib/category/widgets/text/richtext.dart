import 'dart:ui' as ui show PlaceholderAlignment;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class RichTextWidget extends StatefulWidget {
  @override
  _RichTextWidgetState createState() => _RichTextWidgetState();
}

class _RichTextWidgetState extends State<RichTextWidget> {
  final TapGestureRecognizer recognizer = TapGestureRecognizer();
  var clickFlag = true;
  var changeColor = Colors.blue;

  void initState() {
    super.initState();
    recognizer.onTap = () {
      setState(() {
        clickFlag ? changeColor = Colors.red : changeColor = Colors.blue;
        clickFlag = !clickFlag;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('RichText基本使用'),
        RichText(
          text: TextSpan(
            text: 'Rich ',
            style: TextStyle(
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'bold',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 18),
              ),
              TextSpan(
                text: ' Text',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: ' ClickMe',
                style: TextStyle(fontStyle: FontStyle.italic, color: changeColor, fontSize: 20),
                recognizer: recognizer,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text.rich(
            TextSpan(
              text: '请阅读用户协议',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
              children: [
                TextSpan(
                  text: '《服务协议》',
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('onTap');
                    },
                ),
              ],
            ),
          ),
        ),
        MainTitleWidget('RichText with WidgetSpan'),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: ' Text',
                style: TextStyle(color: changeColor, fontSize: 20),
              ),
              WidgetSpan(
                child: FlutterLogo(size: 20),
              ),
              WidgetSpan(
                alignment: ui.PlaceholderAlignment.middle,
                child: Image.asset(
                  'assets/images/libtext.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
