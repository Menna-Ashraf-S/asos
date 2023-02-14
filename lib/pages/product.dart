import 'package:flutter/material.dart';
import 'package:flutter_app/local/id.dart';
import 'package:flutter_app/model.product/items.dart';
import 'package:flutter_app/network/api_product.dart';
import 'package:flutter_app/pages/cart.dart';
import 'package:flutter_app/pages/favourite.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Id;
    return Scaffold(
      body: FutureBuilder<Item>(
          future: API.getproduct(args.id),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);

              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0.5,
                  leading: const BackButton(
                    color: Colors.red,
                  ),
                  title: Text(
                    "${snapshot.data!.categoryName}",
                    style: TextStyle(
                        fontSize: 25,
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
                          size: 30,
                        )),
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
                          size: 30,
                        )),
                    SizedBox(width: 5),
                  ],
                ),
                body: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 350,
                            height: 45,
                            child: TextField(
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.search,
                                  size: 25,
                                ),
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(220, 153, 150, 150),
                                  fontWeight: FontWeight.w600,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                                childAspectRatio: (0.82 / 1.25),
                              ),
                              itemCount: snapshot.data!.products!.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 155,
                                            height: 190,
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
                                                  'https://${snapshot.data!.products!.elementAt(index).imageUrl}',
                                                  width: 175,
                                                  height: 190,
                                                  fit: BoxFit.fitHeight),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 5,
                                                left: 5,
                                                top: 3,
                                                bottom: 3),
                                            child: Container(
                                              width: 175,
                                              height: 51,
                                              child: Text(
                                                '${snapshot.data!.products!.elementAt(index).name}',
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '${snapshot.data!.products!.elementAt(index).price.current.text}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () async {
                                      Navigator.pushNamed(context, '/details',
                                          arguments: Id(
                                              id: snapshot.data!.products!
                                                  .elementAt(index)
                                                  .id));
                                    });
                              },
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
          })),
    );
  }
}
