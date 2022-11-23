import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color primary = Color(0xFFFF6767);
  static const Color accent = Color(0xFF191A1D);
  static const Color primary100 = Color(0xFF546EB0);
  static const Color muted = Color(0xFF858CA9);
  static const Color green = Color(0xFF8CDC70);
  static const Color mutedText = Color(0xFF5C617A);
  static const Color visibleText = Color(0xFFFFFFFF);
  static const Color blue = Color(0xFF00A3FF);


  // Shades of grey 🌚 🚀
  static const Color grey = Color(0xFFC1C1C1);
  static const Color grey100 = Color(0xFFBCBCBC);
  static const Color grey200 = Color(0XFFA6A6A6);
  static const Color grey300 = Color(0xFF5A5A5A);
  static const Color grey400 = Color(0xFF464646);
  static const Color grey500 = Color(0xFF323438);
  static const Color grey600 = Color(0xFF303133);

  static Color whiteA7004c = fromHex('#4cffffff');

  static const Color primaryColor = Color(0xff1E1E1E);
  static const Color secondaryColor = Color(0xffD70000);
  static const Color whiteColor = Color(0xffffffff);
  static const Color defaultColor = Colors.transparent;
  static Color  getColor (Set<MaterialState> states){
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.focused,
      MaterialState.selected,
    };
    if (states.any(interactiveStates.contains)) {
      return primaryColor;
    }

    return Colors.white;
  }
  static const List<Color> gradientBg = [
    Color.fromARGB(255, 107, 0, 7),
    Color.fromARGB(7, 210, 76, 0),
    Color.fromARGB(
      7,
      121,
      58,
      0,
    ),
    Color.fromARGB(
      7,
      56,
      27,
      0,
    ),
    Color.fromARGB(7, 15, 5, 0),
    Color.fromARGB(7, 0, 0, 122),
  ];
  static const List<Color> gradientBlue = [
    Color(0xff0066FF),
    Color(0xff006DD2),
    Color(0xff003079),
    Color(0xff000C38),
    Color(0xff00020F),
    Color(0xff000000),
    Color(0xff000000),
    Color(0xff000000),
  ];
  static const List<Color> gradientOrange = [
    Color(0xffFF6B00),
    Color(0xffD24C00),
    Color(0xff793A00),
    Color(0xff381B00),
    Color(0xff0F0500),
    Color(0xff000000),
    Color(0xff000000),
    Color(0xff000000),
  ];
  static const List<Color> gradientOrangeGreen = [
    Color(0xffD24C00),
    Color(0xff35c925),
    Color(0xff59bb28),
    Color(0xff317c12),
    Color(0xff0f3d03),
  ];
  static const List<Color> gradientRed2 = [
    Color(0xffFF0000),
    Color(0xffD20000),
    Color(0xff790000),
    Color(0xff380000),
    Color(0xff050F00),
    Color(0xff000000),
  ];

  static const List<Color> redBlueGradient = [
    Color(0xffD70000),
    Color(0xff9a1a1a),
    Color(0xff0076B9),
  ];
  static const List<Color> gradientPurple = [
    Color(0xff7000FF),
    Color(0xff8F00D2),
    Color(0xff520079),
    Color(0xff290038),
    Color(0xff0A000F),
    Color(0xff000000),
  ];
  static const List<Color> gradientMixed = [
    Color(0xff7000FF),
    Color(0xff8F00D2),
    Color(0xff520079),
    Color(0xff290038),
    Color(0xff0066FF),
    Color(0xff006DD2),
    Color(0xff003079),
    Color(0xff000C38),
    Color(0xff0A000F),
    Color(0xff000000),
  ];

  static const List<Color> textGradient = [
    Color(0xffFF2C2C),
    Color(0xff0359FF)
  ];
  static const List<Color> blueGreenGradient = [
    Color(0xff0066FF),
    Color(0xff00FFC2)
  ];
  static const List<Color> blueWhiteGradient = [
    Color(0xff0066FF),
    Color(0xffFFFFFF)
  ];
  static const List<Color> blueAccentGradient = [
    Color(0xff0066FF),
    Color(0xff4b92ff)
  ];

  static const List<Color> blueButtonGradient = [
    Color(0xff00B2FF),
    Color(0xff013FDF)
  ];

  static const List<Color> greenButtonGradient = [
    Color(0xff56AB2F),
    Color(0xffA8E063)
  ];

  static const List<Color> goldGradient = [
    Color(0xffDDD400),
    Color(0xffDD5D00)
  ];

  static const List<Color> greyGradient = [
    Color(0xff858CA9),
    Color(0xff45548E)
  ];

  static const List<Color> primaryGradient = [
    Color(0xff353951),
    Color(0xff06091F)
  ];

  static Color transparent = fromHex('#7f030303');

  static Color black9007f = fromHex('#7f030303');

  static Color black900B2 = fromHex('#b2020412');

  static Color black900Cc1 = fromHex('#cc06091f');

  static Color lightBlue300 = fromHex('#4ccaff');

  static Color green700 = fromHex('#1fa21e');

  static Color amberA100 = fromHex('#ffde6c');

  static Color teal500 = fromHex('#11998e');

  static Color black90000 = fromHex('#00010312');

  static Color teal900 = fromHex('#006e39');

  static Color yellow2002b = fromHex('#2bf5f2a7');

  static Color deepPurpleA200 = fromHex('#a953ff');

  static Color purpleA200 = fromHex('#ba35f9');

  static Color blue900 = fromHex('#003c97');

  static Color gray400 = fromHex('#b5b4b2');

  static Color blue901 = fromHex('#0041a2');

  static Color lime700 = fromHex('#ca9031');

  static Color amber500 = fromHex('#ffc806');

  static Color redA400E5 = fromHex('#e5ff1e1e');

  static Color amber501 = fromHex('#ffcc15');

  static Color amber502 = fromHex('#ffcb14');

  static Color orange200 = fromHex('#f2c46d');

  static Color black9001 = fromHex('#00000000');

  static Color bluegray800 = fromHex('#215d59');

  static Color whiteA70063 = fromHex('#63ffffff');

  static Color black9007f2 = fromHex('#7f000000');

  static Color black9007f1 = fromHex('#7f020412');

  static Color indigoA701 = fromHex('#061fff');

  static Color indigoA700 = fromHex('#2657eb');

  static Color bluegray400 = fromHex('#858ca9');

  static Color tealA400D8 = fromHex('#d800ffc1');

  static Color indigo601 = fromHex('#45548e');

  static Color indigo602 = fromHex('#2c48bb');

  static Color indigo600 = fromHex('#45538e');

  static Color blueA701 = fromHex('#0065ff');

  static Color red700 = fromHex('#dd1d1d');

  static Color lightBlueA400 = fromHex('#07baff');

  static Color black9005b = fromHex('#5b000000');

  static Color blueA700 = fromHex('#0358ff');

  static Color red300 = fromHex('#de6161');

  static Color gray80066 = fromHex('#664a4a4a');

  static Color amberA200 = fromHex('#ffdc40');

  static Color greenA200 = fromHex('#4be5b7');

  static Color deepPurple300 = fromHex('#975be5');

  static Color gray50 = fromHex('#fcfcfc');

  static Color whiteA70033 = fromHex('#33ffffff');

  static Color teal800 = fromHex('#038053');

  static Color gray50000 = fromHex('#00a2a2a2');

  static Color yellow900 = fromHex('#ff8414');

  static Color redA400 = fromHex('#ff1919');

  static Color gray903 = fromHex('#191c2c');

  static Color lightBlueA401 = fromHex('#00b2ff');

  static Color purple800 = fromHex('#5e03a6');

  static Color gray904 = fromHex('#040f1f');

  static Color lightBlueA402 = fromHex('#00c1ff');

  static Color gray500 = fromHex('#a2a2a2');

  static Color gray901 = fromHex('#171a3a');

  static Color gray902 = fromHex('#191c2b');

  static Color blue800 = fromHex('#003fdf');

  static Color gray900 = fromHex('#570000');

  static Color orange900 = fromHex('#dd5c00');

  static Color purpleA70000 = fromHex('#009e00d6');

  static Color tealA200 = fromHex('#4bffde');

  static Color bluegray800B2 = fromHex('#b2353850');

  static Color bluegray9001 = fromHex('#00171b3a');

  static Color orange2004c = fromHex('#4cffc773');

  static Color indigoA400 = fromHex('#4249f9');

  static Color blue400 = fromHex('#47a5fc');

  static Color cyan900 = fromHex('#094d73');

  static Color bluegray9004c = fromHex('#4c2e2e2e');

  static Color bluegray80000 = fromHex('#00215d59');

  static Color green900 = fromHex('#005a08');

  static Color lightBlue500 = fromHex('#00a3ff');

  static Color blueA200 = fromHex('#3c8aff');

  static Color lightGreen400 = fromHex('#a8e063');

  static Color black9003f = fromHex('#3f000000');

  static Color limeA400 = fromHex('#dde900');

  static Color green500 = fromHex('#50b34f');

  static Color lightBlue900 = fromHex('#004585');

  static Color whiteA70099 = fromHex('#99ffffff');

  static Color greenA700 = fromHex('#00c54f');

  static Color amberA700 = fromHex('#ffa800');

  static Color greenA701 = fromHex('#04db00');

  static Color lightGreen401 = fromHex('#8bdb6f');

  static Color orange800B5 = fromHex('#b5cd7c04');

  static Color purple900 = fromHex('#480091');

  static Color deepPurpleA400 = fromHex('#4c27e0');

  static Color redA701 = fromHex('#d60000');

  static Color redA700 = fromHex('#ff0000');

  static Color black9004c = fromHex('#4c000000');

  static Color lightBlueA40000 = fromHex('#0007baff');

  static Color orangeA200 = fromHex('#ffb443');

  static Color blueA2002b = fromHex('#2b5398ff');

  static Color redA200 = fromHex('#ff6767');

  static Color orange800 = fromHex('#cd8000');

  static Color yellowA700 = fromHex('#ddd400');

  static Color deepPurple90000 = fromHex('#00341f89');

  static Color bluegray600 = fromHex('#5b607a');

  static Color whiteA700 = fromHex('#ffffff');

  static Color cyan400 = fromHex('#36d1dc');

  static Color teal80070 = fromHex('#7000744a');

  static Color bluegray90000 = fromHex('#0022264e');

  static Color deepPurple900 = fromHex('#3400a2');

  static Color red502 = fromHex('#ff2b2b');

  static Color red501 = fromHex('#fd4040');

  static Color red900 = fromHex('#990000');

  static Color deepPurple902 = fromHex('#2c008a');

  static Color lightBlueA200 = fromHex('#42b7f9');

  static Color deepPurple901 = fromHex('#3700ad');

  static Color red500 = fromHex('#ff2e2e');

  static Color lightBlue400 = fromHex('#23abf9');

  static Color amberA400 = fromHex('#dbc500');

  static Color greenA400 = fromHex('#38ef7d');

  static Color lightBlue800 = fromHex('#0076b8');

  static Color amberA402 = fromHex('#ecc700');

  static Color black903 = fromHex('#050505');

  static Color amberA401 = fromHex('#ffc700');

  static Color purpleA7004f = fromHex('#4f9e00d6');

  static Color deepPurpleA703 = fromHex('#5e00bf');

  static Color black900 = fromHex('#000000');

  static Color black902 = fromHex('#020412');

  static Color yellowA100 = fromHex('#ffef8d');

  static Color lightGreen700 = fromHex('#56ab2f');

  static Color black901 = fromHex('#06091f');

  static Color deepPurpleA700 = fromHex('#7c13e7');

  static Color deepPurpleA701 = fromHex('#7d14e7');

  static Color bluegray800Cc = fromHex('#cc353850');

  static Color black90026 = fromHex('#26000000');

  static Color gray700 = fromHex('#5c5c5c');

  static Color whiteA7006c = fromHex('#6cffffff');

  static Color amber600 = fromHex('#ffb700');

  static Color redA100 = fromHex('#ff7c7c');

  static Color redA101 = fromHex('#ff8282');

  static Color bluegray100 = fromHex('#d4d7e8');

  static Color bluegray900 = fromHex('#171b3a');

  static Color black90034 = fromHex('#33020412');

  static Color black900Cc = fromHex('#cc020412');

  static Color black90033 = fromHex('#33000000');

  static Color indigo900 = fromHex('#081c58');

  static Color bluegray904 = fromHex('#172f3a');

  static Color bluegray903 = fromHex('#363535');

  static Color black90035 = fromHex('#33050505');

  static Color indigo500 = fromHex('#4650b2');

  static Color bluegray901 = fromHex('#22264e');

  static Color bluegray500 = fromHex('#69817d');

  static Color bluegray7004f = fromHex('#4f2a7671');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Color gray800 = fromHex('#4e4e4e');

  static Color gray801 = fromHex('#393939');

  static Color bluegray900B2 = fromHex('#b2343434');

  static Color gray701 = fromHex('#5c5c5c');
  static Color bluegray701 = fromHex('#2a7671');


  static Color bluegray700 = fromHex('#297571');

  static Color bluegray501 = fromHex('#69827d');

  static Color cyan901 = fromHex('#236763');

  static Color bluegray902 = fromHex('#093431');

}
