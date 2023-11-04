import 'package:flutter/material.dart';
import 'package:kopicel/page/cart_page.dart';
import 'package:kopicel/page/favorite_page.dart';

List desc = [
  ' A delightful frozen coffee drink with a rich and indulgent chocolate flavor. Its perfect for chocolate lovers who enjoy a refreshing coffee-based treat.',
  'A refreshing and energizing frappuccino made with green tea. It offers a balance of earthy and slightly sweet flavors, often blended with ice for a cool, revitalizing experience.',
  'A sweet and creamy frappuccino that combines the classic Oreo cookie flavor with coffee and ice. Its a popular choice for those who love cookies and cream desserts.',
  'A dessert-like frappuccino inspired by the popular red velvet cake. It typically features a blend of red velvet cake flavors and coffee, resulting in a sweet and smooth drink.',
  'A unique and sweet frappuccino made with taro root, a starchy and mildly nutty-flavored ingredient. It often includes coffee and provides a delightful, exotic taste.',
  'A classic and timeless frappuccino flavor that combines the sweetness of vanilla with the richness of coffee. Its a crowd-pleaser known for its smooth and comforting taste.',
];

class SingleFrappuccinoItemScreen extends StatelessWidget {
  String img;
  String price;
  String desc;

  SingleFrappuccinoItemScreen(this.img, this.price, this.desc);

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
                    "assets/frappuccino/$img.jpg",
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
                        "${desc}",
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
