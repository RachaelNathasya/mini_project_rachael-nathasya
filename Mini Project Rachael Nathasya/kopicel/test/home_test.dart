import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kopicel/home.dart';
import 'package:kopicel/view/cart_page.dart';
import 'package:kopicel/view/favorite_page.dart';
import 'package:kopicel/view/home_page.dart';
import 'package:kopicel/view/profile_page.dart';

void main() {
  testWidgets('Home', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Home(),
    ));

    expect(find.byType(HomePage), findsOneWidget);

    await tester.tap(find.byIcon(Icons.favorite_outline));
    await tester.pump();

    expect(find.byType(FavoritePage), findsOneWidget);

    await tester.tap(find.byIcon(Icons.shopping_cart_outlined));
    await tester.pump();

    expect(find.byType(CartPage), findsOneWidget);

    await tester.tap(find.byIcon(Icons.person_outline));
    await tester.pump();

    expect(find.byType(ProfilePage), findsOneWidget);
  });
}
