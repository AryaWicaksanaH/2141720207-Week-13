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

**second form of main.dart**

    //import 'dart:ffi';

    import 'package:flutter/material.dart';
    import 'stream.dart';

    void main() {
    runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Stream - Arya',
        theme: ThemeData(
            primarySwatch: Colors.blue,
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
    Color bgColor = Colors.blueGrey;
    late ColorStream colorStream;

    void changeColor() async {
        await for (var eventColor in colorStream.getColors()) {
        setState(() {
            bgColor = eventColor;
        });
        }
    }

    @override
    void initState() {
        super.initState();
        colorStream = ColorStream();
        changeColor();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
            title: const Text('Stream - Arya'),
            ),
            body: Container(
            decoration: BoxDecoration(color: bgColor),
            ));
    }
    }

**hasil Run**

![hape](docs/Praktikum%201/hape.gif)

**Soal 4**

-Capture hasil praktikum Anda berupa GIF dan lampirkan di README.
-Lakukan commit hasil jawaban Soal 4 dengan pesan "W13: Jawaban Soal 4"

**changeColor() method (yes, you'll get error. don't be afraid)**

    void changeColor() async {
        // await for (var eventColor in colorStream.getColors()) {
        //   setState(() {
        //     bgColor = eventColor;
        //   });
        colorStream.getColors().listen((eventColor) {
        setState(() {
            bgColor = eventColor;
        });
        });
        }
    }

**Soal 5**

-Jelaskan perbedaan menggunakan listen dan await for (langkah 9) !

answer : 

    untuk Listen :

    1. Sifat Sinkron-Asinkron: Metode listen bersifat asinkron, yang berarti eksekusi program dapat melanjutkan ke baris kode berikutnya tanpa menunggu pengiriman data ke stream selesai. 
    
    2. Fleksibilitas Handling: Metode listen memungkinkan eksekusi program untuk menentukan handler fungsi yang akan dijalankan setiap kali ada perubahan pada stream. 
    
    3. Non-blocking: Penggunaan metode listen memungkinkan eksekusi program untuk melanjutkan ke baris kode berikutnya tanpa harus menunggu pengiriman data ke stream selesai.

    untuk await for :

    1. Sifat Sinkron: Metode await for adalah sinkron, yang berarti eksekusi program akan menunggu hingga data tersedia di stream sebelum melanjutkan ke baris kode berikutnya.

    2. Penggunaan Iterator: Penggunaan menunggu untuk mengambil nilai dari stream secara individual mirip dengan penggunaan iterator.

    3. Blocking: Dengan menggunakan await for, eksekusi program akan diblokir sampai data tersedia di stream atau stream ditutup.

-Lakukan commit hasil jawaban Soal 5 dengan pesan "W13: Jawaban Soal 5"


# Praktikum 2: Stream controllers dan sinks

**third form of stream.dart**

    import 'package:flutter/material.dart';
    import 'dart:async';

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

    class NumberStream {
    final StreamController<int> controller = StreamController<int>();

    void addNumberToSink(int newNumber) {
        controller.sink.add(newNumber);
        close() {
        controller.close();
        }
    }
    }

**third form of main.dart**

    //import 'dart:ffi';
    import 'package:flutter/material.dart';
    import 'stream.dart';
    import 'dart:async';
    import 'dart:math';

    void main() {
    runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Stream - Arya',
        theme: ThemeData(
            primarySwatch: Colors.blue,
        ),
        home: const StreamHomepage(),
        );
    }
    }

    class StreamHomepage extends StatefulWidget {
    const StreamHomepage({super.key});

    @override
    State<StreamHomepage> createState() => _StreamHomePageState();
    }

    class _StreamHomePageState extends State<StreamHomepage> {
    int lastNumber = 0;
    Color bgColor = Colors.blueGrey;
    late ColorStream colorStream;
    late StreamController numberStreamController;
    late NumberStream numberStream;

    void changeColor() async {
        colorStream.getColors().listen((eventColor) {
        setState(() {
            bgColor = eventColor;
        });
        });
    }

    @override
    void initState() {
        numberStream = NumberStream();
        numberStreamController = numberStream.controller;
        Stream stream = numberStreamController.stream;
        stream.listen((event) {
        setState(() {
            lastNumber = event;
        });
        });
        super.initState();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: const Text('Stream - Arya'),
        ),
        body: SizedBox(
            width: double.infinity,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Text(lastNumber.toString()),
                ElevatedButton(
                onPressed: () => addRandomNumber(),
                child: const Text('New Random Number'),
                )
            ],
            ),
        ),
        );
    }

    @override
    void dispose() {
        numberStreamController.close();
        super.dispose();
    }

    void addRandomNumber() {
        Random random = Random();
        int myNum = random.nextInt(10);
        numberStream.addNumberToSink(myNum);
    }
    }

**Hasil running**

![hape](docs/Praktikum%202/hape.gif)

**Soal 6**

-Jelaskan maksud kode langkah 8 dan 10 tersebut!

answer :

    langkah 8 : Ketika widget pertama kali dibuat, metode initState() dipanggil. Pada langkah ini, kode membuat objek NumberStream dan objek StreamController. Objek StreamController bertanggung jawab atas aliran data yang dikeluarkan oleh NumberStream. Aliran kemudian didengarkan, dan setiap kali peristiwa baru dikeluarkan, metode setState() dipanggil. Ini berfungsi untuk memastikan bahwa widget diperbarui setiap kali menerima nomor terbaru.

    langkah 10 : Untuk menambahkan nomor acak ke aliran data, metode addRandomNumber() membuat objek Random dan kemudian memanggil metode nextInt() untuk mendapatkan nomor acak antara 0 dan 9. Selanjutnya, nomor acak ditambahkan ke stream dengan metode addNumberToSink().

-Capture hasil praktikum Anda berupa GIF dan lampirkan di README.
-Lalu lakukan commit dengan pesan "W13: Jawaban Soal 6".