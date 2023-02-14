import 'package:flutter/material.dart';
import 'package:flutter_app/local/cart_data.dart';
import 'package:flutter_app/local/cart_dbHelper.dart';
import 'package:flutter_app/pages/favourite.dart';

class Cart extends StatefulWidget {
  final bool backArrowState;
  Cart({super.key, required this.backArrowState});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  late CartDbHelper helper;
  int totalQuantity = 0;
  double totalPrice = 0;

  void initState() {
    super.initState();
    helper = CartDbHelper();
    updateTotalQuantity();
    updateTotalPrice();
  }

  @override
  Widget build(BuildContext context) {
    num total = 0;
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
          "Cart List",
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
                        builder: (context) => Favourite(
                              backArrowState: true,
                            )));
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 33,
              )),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: helper.allCartList(),
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
                        Container(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 8.0),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                CartData data =
                                    CartData.fromMap(snapshot.data[index]);
                                total += data.count!;
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
                                                height: 8,
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
                                                height: 8,
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
                                                              '\$ ${data.price}\n',
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ]),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              RichText(
                                                maxLines: 1,
                                                text: TextSpan(
                                                    text: 'Quantity: ',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 19, 140, 206),
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                              '${data.count}\n',
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
                                              updateTotalQuantity();
                                              updateTotalPrice();
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
                      ],
                    ),
                  );
                }
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Divider(
                thickness: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Container(
                child: Column(children: [
                  Row(
                    children: [
                      Text(
                        'Number of Items ',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      SizedBox(
                        width: 170,
                      ),
                      Text(
                        '${totalQuantity}',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Total Price ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 170,
                      ),
                      Text(
                        '\$ ${totalPrice}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Divider(
                thickness: 2,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 300,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  "Buy Now",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  void updateTotalQuantity() {
    helper.getCartItems().then((cartItems) {
      int total = 0;
      for (var item in cartItems) {
        total += item.count!;
      }
      setState(() {
        totalQuantity = total;
      });
    });
  }

  void updateTotalPrice() {
    helper.getCartItems().then((cartItems) {
      double total = 0;
      for (var item in cartItems) {
        total += double.parse(item.price!) * item.count!;
      }
      setState(() {
        totalPrice = total;
      });
    });
  }
}
