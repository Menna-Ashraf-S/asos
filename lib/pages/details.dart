import 'package:flutter/material.dart';
import 'package:flutter_app/local/cart_data.dart';
import 'package:flutter_app/local/cart_dbHelper.dart';
import 'package:flutter_app/local/fav_data.dart';
import 'package:flutter_app/local/fav_dbHelper.dart';
import 'package:flutter_app/local/id.dart';
import 'package:flutter_app/model.details/allData.dart';
import 'package:flutter_app/network/api_details.dart';
import 'package:flutter_app/pages/cart.dart';
import 'package:flutter_app/pages/favourite.dart';
import 'package:flutter_app/pages/viewImages.dart';
import 'package:page_transition/page_transition.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late CartDbHelper helper;
  late FavDbHelper favhelper;

  void initState() {
    super.initState();
    helper = CartDbHelper();
    favhelper = FavDbHelper();
  }

  int quantity = 1;
  String selected_Size = '';
  late List<String> imagesText = [];
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Id;
    return Scaffold(
        body: FutureBuilder<AllData>(
            future: Api.getdetails(args.id),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                imagesText = [];
                for (int i = 0; i < snapshot.data!.media.images!.length; i++) {
                  imagesText.add(
                      "https://${snapshot.data!.media.images!.elementAt(i).url}");
                }
                return SafeArea(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Column(children: <Widget>[
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  size: 33,
                                )),
                            SizedBox(
                              width: 220,
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/cart',
                                  );
                                },
                                icon: Icon(
                                  Icons.shopping_cart,
                                  color: Colors.amber[400],
                                  size: 33,
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            IconButton(
                                onPressed: () async {
                                  FavData dataSQL = FavData({
                                    'image':
                                        'https://${snapshot.data!.media.images!.first.url}',
                                    'brand': snapshot.data!.brand.name,
                                    'type': snapshot.data!.productType.name,
                                    'price': snapshot.data!.price.current.text
                                  });
                                  int id = await favhelper.createFav(dataSQL);
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        Favourite(backArrowState: true),
                                  ));
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 33,
                                ))
                          ],
                        ),
                        Container(child: Carousel(images: imagesText)),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${snapshot.data!.name}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 10),
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              child: Text(
                                'Brand:  ',
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Color.fromARGB(255, 19, 140, 206),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              '${snapshot.data!.brand.name}',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (quantity <= 0) {
                                    quantity = 1;
                                  } else {
                                    quantity--;
                                  }
                                });
                              },
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: Icon(
                                  Icons.remove,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${quantity}',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Type:  ',
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Color.fromARGB(255, 19, 140, 206),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${snapshot.data!.productType.name}',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 230),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 25,
                              ),
                              Icon(
                                Icons.close_rounded,
                                color: Colors.red,
                                size: 25,
                              ),
                              Container(
                                child: Text(
                                  '\$${(snapshot.data!.price.previous.value) + 5}',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 250,
                            ),
                            Container(
                              child: Text(
                                '${snapshot.data!.price.current.text}',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            width: double.infinity,
                            height: 70,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.variants!.length,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 25,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selected_Size = snapshot
                                                .data!.variants!
                                                .elementAt(index)
                                                .brandSize;
                                          });
                                        },
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: selected_Size ==
                                                    snapshot.data!.variants!
                                                        .elementAt(index)
                                                        .brandSize
                                                ? Colors.red
                                                : Color.fromARGB(
                                                    170, 19, 140, 206),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              snapshot.data!.variants!
                                                  .elementAt(index)
                                                  .brandSize,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                })),
                          ),
                        ),
                        Container(
                          width: 190,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () async {
                              CartData dataSQL = CartData({
                                'image':
                                    'https://${snapshot.data!.media.images!.first.url}',
                                'brand': snapshot.data!.brand.name,
                                'type': snapshot.data!.productType.name,
                                'price': snapshot.data!.price.current.value
                                    .toString(),
                                'count': quantity,
                              });
                              int id = await helper.createCart(dataSQL);
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: Cart(
                                        backArrowState: true,
                                      )));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Add to Cart",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.shopping_cart,
                                  color: Colors.black,
                                  size: 25,
                                )
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amberAccent[200],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Center(
                    child: Container(
                  child: Text('${snapshot.error}'),
                ));
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            })));
  }
}
