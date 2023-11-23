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
    State<StreamHomepage> createState() => _StreamHomePageState();
    }

    class _StreamHomePageState extends State<StreamHomepage> {
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

**fourth form of stream.dart**

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

    addError() {
        controller.sink.addError('error');
    }
    }


**fourth form of main.dart**

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
        }).onError((error) {
        setState(() {
            lastNumber = -1;
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
        // int myNum = random.nextInt(10);
        // numberStream.addNumberToSink(myNum);
        numberStream.addError();
    }
    }

**Soal 7**

-Jelaskan maksud kode langkah 13 sampai 15 tersebut!

answer :

    langkah 13 : 
    menambahkan metode addError() ke kelas Stream, yang digunakan untuk menambahkan error ke stream.
    
    langkah 15 : 
    mengubah metode addRandomNumber(). Lalu, mengomentari dua baris kode yang digunakan sebelumnya untuk menambahkan angka acak ke stream, dan kemudian kita menambahkan kode baru untuk menambahkan error ke stream.

-Kembalikan kode seperti semula pada Langkah 15, comment addError() agar Anda dapat melanjutkan ke praktikum 3 berikutnya.

**main.dart**

    void addRandomNumber() {
        Random random = Random();
        int myNum = random.nextInt(10);
        numberStream.addNumberToSink(myNum);
    }

**stream.dart**

    // addError() {
    //   controller.sink.addError('error');
    // }

-Lalu lakukan commit dengan pesan "W13: Jawaban Soal 7".


# Praktikum 3: Injeksi data ke streams

**fifth form of main.dart**

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
    late StreamTransformer transformer;

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
        transformer = StreamTransformer<int, int>.fromHandlers(
            handleData: (value, sink) {
            sink.add(value * 10);
            },
            handleError: (error, trace, sink) {
            sink.add(-1);
            },
            handleDone: (sink) => sink.close());
        stream.transform(transformer).listen((event) {
        setState(() {
            lastNumber = event;
        });
        }).onError((error) {
        setState(() {
            lastNumber = -1;
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

![hape](docs/Praktikum%203/hape.gif)

**Soal 8**

-Jelaskan maksud kode langkah 1-3 tersebut!

answer :

    Langkah 1 : Menambah variabel transformer ke dalam class _StreamHomePageState. Variabel ini akan digunakan untuk menyimpan objek StreamTransformer.

    Langkah 2 : Menambah kode yang akan membuat objek StreamTransformer, yang akan digunakan untuk mengubah data yang diterima dari stream. Dalam hal ini, data akan diubah menjadi integer yang dikalikan dengan 10.

    Langkah 3 : Melakukan edit kode di initState(). Kami menambahkan kode yang akan menggunakan objek transformer untuk mengubah data yang diterima dari stream.

-Capture hasil praktikum Anda berupa GIF dan lampirkan di README.
-Lalu lakukan commit dengan pesan "W13: Jawaban Soal 8".


# Praktikum 4: Subscribe ke stream events

**quarter-final form of main.dart**

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
    late StreamTransformer transformer;
    late StreamSubscription subscription;

    void changeColor() async {
        colorStream.getColors().listen((eventColor) {
        setState(() {
            bgColor = eventColor;
        });
        });
    }

    void stopStream() {
        numberStreamController.close();
    }

    @override
    void initState() {
        numberStream = NumberStream();
        numberStreamController = numberStream.controller;
        Stream stream = numberStreamController.stream;
        subscription = stream.listen((event) {
        setState(() {
            lastNumber = event;
        });
        });
        subscription.onError((error) {
        setState(() {
            lastNumber = -1;
        });
        });
        subscription.onDone(() {
        print('OnDone was called');
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
                ),
                ElevatedButton(
                onPressed: () => stopStream(),
                child: const Text('Stop Subscription'),
                )
            ],
            ),
        ),
        );
    }

    @override
    void dispose() {
        numberStreamController.close();
        subscription.cancel();
        super.dispose();
    }

    void addRandomNumber() {
        Random random = Random();
        int myNum = random.nextInt(10);
        if (!numberStreamController.isClosed) {
        numberStream.addNumberToSink(myNum);
        } else {
        setState(() {
            lastNumber = -1;
        });
        }
    }
    }

**Hasil Running**

![ss](docs/Praktikum%204/ss.png)
![hape](docs/Praktikum%204/hape.gif)

**Soal 9**

-Jelaskan maksud kode langkah 2, 6 dan 8 tersebut!

answer :

    Langkah 2 : Menambahkan kode yang akan membuat objek NumberStream dan NumberStreamController. Objek NumberStream akan menghasilkan stream integer secara acak, dan objek NumberStreamController akan mengontrol stream tersebut.

    Langkah 6 : menambahkan kode untuk membatalkan subscription di dispose(). Hal ini dilakukan untuk mencegah memory leak.

    Langkah 8 : menambahkan kode untuk melihat apakah stream telah ditutup sebelum menambahkan data ke stream. Jika stream telah ditutup, nilai variabel lastNumber akan diubah menjadi nilai -1.

-Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

-Lalu lakukan commit dengan pesan "W13: Jawaban Soal 9".


# Praktikum 5: Multiple stream subscriptions

**semi-final form of main.dart**

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
    late StreamTransformer transformer;
    late StreamSubscription subscription;
    late StreamSubscription subscription2;
    String values = '';

    void changeColor() async {
        colorStream.getColors().listen((eventColor) {
        setState(() {
            bgColor = eventColor;
        });
        });
    }

    void stopStream() {
        numberStreamController.close();
    }

    @override
    void initState() {
        numberStream = NumberStream();
        numberStreamController = numberStream.controller;
        Stream stream = numberStreamController.stream;
        subscription = stream.listen((event) {
        setState(() {
            values += '$event - ';
        });
        });
        subscription2 = stream.listen((event) {
        setState(() {
            values += '$event - ';
        });
        });
        subscription.onError((error) {
        setState(() {
            lastNumber = -1;
        });
        });
        subscription.onDone(() {
        print('OnDone was called');
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
                ),
                ElevatedButton(
                onPressed: () => stopStream(),
                child: const Text('Stop Subscription'),
                )
            ],
            ),
        ),
        );
    }

    @override
    void dispose() {
        numberStreamController.close();
        subscription.cancel();
        super.dispose();
    }

    void addRandomNumber() {
        Random random = Random();
        int myNum = random.nextInt(10);
        if (!numberStreamController.isClosed) {
        numberStream.addNumberToSink(myNum);
        } else {
        setState(() {
            lastNumber = -1;
        });
        }
    }
    }

**Hasil running**

![ss](docs/Praktikum%205/ss.png)

**Soal 10**

Jelaskan mengapa error itu bisa terjadi ?

answer : 
    
    Kesalahan ini terjadi ketika mencoba menambahkan atau membuat dua langganan pada stream yang sama tanpa membatalkan langganan sebelumnya. Ini terjadi ketika inisialisasi langganan2 pada metode initState(), karena sudah ada inisialisasi langganan untuk menangani stream yang sama pada saat yang sama.

**final form of main.dart**

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
    late StreamTransformer transformer;
    late StreamSubscription subscription;
    late StreamSubscription subscription2;
    String values = '';

    void changeColor() async {
        colorStream.getColors().listen((eventColor) {
        setState(() {
            bgColor = eventColor;
        });
        });
    }

    void stopStream() {
        numberStreamController.close();
    }

    @override
    void initState() {
        numberStream = NumberStream();
        numberStreamController = numberStream.controller;
        Stream stream = numberStreamController.stream.asBroadcastStream();
        subscription = stream.listen((event) {
        setState(() {
            values += '$event - ';
        });
        });
        subscription2 = stream.listen((event) {
        setState(() {
            values += '$event - ';
        });
        });
        subscription.onError((error) {
        setState(() {
            lastNumber = -1;
        });
        });
        subscription.onDone(() {
        print('OnDone was called');
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
                Text(values),
                ElevatedButton(
                onPressed: () => addRandomNumber(),
                child: const Text('New Random Number'),
                ),
                ElevatedButton(
                onPressed: () => stopStream(),
                child: const Text('Stop Stream'),
                )
            ],
            ),
        ),
        );
    }

    @override
    void dispose() {
        numberStreamController.close();
        subscription.cancel();
        super.dispose();
    }

    void addRandomNumber() {
        Random random = Random();
        int myNum = random.nextInt(10);
        if (!numberStreamController.isClosed) {
        numberStream.addNumberToSink(myNum);
        } else {
        setState(() {
            lastNumber = -1;
        });
        }
    }
    }

**Soal 11**

-Jelaskan mengapa hal itu bisa terjadi ?

answer :

    Saat menekan tombol "New Random Number", akan dihasilkan dua angka acak yang sama. Angka-angka tersebut berasal dari stream yang disebut oleh objek subscription dan subscription2. Stream akan mengembalikan nilai berupa peristiwa (angka random) yang dipisahkan dengan tanda "-". Saat tombol "Stop Stream" ditekan, stream akan menghentikan langganan terhadap stream, sehingga stream tidak lagi dapat mengeluarkan output, meskipun tombol "New Random Number" ditekan.

-Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

![hape](docs/Praktikum%205/hape.gif)

-Lalu lakukan commit dengan pesan "W13: Jawaban Soal 10,11".


# Praktikum 6: StreamBuilder

**first form of stream.dart**

    import 'dart:math';

    class NumberStream {
    Stream<int> getNumbers() async* {
        yield* Stream.periodic(const Duration(seconds: 1), (int t) {
        Random random = Random();
        int myNum = random.nextInt(10);
        return myNum;
        });
    }
    }


**first form of main.dart**

    import 'package:flutter/material.dart';
    import 'stream.dart';
    import 'dart:async';

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
        home: const StreamHomePage(),
        );
    }
    }

    class StreamHomePage extends StatefulWidget {
    const StreamHomePage({super.key});

    @override
    State<StreamHomePage> createState() => _StreamHomePageState();
    }

    class _StreamHomePageState extends State<StreamHomePage> {
    late Stream<int> numberStream;
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: const Text('Stream'),
        ),
        body: StreamBuilder(
            stream: numberStream,
            initialData: 0,
            builder: (context, snapshot) {
            if (snapshot.hasError) {
                print('Error!');
            }
            if (snapshot.hasData) {
                return Center(
                    child: Text(
                snapshot.data.toString(),
                style: const TextStyle(fontSize: 96),
                ));
            } else {
                return const SizedBox.shrink();
            }
            },
        ),
        );
    }

    @override
    void initState() {
        numberStream = NumberStream().getNumbers();
        super.initState();
    }
    }

**Hasil running**

![hape](docs/Praktikum%206/hape.gif)

**Soal 12**

-Jelaskan maksud kode pada langkah 3 dan 7 !

answer : 

    Langkah 3 :

    Metode getNumber menggunakan Stream.periodic untuk menghasilkan sebuah stream bilangan bulat dengan waktu 1 detik. Sebuah bilangan acak antara 0 dan 9 dihasilkan menggunakan Random, dan bilangan acak ini kemudian dikirimkan ke dalam stream dengan bantuan yield* async* untuk menghasilkan stream dari nilai-nilai yang di-yield.

    Langkah 7 :

    Untuk membangun sebuah widget, StreamBuilder menggunakan data dari numberStream yang dihasilkan dari getNumber() pada NumberStream. Jika ada snapshot.hasData, widget akan menampilkan teks yang mengandung nilai data tersebut. Jika terjadi error, kita hanya mencetak pesan "Error!" tanpa menampilkan konten apa pun. Jika tidak ada data, kita kembalikan widget yang tidak terlihat. Ini memungkinkan tampilan untuk beradaptasi dengan perubahan data yang diterima dari stream dan menghasilkan tampilan yang sesuai dengan kondisi strream.

-Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

-Lalu lakukan commit dengan pesan "W13: Jawaban Soal 12".


# Praktikum 7: BLoC Pattern

**form of main.dart**

    import 'package:bloc_random_arya/random_screen.dart';
    import 'package:flutter/material.dart';

    void main() {
    runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
        ),
        home: const RandomScreen(),
        );
    }
    }

    class MyHomePage extends StatefulWidget {
    const MyHomePage({super.key, required this.title});
    final String title;

    @override
    State<MyHomePage> createState() => _MyHomePageState();
    }

    class _MyHomePageState extends State<MyHomePage> {
    int _counter = 0;

    void _incrementCounter() {
        setState(() {
        _counter++;
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
        ),
        body: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                const Text(
                'You have pushed the button this many times:',
                ),
                Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
                ),
            ],
            ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
        ),
        );
    }
    }

**form of random_screen.dart**

    import 'package:flutter/material.dart';
    import 'random_bloc.dart';

    class RandomScreen extends StatefulWidget {
    const RandomScreen({super.key});

    @override
    State<RandomScreen> createState() => _RandomScreenState();
    }

    class _RandomScreenState extends State<RandomScreen> {
    final _bloc = RandomNumberBloc();

    @override
    void dispose() {
        _bloc.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(title: const Text('Random Number Arya')),
        body: Center(
            child: StreamBuilder<int>(
            stream: _bloc.randomNumber,
            initialData: 0,
            builder: (context, snapshot) {
                return Text(
                'Random Number: ${snapshot.data}',
                style: const TextStyle(fontSize: 24),
                );
            },
            ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => _bloc.generateRandom.add(null),
            child: const Icon(Icons.refresh),
        ),
        );
    }
    }

**form of random_bloc.dart**

    import 'dart:async';
    import 'dart:math';

    class RandomNumberBloc {
    final _generateRandomController = StreamController<void>();
    final _randomNumberController = StreamController<int>();
    Sink<void> get generateRandom => _generateRandomController.sink;
    Stream<int> get randomNumber => _randomNumberController.stream;

    RandomNumberBloc() {
        _generateRandomController.stream.listen((_) {
        final random = Random().nextInt(10);
        _randomNumberController.sink.add(random);
        });
    }

    void dispose() {
        _generateRandomController.close();
        _randomNumberController.close();
    }
    }

**Hasil running**

![hape](docs/Praktikum%207/hape.gif)

**Soal 13**

-Jelaskan maksud praktikum ini ! Dimanakah letak konsep pola BLoC-nya ?

answer : Pada random_bloc, RandomNumberBloc memiliki dua StreamController: _generateRandomController berfungsi sebagai penerima perintah untuk menghasilkan angka acak dan _randomNumberController mengirimkan angka acak ke tampilan UI. Saat _generateRandomController menerima trigger atau event, blok tersebut memproses event tersebut dengan menggunakan Random().

RandomScreen menampilkan angka acak yang diterima dari RandomNumberBloc pada file random_screen. Kemudian, RandomScreen menggunakan StreamBuilder untuk membangun tampilan yang terhubung ke stream _bloc.randomNumber. Ini memungkinkan UI secara otomatis diperbarui ketika ada perubahan data di dalam stream, sehingga teks yang menampilkan angka acak selalu terupdate sesuai dengan nilai terbaru yang diterima dari stream. Tombol Action Floating berfungsi untuk memulai proses pengacakan angka. Setelah menekan tombol ini, onPressed akan mengirimkan perintah melalui generateRandom.add(null) ke _generateRandomController pada BLoC. Proses ini akan memulai pembuatan angka acak dan mengirimkannya kembali ke UI melalui stream.

-Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

-Lalu lakukan commit dengan pesan "W13: Jawaban Soal 13".