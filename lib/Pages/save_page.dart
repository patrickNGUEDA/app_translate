import 'package:flutter/material.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (AppBar(
          title: Text(
            "Home Page",
            style: TextStyle(
                //color: Colors.orangeAccent,
                ),
          ),
          //backgroundColor: Colors.white
        )),
        body: ListView(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          children: [
            Container(
              child: const Text("data"),
            ),
          ],
        ));
  }
}
