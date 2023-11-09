import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItem {
  String name;
  int price;
  int quantity;

  CartItem({required this.name, required this.price, required this.quantity});
}

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem(name: 'Americano', price: 18000, quantity: 1),
    CartItem(name: 'Butterscotch Latte', price: 18000, quantity: 1),
    CartItem(name: 'Ice Coffee Jelly', price: 25000, quantity: 1),
  ];

  int totalHarga = 0;

  @override
  void initState() {
    super.initState();
    calculateTotalHarga();
  }

  // Calculate the total price in the cart
  void calculateTotalHarga() {
    totalHarga = cartItems.fold(
        0, (total, item) => total + (item.price * item.quantity));
  }

  // Update quantity of an item in the cart
  void updateQuantity(int index, int newQuantity) {
    setState(() {
      cartItems[index].quantity = newQuantity;
      calculateTotalHarga();
    });
  }

  // Remove an item from the cart
  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
      calculateTotalHarga();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Keranjang',
          style: GoogleFonts.inter(
            color: Color(0xff1d222d),
          ),
        ),
        backgroundColor: Color(0xff967259),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return CartItemWidget(
                    item: cartItems[index],
                    onUpdateQuantity: (newQuantity) {
                      updateQuantity(index, newQuantity);
                    },
                    onRemove: () {
                      removeItem(index);
                    },
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Harga : Rp ${totalHarga.toString()}',
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle the "Pesan" action here
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      width: 96,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xff856c4c),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Pesan',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final Function(int) onUpdateQuantity;
  final VoidCallback onRemove;

  CartItemWidget({
    required this.item,
    required this.onUpdateQuantity,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 96,
            height: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/coffee/${item.name}.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff1d222d),
                  ),
                ),
                Text(
                  'Rp ${item.price}',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff1d222d),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff886345)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (item.quantity > 1) {
                            onUpdateQuantity(item.quantity - 1);
                          }
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Center(
                          child: Text(
                            '-',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff886345),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      item.quantity.toString(),
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff886345)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextButton(
                        onPressed: () {
                          onUpdateQuantity(item.quantity + 1);
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Center(
                          child: Text(
                            '+',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff886345),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onRemove,
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
