import 'package:flutter/material.dart';
import './kuis.dart';
import './hasil.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // const MyApp({Key key}) : super(key: key);
  var _soalIndex = 0;
  var totalSkor = 0;

  var pertanyaan = [
    {
      'pertanyaan': 'Tempat apa yang akan anda kunjungi?',
      'jawaban': [
        {'teks': 'Pegunungan', 'skor': 10},
        {'teks': 'Pantai', 'skor': 7},
        {'teks': 'Mall', 'skor': 5},
        {'teks': 'Hutan', 'skor': 3},
      ],
    },
    {
      'pertanyaan': 'Apa warna kesukaan anda?',
      'jawaban': [
        {'teks': 'Merah', 'skor': 3},
        {'teks': 'Biru', 'skor': 7},
        {'teks': 'Hijau', 'skor': 10},
        {'teks': 'Hitam', 'skor': 5},
      ],
    },
    {
      'pertanyaan': 'Apa hobby anda?',
      'jawaban': [
        {'teks': 'Sepak bola', 'skor': 3},
        {'teks': 'Basket', 'skor': 7},
        {'teks': 'Berenang', 'skor': 10},
        {'teks': 'Ngoding', 'skor': 5},
      ],
    },
  ];

  void _jawaban(int skor) {
    setState(() {
      totalSkor = totalSkor + skor;
      _soalIndex += 1;
    });

    if (_soalIndex < pertanyaan.length) {
      print('Masih ada soal berikutnya!');
    } else {
      print('Sudah tidak ada soal');
    }

    // print('Tombol sudah berhasil ditekan');
    print(_soalIndex);
    print(pertanyaan.length);
    print(totalSkor);
  }

  void resetKuis() {
    setState(() {
      _soalIndex = 0;
      totalSkor = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aplikasi Kuis'),
        ),
        body: _soalIndex < pertanyaan.length
            ? Kuis(
                jawaban: _jawaban,
                pertanyaan: pertanyaan,
                soalIndex: _soalIndex,
              )
            : Hasil(totalSkor, resetKuis),
      ),
    );
  }
}
