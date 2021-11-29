import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class ButtonBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('ButtonBar基本使用'),
        ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // Button集合
            ElevatedButton(
              child: Text('Item1'),
              // color: Colors.yellow,
              onPressed: () => {},
            ),
            ElevatedButton(
              child: Text('Item2'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  //change background color of button
                  onPrimary: Colors.white,
                  //change text color of button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  )
              ),
              onPressed: () => {},
            ),
            ElevatedButton(
              child: Text('Item3'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  //change background color of button
                  onPrimary: Colors.white,
                  //change text color of button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  )
              ),
              onPressed: () => {},
            ),
          ],
        ),
        MainTitleWidget('ButtonBarTheme基本使用'),
        SubtitleWidget('Applies a button bar theme to descendant [ButtonBar] widgets.'),
        ButtonBarTheme(
          data: ButtonBarThemeData(
            alignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
          ),
          child: ButtonBar(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {},
                child: Text("A"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("B"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("C"),
              ),
            ],
          ),
        )
      ],
    );
  }
}
