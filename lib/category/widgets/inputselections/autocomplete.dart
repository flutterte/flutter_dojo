import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef GestureTapCallback = void Function();

class AutoComplete extends StatelessWidget {
  // 标题
  final String title;

  //是否必填的标志
  final String mustType;

  //输入框 显示的灰色提示文字
  final String hintText;

  final TextEditingController controller;

  //下拉框数组
  final List contentList;

  // 输入框是否只读 默认 false
  final bool readOnly;

  //文字显示的位置
  final TextAlign textAlign;

  //输入框键盘样式
  final TextInputType keyboardType;

  //输入框右边👉显示的widget
  final Widget suffixIcon;

  //判断 类型 是 输入 还是 下拉选择
  final bool style;

  // 下拉框点击事件
  final ValueChanged<String> onChanged;

  // 输入框输入的类型限制，只能输入数字、汉字等
  final List<TextInputFormatter> inputFormatters;

  // 输入框不可输入时的点击事件
  final GestureTapCallback onTap;
  //光标焦点
  final FocusNode focusNode;

  //输入框左边title的宽度
  final num titleWidth;

  AutoComplete({
    this.title = '',
    this.mustType = '',
    this.hintText = '',
    this.controller,
    this.contentList,
    this.readOnly = false,
    this.textAlign,
    this.keyboardType,
    this.suffixIcon,
    this.style = false,
    this.onChanged,
    this.inputFormatters,
    this.onTap,
    this.focusNode,
    this.titleWidth,
  });

  factory AutoComplete.textfield({
    String title = '',
    String mustType = '',
    String hintText = '',
    @required TextEditingController controller,
    bool readOnly = false,
    TextAlign textAlign = TextAlign.start,
    TextInputType keyboardType,
    Widget suffixIcon,
    ValueChanged<String> onChanged,
    List<TextInputFormatter> inputFormatters,
    GestureTapCallback onTap,
    FocusNode focusNode,
    num titleWidth,
  }) {
    return AutoComplete(
      controller: controller,
      title: title,
      mustType: mustType,
      hintText: hintText,
      readOnly: readOnly,
      textAlign: textAlign,
      keyboardType: keyboardType,
      suffixIcon: suffixIcon,
      style: false,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      onTap: onTap,
      focusNode: focusNode,
      titleWidth: titleWidth,
    );
  }

  factory AutoComplete.dropdownView({
    String title = '',
    String mustType = '',
    String hintText = '',
    @required TextEditingController controller,
    @required List contentList,
    TextAlign textAlign = TextAlign.start,
    ValueChanged<String> onChanged,
    num titleWidth,
  }) {
    return AutoComplete(
      controller: controller,
      title: title,
      mustType: mustType,
      hintText: hintText,
      contentList: contentList,
      textAlign: textAlign,
      style: true,
      onChanged: onChanged,
      titleWidth: titleWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: ListTile(
            title: Row(
              children: <Widget>[
                Text(
                  mustType,
                  style: TextStyle(color: Colors.red),
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            trailing: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: this.style == false
                  ? TextField(
                      keyboardType: this.keyboardType,
                      readOnly: this.readOnly,
                      controller: controller,
                      textAlign: this.textAlign,
                      onChanged: this.onChanged,
                      inputFormatters: this.inputFormatters,
                      onTap: this.onTap,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                        hintStyle: TextStyle(fontSize: 16),
                        suffixIcon: this.suffixIcon,
                      ),
                    )
                  : DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                        hintStyle: TextStyle(fontSize: 16),
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      ),
                      value: controller.text == '' ? null : controller.text,
                      items: contentList
                          .map((title) => DropdownMenuItem(
                                child: Center(
                                  child: Text(title),
                                ),
                                value: title,
                              ))
                          .toList(),
                      onChanged: (title) {
                        controller.text = title;
                        this.onChanged(title);
                      }),
              width: MediaQuery.of(context).size.width -
                  (this.titleWidth == null ? 136 : this.titleWidth),
            ),
          ),
        ),
        Divider(
          height: 1,
        ),
      ],
    );
  }
}
