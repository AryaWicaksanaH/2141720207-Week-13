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

Soal 1

- Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.

    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Stream - Arya',

- Gantilah warna tema aplikasi sesuai kesukaan Anda.

    theme: ThemeData(
        primarySwatch: Colors.blue,

- Lakukan commit hasil jawaban Soal 1 dengan pesan "W13: Jawaban Soal 1"