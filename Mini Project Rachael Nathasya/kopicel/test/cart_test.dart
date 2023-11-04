import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kopicel/page/cart_page.dart';

void main() {
  testWidgets('CartPage', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CartPage(),
    ));

    expect(find.text('Keranjang'), findsOneWidget);
    expect(find.byType(CartItemWidget), findsNWidgets(3));

    await tester.tap(find.byType(TextButton).last);
    await tester.pump();
  });
}
