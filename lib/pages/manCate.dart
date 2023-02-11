import 'package:flutter/material.dart';
import 'package:flutter_app/local/id.dart';

class ManCate extends StatefulWidget {
  const ManCate({super.key});

  @override
  State<ManCate> createState() => _CategoryState();
}

class _CategoryState extends State<ManCate> {
  List<int> cate_M = [3602, 7616, 4910, 3606, 7617, 4208, 26090, 5668, 14274];
  List<String> name_M = [
    "Shirts",
    "T-Shirts & Tanks",
    "Pants & Chinos",
    "Jackets & Coats",
    "Sweaters & Cardigans",
    "Jeans",
    "Activewear",
    "Hoodies & Sweatshirts",
    "Sweatpants"
  ];
  List<String> imag_M = [
    "https://images.asos-media.com/navigation/mw_gbl_clothing_shirts_2043458_2m",
    "https://images.asos-media.com/navigation/mw_gbl_clothing_tshirtsvests_105010565_2m",
    "https://images.asos-media.com/navigation/mw_gbl_clothing_trousers_2032816_2m",
    "https://images.asos-media.com/navigation/mw_gbl_clothing_jacketscoats_2032788_2m",
    "https://images.asos-media.com/navigation/mw_gbl_clothing_jumpers_cardigans_flo_116446382_3m",
    "https://images.asos-media.com/navigation/mw_gbl_clothing_jeans_106513435_2m",
    "https://images.asos-media.com/navigation/mw_gbl_clothing_activewear_2001258_2m",
    "https://images.asos-media.com/navigation/mw_gbl_clothing_hoodies_sweatshirts_flo_121632328_3m",
    "https://images.asos-media.com/navigation/mw_gbl_clothing_joggers_flo_1958502_3m"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: const BackButton(
          color: Colors.red,
        ),
        title: Text(
          "Men Category",
          style: TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 19, 140, 206),
              fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 60,
        actions: [
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
                size: 30,
              )),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/favourite',
                );
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
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SingleChildScrollView(
                  child: Scrollbar(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.78,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          childAspectRatio: (0.82 / 1.15),
                        ),
                        itemCount: cate_M.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              child: Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 175,
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
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network('${imag_M[index]}',
                                            width: 175,
                                            height: 190,
                                            fit: BoxFit.fitHeight),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        width: 175,
                                        height: 51,
                                        child: Text(
                                          name_M[index],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () async {
                                Navigator.pushNamed(context, '/product',
                                    arguments: Id(id: cate_M[index]));
                              });
                        },
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
