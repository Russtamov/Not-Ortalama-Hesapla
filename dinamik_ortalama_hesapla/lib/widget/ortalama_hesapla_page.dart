import 'package:dinamik_ortalama_hesapla/constants/app_constant.dart';
import 'package:dinamik_ortalama_hesapla/constants/helper/helper.dart';
import 'package:dinamik_ortalama_hesapla/model/ders.dart';
import 'package:dinamik_ortalama_hesapla/widget/ders_listesi.dart';
import 'package:dinamik_ortalama_hesapla/widget/ortalama_goster.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenHarfDegeri = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
            child: Text(
          Sabitler.baslikText,
          style: Sabitler.baslikStyle,
        )),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: _buildForm(),
            ),
            Expanded(
              flex: 1,
              child: OrtalamaGoster(
                  dersSayisi: DataHelper.tumEklenenDersler.length.toDouble(),
                  ortalama: DataHelper.ortalamaHesapla()),
            )
          ],
        ),
        Expanded(
          child: DersListesi(
            onElemanSildik: (index) {
              DataHelper.tumEklenenDersler.removeAt(index);
              setState(() {});
            },
          ),
        )
      ]),
    );
  }

  _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
              padding: Sabitler.yatayPadding8, child: _buildTextFormField()),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: _buildHarfler(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: _buildkrediler(),
                ),
              ),
              IconButton(
                onPressed: _dersEkleVeOrtalamaHesapla,
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: Sabitler.anaRenk,
                iconSize: 30,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
        onSaved: (deger) {
          setState(() {
            girilenDersAdi = deger!;
          });
        },
        validator: (s) {
          if (s!.length <= 0) {
            return 'Ders Adını Giriniz';
          } else
            return null;
        },
        decoration: InputDecoration(
            hintText: 'Ders Giriniz',
            border: OutlineInputBorder(
                borderRadius: Sabitler.borderRadius,
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Sabitler.anaRenk.shade200.withOpacity(0.5)));
  }

  _buildHarfler() {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk,
        value: secilenHarfDegeri,
        items: DataHelper.tumDerselerinHarfleri(),
        onChanged: (deger) {
          setState(() {
            secilenHarfDegeri = deger!;
            print(deger);
          });
        },
        underline: Container(),
      ),
    );
  }

  _buildkrediler() {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk,
        value: secilenKrediDegeri,
        items: DataHelper.tumDerslerinKredileri(),
        onChanged: (deger) {
          setState(() {
            secilenKrediDegeri = deger!;
            print(deger);
          });
        },
        underline: Container(),
      ),
    );
  }

  void _dersEkleVeOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenHarfDegeri,
          krediDegeri: secilenKrediDegeri);
      DataHelper.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}
