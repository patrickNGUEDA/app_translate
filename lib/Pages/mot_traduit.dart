import 'package:flutter/material.dart';
////import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';

class MotTrduit extends StatefulWidget {
  final String title;
  const MotTrduit({super.key, required this.title});

  @override
  State<MotTrduit> createState() => _MotTrduitState();
}

class _MotTrduitState extends State<MotTrduit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        backgroundColor: Color(0xFFEFEBE9),
        title: Text(
          "Mot traduit",
          style: TextStyle(color: Colors.black
              //color: Colors.orangeAccent,
              ),
        ),
        /*
        actions: [
          Container(
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () => {print("Click on upload button")},
            ),
          ),
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => {print("Click on settings button")})
        ],
        
        */
        
        //backgroundColor: Colors.white
      )),
      body: Column(
        children: [
          Text(widget.title)
        ],
      ),
    );
  }
}