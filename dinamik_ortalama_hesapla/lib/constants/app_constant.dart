import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const MaterialColor anaRenk = Colors.indigo;
  static const String baslikText = 'Ortalama Hesapla';
  static final TextStyle baslikStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: anaRenk);

  static BorderRadius borderRadius = BorderRadius.circular(22);

  static final TextStyle ortalamaGosterBody = GoogleFonts.quicksand(
      fontSize: 15, fontWeight: FontWeight.w600, color: anaRenk);

  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w700, color: anaRenk);

  static final EdgeInsets dropDownPadding =
      EdgeInsets.symmetric(vertical: 8, horizontal: 14);

  static final yatayPadding8 = EdgeInsets.symmetric(horizontal: 8);
}
