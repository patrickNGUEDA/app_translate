import 'package:flutter/material.dart';
//import 'package:multiselect/multiselect.dart';

class AddLangue extends StatefulWidget {
  const AddLangue({super.key, required String title});

  @override
  State<AddLangue> createState() => _AddLangueState();
}

class _AddLangueState extends State<AddLangue> {
  //final motLController = TextEditingController(); // on stocke les mot entres

  //final motSController = TextEditingController();
  // List<String> toutesLesLangues = [];
  final List<String> _langues = [
    "Français",
  ];

  // the selected value
  String? _selectedLangues;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        backgroundColor: Color(0xFFEFEBE9),
        title: Text(
          "Langue source",
          style: TextStyle(color: Colors.black
              //color: Colors.orangeAccent,
              ),
        ),
        actions: [
          Container(
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () => {print("Click on upload button")},
            ),
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => {
              print("Click on settings button"),
            },
          )
        ],
        //backgroundColor: Colors.white
      )),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                    padding:
                        const EdgeInsets.only(left: 12, top: 25, right: 12)),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFEFEBE9),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              width: 300,
              decoration: BoxDecoration(
                  color: Color(0xFFEFEBE9),
                  //Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30)),
              child: DropdownButton<String>(
                value: _selectedLangues,
                onChanged: (value) {
                  setState(() {
                    _selectedLangues = value;
                  });
                },
                hint: const Center(
                    child: Text(
                  'Toutes les langues',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
                // Hide the default underline
                underline: Container(),
                // set the color of the dropdown menu
                dropdownColor: Color(0xFFEFEBE9),
                icon: const Icon(
                  Icons.arrow_downward,
                  color: Colors.black,
                ),
                isExpanded: true,

                // The list of options
                items: _langues
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              e,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ))
                    .toList(),

                // Customize the selected item
                selectedItemBuilder: (BuildContext context) => _langues
                    .map((e) => Center(
                          child: Text(
                            e,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
