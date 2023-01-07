import 'package:flutter/material.dart';

class Hasil extends StatelessWidget {
  // const Hasil({Key key}) : super(key: key);

  int totalSkor;
  Function resetKuis;

  Hasil(this.totalSkor, this.resetKuis);

  // getter
  String get hasilText {
    String hasil = 'Anda berhasil';

    if (totalSkor <= 10) {
      hasil = 'Anda kurang yakin';
    } else if (totalSkor <= 15) {
      hasil = 'Anda cukup yakin';
    } else if (totalSkor <= 20) {
      hasil = 'Anda sudah yakin';
    } else {
      hasil = 'Anda sangat yakin';
    }

    return hasil;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        child: Column(
          children: [
            Text(
              'Kamu berhasil menyelesaikan kuis!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              hasilText,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Skor Kamu',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${totalSkor}',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w700,
                color: Colors.blue,
              ),
            ),
            TextButton(
              onPressed: resetKuis,
              child: Text('Tekan untuk mulai lagi'),
              style: TextButton.styleFrom(
                primary: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
