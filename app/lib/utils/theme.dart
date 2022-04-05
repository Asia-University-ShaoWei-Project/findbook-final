import 'package:flutter/material.dart';

ThemeData basicTheme(bool white_mode) {
  // final ThemeData base = ThemeData.light();
  final ThemeData base = ThemeData();
  int theme_sele = white_mode ? 1 : 0;
  // Map<String, List<Color>> colors = {

  // };
  TextTheme _basicTextTheme(TextTheme base) {
    print('build _basicTextTheme');
    return base.copyWith(
      headline1: base.headline1.copyWith(
        fontSize: 22.0,
        color: Colors.black,
      ),
      headline2: base.headline1.copyWith(
        fontSize: 22.0,
        color: Colors.black,
      ),
      caption: base.caption.copyWith(
        color: Color(0xFFCCC5AF),
      ),
    );
  }

  print('return base.copyWith');
  Color selectColor(String value) {
    String result = '0xFF' + value.split(',')[theme_sele];
    return Color(int.parse(result));
  }

  return base.copyWith(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      color: selectColor('ffffff,212121'),
      textTheme: TextTheme(
        headline1: TextStyle(
          // card titile
          fontSize: 14,
          color: selectColor('212121,e0e0e0'),
        ),
      ),
      iconTheme: IconThemeData(
        color: selectColor('212121,d6d6d6'),
        size: 14.0,
      ),
      actionsIconTheme: IconThemeData(
        color: selectColor('212121,d6d6d6'),
        size: 14.0,
      ),
      // shadowColor: [Color(0xFF), Color(0xFF)][theme_sele],
    ),
    // textTheme: _basicTextTheme(base.textTheme),
    // textTheme: Typography().white,
    indicatorColor: selectColor('807A6B,3e2335'),
    // selectColor('FFFFFF,616161'),
    // indicatorColor: colors['indicatorColor'][theme_sele],
    scaffoldBackgroundColor: selectColor('f5f5f5,424242'),
    // primaryColor: selectColor('FFFFFF,303030'),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: selectColor('FAFAFA,303030'),
      // selectedItemColor: selectColor('303030,FAFAFA'),
      selectedItemColor: selectColor('303030,303030'),
      unselectedItemColor: selectColor('616161,bfbfbf'),
      // backgroundColor: ,
    ),
    accentColor: selectColor('bdbdbd,D6D6D6'), // listview 邊幅color

    iconTheme: IconThemeData(
      color: selectColor('212121,d6d6d6'),
      size: 20.0,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: selectColor('474747,000000'),
      unselectedLabelColor: selectColor('bababa,62ca32'),
    ),
    buttonColor: selectColor('807A6B,ca3299'),
    backgroundColor: selectColor('807A6B,ca3299'),
    // accentColorBrightness: selectColor('FFF8E1,62ca32'),
    // accentIconTheme: selectColor('FFF8E1,62ca32'),
    // accentTextTheme: selectColor('FFF8E1,62ca32'),
    // appBarTheme: selectColor('FFF8E1,62ca32'),
    // applyElevationOverlayColor: selectColor('FFF8E1,62ca32'),
    // backgroundColor: selectColor('FFF8E1,62ca32'),
    // bannerTheme: selectColor('FFF8E1,62ca32'),
    // bottomAppBarColor: selectColor('FFF8E1,62ca32'),
    // bottomAppBarTheme: selectColor('FFF8E1,62ca32'),
    // bottomNavigationBarTheme: selectColor('FFF8E1,62ca32'),
    // bottomSheetTheme: selectColor('FFF8E1,62ca32'),
    // brightness: selectColor('FFF8E1,62ca32'),
    // buttonBarTheme: selectColor('FFF8E1,62ca32'),
    // buttonColor: selectColor('FFF8E1,62ca32'),
    // buttonTheme: selectColor('FFF8E1,62ca32'),
    // canvasColor: selectColor('FFF8E1,62ca32'),
    // cardColor: selectColor('FFF8E1,62ca32'),
    cardTheme: CardTheme(
        // Card
        color: selectColor('ffffff,757575'),
        elevation: 3),
    // chipTheme: selectColor('FFF8E1,62ca32'),
    // colorScheme: selectColor('FFF8E1,62ca32'),
    // cupertinoOverrideTheme: selectColor('FFF8E1,62ca32'),
    // cursorColor: selectColor('FFF8E1,62ca32'),
    // dataTableTheme: selectColor('FFF8E1,62ca32'),
    // dialogBackgroundColor: selectColor('FFF8E1,62ca32'),
    dialogTheme: DialogTheme(
      backgroundColor:selectColor('ffffff,757575'),
      // titleTextStyle:TextStyle(),
      // contentTextStyle:TextStyle(),
    ),
    // disabledColor: selectColor('FFF8E1,62ca32'),
    // dividerColor: selectColor('FFF8E1,62ca32'),
    // dividerTheme: selectColor('FFF8E1,62ca32'),

    // elevatedButtonTheme: selectColor('FFF8E1,62ca32'),
    // errorColor: selectColor('FFF8E1,62ca32'),

    // fixTextFieldOutlineLabel: selectColor('FFF8E1,62ca32'),
    // floatingActionButtonTheme: selectColor('FFF8E1,62ca32'),
    // focusColor: selectColor('FFF8E1,62ca32'),

    // highlightColor: selectColor('FFF8E1,62ca32'),
    // hintColor: selectColor('FFF8E1,62ca32'),
    // hoverColor: selectColor('FFF8E1,62ca32'),

    // indicatorColor: selectColor('FFF8E1,62ca32'),
    // inputDecorationTheme: selectColor('FFF8E1,62ca32'),

    // materialTapTargetSize: selectColor('FFF8E1,62ca32'),

    // navigationRailTheme: selectColor('FFF8E1,62ca32'),

    // outlinedButtonTheme: selectColor('FFF8E1,62ca32'),

    // pageTransitionsTheme: selectColor('FFF8E1,62ca32'),
    // platform: selectColor('FFF8E1,62ca32'),
    popupMenuTheme: PopupMenuThemeData(
      color: selectColor('FFF8E1,eeeeee'),
    ),
    // primaryColor: selectColor('FFF8E1,62ca32'),
    // primaryColorBrightness: selectColor('FFF8E1,62ca32'),
    // primaryColorDark: selectColor('FFF8E1,62ca32'),
    // primaryColorLight: selectColor('FFF8E1,62ca32'),
    // primaryIconTheme: selectColor('FFF8E1,62ca32'),
    // primaryTextTheme: selectColor('FFF8E1,62ca32'),

    // secondaryHeaderColor: selectColor('FFF8E1,62ca32'),
    // selectedRowColor: selectColor('FFF8E1,62ca32'),
    // shadowColor: selectColor('FFF8E1,62ca32'),
    // sliderTheme: selectColor('FFF8E1,62ca32'),
    // snackBarTheme: selectColor('FFF8E1,62ca32'),
    // splashColor: selectColor('FFF8E1,62ca32'),
    // splashFactory: selectColor('FFF8E1,62ca32'),

    // tabBarTheme: selectColor('FFF8E1,62ca32'),
    // textButtonTheme: TextButtonThemeData(
    //   style: ButtonStyle(
    //     textStyle: MaterialStateProperty.all(TextStyle(fontSize: 12, color: selectColor('bdbdbd,424242'))),
    //   )
    // ),
    // textSelectionColor: selectColor('FFF8E1,62ca32'),
    // textSelectionHandleColor: selectColor('FFF8E1,62ca32'),
    // textSelectionTheme: selectColor('FFF8E1,62ca32'),
    textTheme: TextTheme(
      headline1: TextStyle(
        // card titile
        fontSize: 18,
        color: selectColor('212121,e0e0e0'),
      ),
      headline2: TextStyle(
        // home card item titile
        fontSize: 14,
        color: selectColor('212121,eeeeee'),
      ),
      headline3: TextStyle(
        // subtitle
        fontSize: 12,
        color: selectColor('212121,bdbdbd'),
      ),
      headline4: TextStyle(
        // subtitle
        fontSize: 12,
        color: selectColor('e0e0e0,212121'),
      ),
      subtitle1: TextStyle(
        // subtitle
        fontSize: 14,
        color: selectColor('212121,bdbdbd'),
      ),
      subtitle2: TextStyle(
        // subtitle
        fontSize: 10,
        color: selectColor('212121,bdbdbd'),
      ),
      // headline4: TextStyle( // bar titile
      //   fontSize: 19,
      //   color: selectColor('212121,eeeeee'),
      // ),
    ),
    // timePickerTheme: selectColor('FFF8E1,62ca32'),
    // toggleButtonsTheme: selectColor('FFF8E1,62ca32'),
    // toggleableActiveColor: selectColor('FFF8E1,62ca32'),
    // tooltipTheme: selectColor('FFF8E1,62ca32'),
    // typography: selectColor('FFF8E1,62ca32'),

    // unselectedWidgetColor: selectColor('FFF8E1,62ca32'),
    // useTextSelectionTheme: selectColor('FFF8E1,62ca32'),

    // visualDensity: selectColor('FFF8E1,62ca32'),
  );
}
