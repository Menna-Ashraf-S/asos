import 'package:flutter/material.dart';
import 'package:flutter_app/local/id.dart';
import 'package:flutter_app/pages/cart.dart';
import 'package:flutter_app/pages/favourite.dart';

class WomanCate extends StatefulWidget {
  const WomanCate({super.key});

  @override
  State<WomanCate> createState() => _CategoryState();
}

class _CategoryState extends State<WomanCate> {
  List<int> cate_Wm = [4169, 8799, 2641, 3630, 26091, 11321, 11318, 2639, 7618];
  List<String> name_Wm = [
    "Tops",
    "Dresses",
    "Coats & Jackets",
    "Jeans",
    "Activewear",
    "Hoodies & Sweatshirts",
    "Shirts & Blouses",
    "Skirts",
    "Jumpsuits & Rompers"
  ];
  List<String> imag_Wm = [
    "https://images.asos-media.com/navigation/ww_gbl_clothing_tops_3m_121136067",
    "https://images.asos-media.com/navigation/ww_gbl_clothing_dresses_2M_108617260",
    "https://images.asos-media.com/navigation/ww_gbl_clothing_coatsjackets_2M_103248782",
    "https://images.asos-media.com/navigation/ww_gbl_clothing_jeans_2M_104923879",
    "https://images.asos-media.com/navigation/ww_gbl_clothing_activewear_2M_1964731",
    "https://images.asos-media.com/navigation/ww_sr_clothing_hoodies%26sweatshirts_3m_1335337",
    "https://images.asos-media.com/navigation/ww_clothing_shirtsblouses_3m_103919421",
    "https://images.asos-media.com/navigation/ww_gbl_clothing_skirts_2M_105009777",
    "https://images.asos-media.com/navigation/ww_gbl_clothing_jumpers%26playsuits_3m_1631475"
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
          "Women Category",
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
      body: SingleChildScrollView(
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
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: (0.82 / 1.15),
                  ),
                  itemCount: cate_Wm.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.width * 0.75,
                      child: GestureDetector(
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
                                    child: Image.network(
                                      '${imag_Wm[index]}',
                                      width: 175,
                                      height: 190,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    width: 175,
                                    height: 51,
                                    child: Text(
                                      name_Wm[index],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () async {
                            Navigator.pushNamed(context, '/product',
                                arguments: Id(id: cate_Wm[index]));
                          }),
                    );
                  },
                ),
              ),
            ]),
      ),
    );
  }
}
