import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:parsing/_json.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String _nama = "";
  late String _umur = "";
  late String _usergithub = "";
  late String _repogithub = "";
  List _hobi = [];
  List<Article> _articles = [];
  // late String _idarticle = "";
  // late String _titlearticle = "";
  // late String _subtitlearticle = "";

  get id => null;

  get title => null;

  Future _loadSampleJson() async {
    String jsonString = await rootBundle.loadString("assets/sample.json");
    final jsonData = json.decode(jsonString);
    Sample sample = Sample.fromJson(jsonData);

    setState(() {
      _nama = sample.name.toString();
      _umur = sample.age.toString();
      _usergithub = sample.github!.username.toString();
      _repogithub = sample.github!.repository.toString();
      _hobi = sample.hobi!.toList();
      _articles = sample.articles!.toList();
      // _idarticle = sample.articles!.id.toString();
      // _titlearticle = sample.articles!.title.toString();
      // _subtitlearticle = sample.articles!.subtitle.toString();
    });
  }

  void initState() {
    _loadSampleJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Parsing Json')),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.blueAccent,
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [
            Card(
              margin: EdgeInsets.all(20),
              color: Colors.lightBlueAccent,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black, Colors.yellowAccent]),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 1), // changes position of shadow
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Container(
                    child: Center(
                        child: Text(
                      "Nama : \n" + _nama,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                    )),
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(20),
              color: Colors.lightBlueAccent,
              child: Container(
                decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.black, Colors.redAccent]),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 1), // changes position of shadow
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Container(
                    child: Center(
                        child: Text(
                      "Umur : \n" + _umur + " Tahun",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                    )),
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(20),
              color: Colors.lightBlueAccent,
              child: Container(
                decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.black, Colors.green]),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 1), // changes position of shadow
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Container(
                    child: Center(
                        child: Text(
                      "Github : " +
                          _usergithub +
                          "\n Repository : " +
                          _repogithub,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                    )),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _hobi.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Card(
                      color: Colors.lightBlueAccent,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.black, Colors.pink]),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            )
                          ],
                        ),
                        child: Center(
                            child: Text(
                          _hobi[index].toString(),
                          style: TextStyle(color: Colors.white, fontSize: 30.0),
                        )),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _articles.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Card(
                      color: Colors.lightBlueAccent,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.black, Colors.pink]),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            )
                          ],
                        ),
                        child: Center(
                            child: Text(
                          _articles[index].id.toString() +
                              "\n" +
                              _articles[index].title +
                              "\n" +
                              _articles[index].subtitle +
                              "\n",
                          style: TextStyle(color: Colors.white, fontSize: 30.0),
                        )),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class Profile extends StatefulWidget {
//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   late String _nama = "";
//   late String _age = "";

//   final List<String> numbers = [
//     "Article",
//     "Article",
//     "Article",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//       ),
//       child: ListView(
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Container(
//                 width: 360,
//                 height: 100,
//                 margin: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Center(
//                   child: Text("Nama : Fuji Indah Rahayu",
//                       style: TextStyle(color: Colors.white, fontSize: 18)),
//                 ),
//               ),
//               Container(
//                 width: 360,
//                 height: 100,
//                 margin: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Center(
//                   child: Text("Umur : 16 Tahun",
//                       style: TextStyle(color: Colors.white, fontSize: 18)),
//                 ),
//               ),
//               Container(
//                 width: 360,
//                 height: 100,
//                 margin: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Center(
//                   child: Text("Github : fujiindhr",
//                       style: TextStyle(color: Colors.white, fontSize: 18)),
//                 ),
//               ),
//               // Container(
//               //   width: 190,
//               //   margin: EdgeInsets.all(10),
//               //   height: 100,
//               //   child: Center(
//               //     child: Text(
//               //       "Article",
//               //       style: TextStyle(color: Colors.white, fontSize: 18),
//               //     ),
//               //   ),
//               // ),
//               Container(
//                 // width: 150,
//                 // height: 50,
//                 padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
//                 height: MediaQuery.of(context).size.height * 0.20,
//                 child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: numbers.length,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         width: MediaQuery.of(context).size.width * 0.32,
//                         child: Card(
//                           color: Colors.blue,
//                           child: Container(
//                             child: Center(
//                                 child: Text(
//                               numbers[index].toString(),
//                               style: TextStyle(
//                                   color: Colors.white, fontSize: 20.0),
//                             )),
//                           ),
//                         ),
//                       );
//                     }),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
