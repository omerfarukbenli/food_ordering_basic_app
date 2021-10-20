import 'package:flutter/material.dart';
import 'package:flutter_application_3/sayfa.dart';
import 'package:flutter_application_3/yemekler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Yemekler>> yemekleriGetir() async {
    var yemekListesi = <Yemekler>[];
    var y1 = Yemekler(
        yemekaid: 1,
        yemekadi: 'Köfte',
        yemekresimadi: 'kofte.png',
        yemekfiyati: 15.99);
    var y2 = Yemekler(
        yemekaid: 2,
        yemekadi: 'Ayran',
        yemekresimadi: 'ayran.png',
        yemekfiyati: 2);
    var y3 = Yemekler(
        yemekaid: 3,
        yemekadi: 'Fanta',
        yemekresimadi: 'fanta.png',
        yemekfiyati: 3);
    var y4 = Yemekler(
        yemekaid: 4,
        yemekadi: 'Makarna',
        yemekresimadi: 'makarna.png',
        yemekfiyati: 14.99);
    var y5 = Yemekler(
        yemekaid: 5,
        yemekadi: 'Kadayıf',
        yemekresimadi: 'kadayif.png',
        yemekfiyati: 8.50);
    var y6 = Yemekler(
        yemekaid: 6,
        yemekadi: 'Baklava',
        yemekresimadi: 'baklava.png',
        yemekfiyati: 15.99);

    yemekListesi.add(y1);
    yemekListesi.add(y2);
    yemekListesi.add(y3);
    yemekListesi.add(y4);
    yemekListesi.add(y5);
    yemekListesi.add(y6);

    return yemekListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yemekler'),
      ),
      body: FutureBuilder<List<Yemekler>>(
        future: yemekleriGetir(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var yemekListesi = snapshot.data;
            return ListView.builder(
                itemCount: yemekListesi!.length,
                itemBuilder: (context, index) {
                  var yemek = yemekListesi[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Sayfa(yemek: yemek)),
                      );
                    },
                    child: Card(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Image.asset('assets/${yemek.yemekresimadi}'),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                yemek.yemekadi,
                                style: const TextStyle(fontSize: 25),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Text(
                                '${yemek.yemekfiyati} \u{20Ba}',
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.blue),
                              ),
                            ],
                          ),
                          const SizedBox(width: 120),
                          const Icon(
                            Icons.arrow_right,
                            size: 50,
                          )
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
