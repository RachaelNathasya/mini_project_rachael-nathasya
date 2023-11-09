import 'package:flutter/material.dart';
import 'package:kopicel/view/cart_page.dart';
import 'package:kopicel/view/favorite_page.dart';

List description = [
  'Apple sparkling beverages typically feature the crisp and refreshing flavor of apples. These drinks are often carbonated, providing a fizzy and invigorating experience. They are a popular choice for those who enjoy the natural sweetness and tanginess of apples in a sparkling form.',
  'Blueberry sparkling drinks offer a burst of sweet and tart blueberry flavor. The carbonation adds a refreshing twist to the natural fruit taste, making it a delightful and effervescent choice.',
  'Orange sparkling beverages capture the zesty and citrusy essence of oranges. They are known for their vibrant and tangy flavor, coupled with the effervescence of carbonation. These drinks are perfect for those who love the taste of oranges in a fizzy form.',
  'Strawberry sparkling drinks combine the luscious and sweet taste of strawberries with the fun and effervescence of carbonation. They offer a delightful balance of fruitiness and bubbles, making them a fruity and refreshing option.',
];

class SingleSparklingItemScreen extends StatelessWidget {
  String img;
  String price;
  String description;

  SingleSparklingItemScreen(this.img, this.price, this.description);

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
                    "assets/sparkling/$img.jpg",
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
                        "${description}",
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
