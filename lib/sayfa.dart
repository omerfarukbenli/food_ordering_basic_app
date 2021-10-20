import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_3/yemekler.dart';

class Sayfa extends StatefulWidget {
  final Yemekler yemek;

  const Sayfa({
    Key? key,
    required this.yemek,
  }) : super(key: key);

  @override
  _SayfaState createState() => _SayfaState();
}

class _SayfaState extends State<Sayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.yemek.yemekadi),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/${widget.yemek.yemekresimadi}'),
            const SizedBox(height: 20),
            Text(
              '${widget.yemek.yemekfiyati} \u{20Ba}',
              style: const TextStyle(fontSize: 60, color: Colors.blue),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
              onPressed: () {
                print('${widget.yemek.yemekadi} sipariş verildi');
              },
              child: const Text('sipariş ver'),
            ),
          ],
        ),
      ),
    );
  }
}
