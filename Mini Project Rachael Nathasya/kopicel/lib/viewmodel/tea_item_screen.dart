import 'package:flutter/material.dart';
import 'package:kopicel/view/cart_page.dart';
import 'package:kopicel/view/favorite_page.dart';

List descript = [
  'Iced tea is a refreshing beverage made by brewing tea and then cooling it down with ice. It can be served sweetened or unsweetened and is often garnished with lemon or other fruits.',
  'It seems like there might be a typo in the name "Lecy Tea." Its not a common term for a type of tea. If you meant Lychee Tea, it is a flavorful tea infused with the sweet and fragrant taste of lychee fruit.',
  'Lemon tea is a delightful blend of tea and freshly squeezed lemon juice. It offers a zesty and refreshing flavor with a hint of citrus.',
  'Mango tea is a tropical delight, typically made by infusing tea with the fruity essence of mango. It has a sweet and exotic taste thats perfect for those who love the flavor of mango.',
  'Strawberry tea is a delightful infusion of tea with the sweet and fruity essence of strawberries. It provides a pleasant and mildly sweet flavor.',
  'Thai tea is a popular beverage in Thailand, known for its unique orange color and sweet, creamy taste. Its often served with condensed milk and ice, creating a delightful and slightly spiced flavor.',
];

class SingleTeaItemScreen extends StatelessWidget {
  String img;
  String price;
  String descript;

  SingleTeaItemScreen(this.img, this.price, this.descript);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 30, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xff856c4c),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Center(
                  child: Image.asset(
                    "assets/tea/$img.jpg",
                    width: MediaQuery.of(context).size.width / 1.2,
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            img,
                            style: TextStyle(
                              fontSize: 30,
                              letterSpacing: 1,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "${price}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "${descript}",
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 3,
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CartPage(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 30,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xff967259),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Text(
                                "Add to Cart",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => FavoritePage(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xff967259),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Icon(
                                Icons.favorite_outline,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
