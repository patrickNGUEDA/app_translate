import 'package:app_translate/Pages/add_langue.dart';
import 'package:app_translate/Pages/add_langues.dart';
import 'package:app_translate/Pages/mot_traduit.dart';
import 'package:app_translate/Pages/save_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_storage/firebase_storage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'Coversation',
            icon: Icon(Icons.group),
          ),
          BottomNavigationBarItem(
              label: 'Microphone', icon: Icon(Icons.mic_none_outlined)),
          BottomNavigationBarItem(
              label: 'Appareil photo', icon: Icon(Icons.photo_camera_rounded)),
        ],
        selectedItemColor: Colors.amber[800],
      ),
      appBar: buildAppBar(),
      body: Body(),

      //body:TraductionInformation()
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        'TranslateApp',
        style: TextStyle(color: Colors.black),
      ),
      leading: IconButton(
        icon: const Icon(Icons.star),
        color: Colors.black,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext) {
                return const SavePage();
              },

              //fullscreenDialog:true, //permet d'ouvrir ma page  sous de modal
            ),
          );
        },
      ),
      backgroundColor: Color(0xFFEFEBE9),
      elevation: 0,
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final Stream<QuerySnapshot> _traductionStream =
      FirebaseFirestore.instance.collection('Traductions').snapshots();
  // FirebaseFirestore.instance.collection("traduction").get() as Stream<QuerySnapshot<Object?>>;
  @override
  Widget build(BuildContext context) {
    // final val = Provider.of<CounterProvider>(context);
    //Size size = MediaQuery.of(context).size;
    //CollectionReference users = FirebaseFirestore.instance.collection('traduction');
    final maxLines = 6;
    return ListView(
      //padding: const EdgeInsets.all(15),
      children: [
        Container(
          child: StreamBuilder<QuerySnapshot>(
            stream: _traductionStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
                // return Text("Full Name: ${data['motF']} ${data['last_name']}");
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return ListTile(
                    title: Text(data['MotFrancais']),
                    subtitle: Text(data['MotLocal']),
                  );
                  // return Text( " ${data['MotFrancais']} ${data['MotFrancais']}");
                }).toList(),
              );
            },
          ),
        ),
        Container(
          //height: size.height * 0.4,
          //width: 400.0,
          height: maxLines * 50.0,
          decoration: BoxDecoration(
            color: Color(0xFFEFEBE9),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          //height: size.height * 0.4,
          // color: Colors.black,

          child: Flexible(
            child: TextField(
              maxLines: maxLines,
              textAlign: TextAlign.start,
              // style: TextStyle(fontSize: 40.0, height: 5.0),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 60.0),
                filled: false,
                // fillColor: Color(0xFFEFEBE9),
                //prefixIcon: Icon(Icons.search),
                labelText: "Saisissez du texte",
                suffixStyle: TextStyle(fontSize: 40.0),
                //icon: Icon(Icons.swap_horiz),
                //suffixIcon: Icon(Icons.remove_red_eye),

                enabledBorder: const OutlineInputBorder(
                  //  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: const BorderSide(color: Color(0xFFEFEBE9)),
                ),
                focusedBorder: OutlineInputBorder(
                  // borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Color(0xFFEFEBE9)),
                ),
              ),
            ),
          ),
        ),

        ///

        ///
        ///
        ///

        Column(
          children: [
            Padding(
                padding:
                    const EdgeInsets.only(top: 15.0, right: 30.0, left: 20.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 150.0,
                  //color: Colors.orangeAccent,
                  padding: const EdgeInsets.all(15),

                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFEFEBE9)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddLangue(title: "Français"),
                          fullscreenDialog: true,
                        ),
                      );
                    },
                    // fullscreenDialog: true,
                    child: Row(
                      children: [
                        Text(
                          "Français",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                Icon(Icons.sync_alt),
                Container(
                  height: 70,
                  width: 150.0,
                  //color: Colors.orangeAccent,
                  padding: const EdgeInsets.all(15),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFEFEBE9)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddLangues(title: "Local"),
                          fullscreenDialog: true,
                        ),
                      );
                    },
                    // fullscreenDialog: true,
                    child: Row(
                      children: [
                        Text(
                          "Ngiemboon",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFFEFEBE9)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MotTrduit(title: "Traduire"),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                  child: Text(
                    "Traduire",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
