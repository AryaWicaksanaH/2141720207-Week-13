# Nama : Arya Wicaksana Hidayat
# Kelas : TI-3F
# NIM/Absen : 07/2141720207

# Praktikum 1: Dart Streams

**First form of main.dart**

    import 'package:flutter/material.dart';

    void main() {
    runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Stream',
        theme: ThemeData(
            primarySwatch: Colors.deepPurple,
        ),
        home: const StreamHomepage(),
        );
    }
    }

    class StreamHomepage extends StatefulWidget {
    const StreamHomepage({super.key});

    @override
    State<StreamHomepage> createState() => _StreamPageState();
    }

    class _StreamPageState extends State<StreamHomepage> {
    @override
    Widget build(BuildContext context) {
        return Container();
    }
    }

**Soal 1**

-Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.

    Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream - Arya'

-Gantilah warna tema aplikasi sesuai kesukaan Anda.

    theme: ThemeData(
        primarySwatch: Colors.blue,

-Lakukan commit hasil jawaban Soal 1 dengan pesan "W13: Jawaban Soal 1"

**first form stream.dart**

    import 'package:flutter/material.dart';

    class ColorStream {
    final List<Color> colors = [
        Colors.blueGrey,
        Colors.amber,
        Colors.deepPurple,
        Colors.lightBlue,
        Colors.teal
    ];
    }

**Soal 2**

-Tambahkan 5 warna lainnya sesuai keinginan Anda pada variabel colors tersebut.

    final List<Color> colors = [
        Colors.blueGrey,
        Colors.amber,
        Colors.deepPurple,
        Colors.lightBlue,
        Colors.teal,
        Colors.red,
        Colors.orange,
        Colors.greenAccent,
        Colors.deepOrange,
        Colors.cyanAccent
    ];

-Lakukan commit hasil jawaban Soal 2 dengan pesan "W13: Jawaban Soal 2"

**second form of stream.dart**

    import 'package:flutter/material.dart';

    class ColorStream {
    final List<Color> colors = [
        Colors.blueGrey,
        Colors.amber,
        Colors.deepPurple,
        Colors.lightBlue,
        Colors.teal,
        Colors.red,
        Colors.orange,
        Colors.greenAccent,
        Colors.deepOrange,
        Colors.cyanAccent
    ];

    Stream<Color> getColors() async* {
        yield* Stream.periodic(const Duration(seconds: 1), (int t) {
        int index = t % colors.length;
        return colors[index];
        });
    }
    }

Soal 3

-Jelaskan fungsi keyword yield* pada kode tersebut!

    answer : Fungsi keyword yield* adalah untuk menghasilkan nilai dari stream Stream.periodic. Keyword yield* menghasilkan nilai dari stream lain atau iterable.

-Apa maksud isi perintah kode tersebut?

    answer : Isi perintah kode ini adalah untuk membuat Stream warna yang berubah setiap satu detik. Ini dilakukan dengan menghasilkan nilai dari stream Stream.periodic, yang menghasilkan nilai integer setiap detik, yang kemudian digunakan untuk menentukan indeks warna.

-Lakukan commit hasil jawaban Soal 3 dengan pesan "W13: Jawaban Soal 3"