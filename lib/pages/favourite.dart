import 'package:flutter/material.dart';
import 'package:flutter_app/local/fav_data.dart';
import 'package:flutter_app/local/fav_dbHelper.dart';
import 'package:flutter_app/pages/cart.dart';

class Favourite extends StatefulWidget {
  final bool backArrowState;
  const Favourite({super.key, required this.backArrowState});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  late FavDbHelper helper;

  void initState() {
    super.initState();
    helper = FavDbHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2.5,
        leading: widget.backArrowState
            ? BackButton(
                color: Colors.red,
              )
            : Text(''),
        title: Text(
          "Favourite List",
          style: TextStyle(
              fontSize: 32,
              color: Color.fromARGB(255, 19, 140, 206),
              fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 60,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Cart(
                              backArrowState: true,
                            )));
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.amber[400],
                size: 33,
              )),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: helper.allFavList(),
            builder: ((context, AsyncSnapshot snapshot) {
              if (snapshot.hasError)
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                return Container(
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          height: 650,
                          child: ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 8.0),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                FavData data =
                                    FavData.fromMap(snapshot.data[index]);
                                return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 125,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                                '${data.image}',
                                                width: 125,
                                                height: 150,
                                                fit: BoxFit.fitHeight),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 130,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              RichText(
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                text: TextSpan(
                                                    text: 'Brand: ',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 19, 140, 206),
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                              '${data.brand}\n',
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ]),
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              RichText(
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                text: TextSpan(
                                                    text: 'Type: ',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 19, 140, 206),
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                              '${data.type}\n',
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ]),
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              RichText(
                                                maxLines: 1,
                                                text: TextSpan(
                                                    text: 'Price: ',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 19, 140, 206),
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                              '${data.price}\n',
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ]),
                                              ),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              helper.delete(data.image!);
                                              setState(() {});
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                              size: 33,
                                            ))
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
