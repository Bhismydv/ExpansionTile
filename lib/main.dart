import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String? selectedCity, selectedState;

  @override
  void initState() {
    selectedCity = 'City';
    selectedState = 'State';
    super.initState();
  }

  List<String> cities = [
    'City',
    'City 2',
    'City 3',
    'City 4',
  ];

  List<String> states = [
    'State',
    'State 2',
    'State 3',
    'State 4',
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Example'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)),

                    child: ExpansionTile(
                      key: UniqueKey(),
                      collapsedIconColor: Colors.grey,
                      iconColor: Colors.grey,
                      title: Text(
                        selectedState!,
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      // Contents
                      children: [
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              /*  FutureBuilder(
                                                    future: DefaultAssetBundle.of(context).loadString("jsons/us.json"),
                                                    builder: (context, snapshot) {
                                                      var showData = json.decode(snapshot.data.toString());
                                                      return ListView.builder(
                                                        itemBuilder: (context,  index){
                                                          return ListTile(
                                                             onTap: (){
                                                    setState(() {
                                                      selectedState = showData[index]["Montana"];
                                                    });
                                                  },
                                                            title: Text(showData[index]['Montana']),
                                                          );
                                                        },
                                                        itemCount: showData.length,
                                                      );
                                                    }
                                                )*/
                              ...states.map((item) {
                                return ListTile(
                                  onTap: () {
                                    setState(() {
                                      selectedState = item as String?;
                                    });
                                  },
                                  title: Text('$item'),
                                );
                              }).toList(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 5,),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)),
                    child: ExpansionTile(
                      key: UniqueKey(),
                      collapsedIconColor: Colors.grey,
                      iconColor: Colors.grey,
                      title: Text(
                        selectedCity!,
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      // Contents
                      children: [
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              ...cities.map((item) {
                                return ListTile(
                                  onTap: () {
                                    setState(() {
                                      selectedCity = item as String?;
                                    });
                                  },
                                  title: Text('$item'),
                                );
                              }).toList(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),

          ]
      ),
      ),
    // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
