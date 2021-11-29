import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class ListViewWidget extends StatefulWidget {
  @override
  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  var scrollPhysics;
  var scrollPhysics1 = NeverScrollableScrollPhysics();
  var scrollPhysics2 = BouncingScrollPhysics();
  var scrollPhysics3 = ClampingScrollPhysics();
  var scrollDirection = Axis.horizontal;
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('类ScrollView'),
        Container(
          margin: EdgeInsets.only(right: 50),
          height: 200,
          child: ListView(
            itemExtent: 40,
            children: <Widget>[
              Text('Title1'),
              Text('Title2'),
              Text('Title3'),
              Icon(Icons.account_balance_wallet),
              Icon(Icons.access_time),
              Icon(Icons.adb),
              ListTile(
                leading: Text('line1'),
              ),
              ListTile(
                leading: Text('line2'),
              ),
              ListTile(
                leading: Text('line3'),
              )
            ],
          ),
        ),
        MainTitleWidget('Builder方式'),
        Container(
          margin: EdgeInsets.only(right: 50),
          height: 200,
          child: ListView.builder(
            itemCount: 20,
            itemExtent: 50,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text('Title $index'),
              );
            },
          ),
        ),
        MainTitleWidget('ScrollDirection'),
        MultiSelectionWidget(
          'ScrollDirection',
          Axis.values,
          Axis.values,
          (value) {
            setState(() => scrollDirection = value);
          },
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: scrollDirection,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                color: Colors.blue,
                child: Text('Item $index'),
              );
            },
          ),
        ),
        MainTitleWidget('ListView.separated'),
        Container(
          margin: EdgeInsets.only(right: 50),
          height: 200,
          child: ListView.separated(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text('Title $index'),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.red,
              );
            },
          ),
        ),
        MainTitleWidget('ListView ScrollPhysics'),
        Container(
          margin: EdgeInsets.only(right: 50),
          height: 200,
          child: ListView.builder(
            itemCount: 20,
            itemExtent: 50,
            physics: scrollPhysics == null ? scrollPhysics1 : scrollPhysics,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text('Title $index'),
              );
            },
          ),
        ),
        MultiSelectionWidget(
          'ScrollPhysics',
          [
            scrollPhysics1,
            scrollPhysics2,
            scrollPhysics3,
          ],
          [
            'NeverScrollableScrollPhysics',
            'BouncingScrollPhysics',
            'ClampingScrollPhysics',
          ],
          (value) {
            setState(() => scrollPhysics = value);
          },
        ),
        MainTitleWidget('ListWheelScrollView实现滚轮'),
        SubtitleWidget('A box in which children on a wheel can be scrolled.'),
        Container(
          height: 400,
          child: ListWheelScrollView(
            controller: FixedExtentScrollController(),
            physics: FixedExtentScrollPhysics(),
            children: <Widget>[
              Container(margin: EdgeInsets.all(4), color: Colors.blue, child: Center(child: Text('xys'))),
              Container(margin: EdgeInsets.all(4), color: Colors.blue, child: Center(child: Text('xys'))),
              Container(margin: EdgeInsets.all(4), color: Colors.blue, child: Center(child: Text('xys'))),
              Container(margin: EdgeInsets.all(4), color: Colors.blue, child: Center(child: Text('xys'))),
              Container(margin: EdgeInsets.all(4), color: Colors.blue, child: Center(child: Text('xys'))),
              Container(margin: EdgeInsets.all(4), color: Colors.blue, child: Center(child: Text('xys'))),
              Container(margin: EdgeInsets.all(4), color: Colors.blue, child: Center(child: Text('xys'))),
              Container(margin: EdgeInsets.all(4), color: Colors.blue, child: Center(child: Text('xys'))),
              Container(margin: EdgeInsets.all(4), color: Colors.blue, child: Center(child: Text('xys'))),
              Container(margin: EdgeInsets.all(4), color: Colors.blue, child: Center(child: Text('xys'))),
              Container(margin: EdgeInsets.all(4), color: Colors.blue, child: Center(child: Text('xys'))),
              Container(margin: EdgeInsets.all(4), color: Colors.blue, child: Center(child: Text('xys'))),
              Container(margin: EdgeInsets.all(4), color: Colors.blue, child: Center(child: Text('xys'))),
              Container(margin: EdgeInsets.all(4), color: Colors.blue, child: Center(child: Text('xys'))),
              Container(margin: EdgeInsets.all(4), color: Colors.blue, child: Center(child: Text('xys'))),
              Container(margin: EdgeInsets.all(4), color: Colors.blue, child: Center(child: Text('xys'))),
            ],
            itemExtent: 30.0,
          ),
        ),
        SubtitleWidget('builder模式'),
        Container(
          height: 400,
          child: ListWheelScrollView.useDelegate(
            controller: FixedExtentScrollController(),
            diameterRatio: 2,
            offAxisFraction: 2,
            itemExtent: 30,
            onSelectedItemChanged: (index) {
              setState(() => _currentIndex = index);
            },
            childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      'xys -- $index',
                      style: _currentIndex == index
                          ? TextStyle(color: Colors.redAccent, fontSize: 18)
                          : TextStyle(
                              color: Colors.black.withOpacity(.6),
                              fontSize: 10,
                            ),
                    ),
                  );
                },
                childCount: 20),
          ),
        ),
        MainTitleWidget('ListView in Column'),
        SubtitleWidget('使用Column嵌套ListView/GridView的时候，需要设置shrinkWrap: true，表示根据子组件的总长度来设置ListView的长度'),
        Column(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemExtent: 50,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text('Title $index'),
                );
              },
            ),
          ],
        ),
        MainTitleWidget('Infinite ListView'),
        Container(
          height: 300,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('row $index'),
              );
            },
          ),
        ),
      ],
    );
  }
}
