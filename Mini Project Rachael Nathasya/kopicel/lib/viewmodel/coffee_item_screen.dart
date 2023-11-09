import 'package:flutter/material.dart';
import 'package:kopicel/view/cart_page.dart';
import 'package:kopicel/view/favorite_page.dart';

List deskripsi = [
  'A classic coffee drink made by diluting a shot of espresso with hot water. It has a strong and bold flavor.',
  'A sweet and creamy coffee beverage that combines espresso with steamed milk and butterscotch flavoring.',
  'A popular Italian coffee drink made with equal parts of espresso, steamed milk, and milk foam. It has a rich and frothy texture.',
  'A delightful coffee with espresso, steamed milk, and caramel syrup. Its known for its sweet and caramelized flavor.',
  'A milder coffee beverage made with espresso and a larger amount of steamed milk, resulting in a creamy and balanced taste.',
  'A delightful combination of espresso, steamed milk, and chocolate, giving it a rich and chocolaty flavor.',
  'A sweet and fragrant coffee made by blending espresso with steamed milk and vanilla syrup.',
  'This could be a special coffee unique to your establishment. It might have a local or signature flavor that sets it apart.',
  'Gresso is not a common coffee term. It could be a special or unique coffee created by your coffee shop.',
  'A unique and sweet coffee drink made with taro root flavoring. Its known for its purple color and sweet, nutty taste.',
  'A delicious coffee combining espresso with steamed milk and Nutella, creating a delightful hazelnut-chocolate flavor.',
  'A refreshing iced coffee with added coffee jelly cubes for a unique texture and taste.',
];

class SingleCoffeeItemScreen extends StatelessWidget {
  String img;
  String price;
  String deskripsi;

  SingleCoffeeItemScreen(this.img, this.price, this.deskripsi);

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
                    "assets/coffee/$img.jpg",
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
                        "${deskripsi}",
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
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                ),
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
