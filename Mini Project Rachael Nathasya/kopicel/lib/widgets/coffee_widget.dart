import 'package:flutter/material.dart';
import 'package:kopicel/screens/coffee_item_screen.dart';

class CoffeeWidget extends StatelessWidget {
  List img = [
    'Americano',
    'Butterscotch Latte',
    'Cappucino',
    'Caramel Machiato',
    'Coffee Latte',
    'Mocha',
    'Vanilla Latte',
    'KopSu Aren',
    'Gresso',
    'Taro Latte',
    'Nutella Latte',
    'Ice Coffee Jelly',
  ];

  List price = [
    'Rp 18.000',
    'Rp 18.000',
    'Rp 20.000',
    'Rp 22.000',
    'Rp 20.000',
    'Rp 22.000',
    'Rp 15.000',
    'Rp 17.000',
    'Rp 18.000',
    'Rp 18.000',
    'Rp 24.000',
    'Rp 25.000',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: (150 / 195),
      children: [
        for (int i = 0; i < img.length; i++)
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white10,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SingleCoffeeItemScreen(
                              img[i], price[i], deskripsi[i])),
                    );
                  },
                  child: Container(
                    child: Image.asset(
                      "assets/coffee/${img[i]}.jpg",
                      width: 220,
                      height: 220,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          img[i],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${price[i]}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(0, 136, 99, 69),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }
}
