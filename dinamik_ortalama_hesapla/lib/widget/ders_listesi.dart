import 'package:dinamik_ortalama_hesapla/constants/app_constant.dart';
import 'package:dinamik_ortalama_hesapla/constants/helper/helper.dart';
import 'package:dinamik_ortalama_hesapla/model/ders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DersListesi extends StatelessWidget {
  final Function onElemanSildik;
  const DersListesi({required this.onElemanSildik, super.key});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                background: Container(
                  color: Color.fromARGB(255, 240, 48, 34),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  onElemanSildik(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(
                        tumDersler[index].ad,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text((tumDersler[index].harfDegeri *
                                tumDersler[index].krediDegeri)
                            .toString()),
                      ),
                      subtitle: Text(
                          'Kredi ${tumDersler[index].krediDegeri} , Not Değeri ${tumDersler[index].harfDegeri},'),
                    ),
                  ),
                ),
              );
            })
        : Container(
            alignment: Alignment.center,
            child: Text(
              'Lutfen Ders Ekleyiniz',
              style: TextStyle(
                  color: Sabitler.anaRenk,
                  fontSize: 18,
                  fontStyle: FontStyle.italic),
            ),
          );
  }
}
