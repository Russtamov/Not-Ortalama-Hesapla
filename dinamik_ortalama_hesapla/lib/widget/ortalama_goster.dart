import 'package:dinamik_ortalama_hesapla/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final double dersSayisi;

  const OrtalamaGoster(
      {required this.dersSayisi, required this.ortalama, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0
              ? '${dersSayisi.toStringAsFixed(0)} Ders Secildi '
              : 'Ders Seciniz',
          style: Sabitler.ortalamaGosterBody,
        ),
        Text(
          ortalama >= 0 ? '${ortalama.toStringAsFixed(2)} ' : '0:0',
          style: Sabitler.ortalamaStyle,
        ),
        Text(
          'Ortalam',
          style: Sabitler.ortalamaGosterBody,
        )
      ],
    );
  }
}
