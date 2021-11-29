import 'package:flutter/material.dart';
import 'package:flutter_dojo/category/widgets/buttons/backbutton.dart';
import 'package:flutter_dojo/category/widgets/buttons/buttonbar.dart';
import 'package:flutter_dojo/category/widgets/buttons/dropdownbutton.dart';
import 'package:flutter_dojo/category/widgets/buttons/expandicon.dart';
// import 'package:flutter_dojo/category/widgets/buttons/TextButton.dart';
import 'package:flutter_dojo/category/widgets/buttons/floatingactionbutton.dart';
import 'package:flutter_dojo/category/widgets/buttons/iconbutton.dart';
import 'package:flutter_dojo/category/widgets/buttons/outlinebutton.dart';
import 'package:flutter_dojo/category/widgets/buttons/popupmenubutton.dart';
// import 'package:flutter_dojo/category/widgets/buttons/ElevatedButton.dart';
import 'package:flutter_dojo/category/widgets/buttons/rawmaterialbutton.dart';
import 'package:flutter_dojo/category/widgets/buttons/togglebutton.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';

import '../../category/widgets/buttons/textbutton.dart';
import '../../category/widgets/buttons/elevatedbutton.dart';

List<DemoItem> buildButtonsDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.check_box,
      title: 'ButtonBar',
      subtitle: 'An end-aligned row of buttons, laying out into a column if there is not enough horizontal space.',
      keyword: 'ButtonBar ButtonBarTheme',
      documentationUrl: 'https://api.flutter.dev/flutter/material/ButtonBar-class.html',
      buildRoute: (context) => BaseWidget('ButtonBar', codePath + 'buttonbar', ButtonBarWidget()),
    ),
    DemoItem(
      icon: Icons.check_box,
      title: 'BackButton',
      subtitle: 'A material design back button.',
      keyword: 'BackButton BackButtonIcon CloseButton',
      documentationUrl: 'https://docs.flutter.io/flutter/material/BackButton-class.html',
      buildRoute: (context) => BaseWidget('BackButton', codePath + 'backbutton', BackButtonWidget()),
    ),
    DemoItem(
      icon: Icons.check_box,
      title: 'DropdownButton',
      subtitle: 'Shows the currently selected item and an arrow that opens a menu for selecting another item.',
      keyword: 'DropdownButton',
      documentationUrl: 'https://api.flutter.dev/flutter/material/DropdownButton-class.html',
      buildRoute: (context) => BaseWidget('DropdownButton', codePath + 'dropdownbutton', DropdownButtonWidget()),
    ),
    DemoItem(
      icon: Icons.check_box,
      title: 'ExpandIcon',
      subtitle:
          'A widget representing a rotating expand/collapse button. The icon rotates 180 degrees when pressed, then reverts the animation on a second press. The underlying icon is [Icons.expand_more].',
      keyword: 'ExpandIcon',
      documentationUrl: 'https://api.flutter.dev/flutter/material/ExpandIcon-class.html',
      buildRoute: (context) => BaseWidget('ExpandIcon', codePath + 'expandicon', ExpandIconWidget()),
    ),
    DemoItem(
      icon: Icons.check_box,
      title: 'TextButton',
      subtitle: 'A flat button is a section printed on a Material Components widget that reacts to touches by filling with color.',
      keyword: 'TextButton',
      documentationUrl: 'https://docs.flutter.io/flutter/material/TextButton-class.html',
      buildRoute: (context) => BaseWidget('TextButton', codePath + 'TextButton', TextButtonWidget()),
    ),
    DemoItem(
      icon: Icons.check_box,
      title: 'FloatingActionButton',
      subtitle:
          'A floating action button is a circular icon button that hovers over content to promote a primary action in the application. Floating action buttons are most commonly used in the Scaffold.floatingActionButton field.',
      keyword: 'FloatingActionButton',
      documentationUrl: 'https://api.flutter.dev/flutter/material/FloatingActionButton-class.html',
      buildRoute: (context) => BaseWidget('FloatingActionButton', codePath + 'floatingactionbutton', FloatingActionButtonWidget()),
    ),
    DemoItem(
      icon: Icons.check_box,
      title: 'IconButton',
      subtitle: 'An icon button is a picture printed on a Material widget that reacts to touches by filling with color (ink).',
      keyword: 'IconButton',
      documentationUrl: 'https://api.flutter.dev/flutter/material/IconButton-class.html',
      buildRoute: (context) => BaseWidget('IconButton', codePath + 'iconbutton', IconButtonWidget()),
    ),
    DemoItem(
      icon: Icons.check_box,
      title: 'OutlineButton',
      subtitle: 'Similar to a [TextButton] with a thin grey rounded rectangle border.',
      keyword: 'OutlineButton',
      documentationUrl: 'https://docs.flutter.io/flutter/material/OutlineButton-class.html',
      buildRoute: (context) => BaseWidget('OutlineButton', codePath + 'outlinebutton', OutlineButtonWidget()),
    ),
    DemoItem(
      icon: Icons.check_box,
      title: 'PopupMenuButton',
      subtitle: 'Displays a menu when pressed and calls onSelected when the menu is dismissed because an item was selected.',
      keyword: 'PopupMenuButton CheckedPopupMenuItem PopupMenuEntry PopupMenuDivider PopupMenuItem PopupMenuTheme',
      documentationUrl: 'https://api.flutter.dev/flutter/material/PopupMenuButton-class.html',
      buildRoute: (context) => BaseWidget('PopupMenuButton', codePath + 'popupmenubutton', PopupMenuButtonWidget()),
    ),
    DemoItem(
      icon: Icons.check_box,
      title: 'ElevatedButton',
      subtitle: 'A Material Design raised button. A raised button consists of a rectangular piece of material that hovers over the interface.',
      keyword: 'ElevatedButton ButtonTheme',
      documentationUrl: 'https://docs.flutter.io/flutter/material/ElevatedButton-class.html',
      buildRoute: (context) => BaseWidget('ElevatedButton', codePath + 'ElevatedButton', ElevatedButtonWidget()),
    ),
    DemoItem(
      icon: Icons.check_box,
      title: 'RawMaterialButton',
      subtitle: 'A utility class for building Material buttons that depend on the ambient [ButtonTheme] and [Theme].',
      keyword: 'RawMaterialButton',
      documentationUrl: 'https://docs.flutter.io/flutter/material/RawMaterialButton-class.html',
      buildRoute: (context) => BaseWidget('RawMaterialButton', codePath + 'rawmaterialbutton', RawMaterialButtonWidget()),
    ),
    DemoItem(
      icon: Icons.check_box,
      title: 'ToggleButton',
      subtitle: 'A horizontal set of toggle buttons.',
      keyword: 'ToggleButton',
      documentationUrl: 'https://docs.flutter.io/flutter/material/ToggleButton-class.html',
      buildRoute: (context) => BaseWidget('ToggleButton', codePath + 'togglebutton', ToggleButtonWidget()),
    ),
  ];
}
