import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kopicel/page/profile_page.dart';
import 'package:kopicel/screens/login_screen.dart';
import 'package:kopicel/screens/welcome_screen.dart';

void main() {
  testWidgets('ProfilePage', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ProfilePage(),
    ));

    expect(find.text("Profile"), findsOneWidget);
    expect(find.byType(ProfileBody), findsOneWidget);
    expect(find.byType(ProfilePic), findsOneWidget);
    expect(find.byType(ProfileMenu), findsNWidgets(5));

    await tester.tap(find.text("Log Out"));
    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);
  });

  testWidgets('ProfileMenu', (WidgetTester tester) async {
    bool callbackCalled = false;
    void mockCallback() {
      callbackCalled = true;
    }

    await tester.pumpWidget(
      MaterialApp(
        home: ProfileMenu(
          text: "My Account",
          icon: "assets/icons/User Icon.svg",
          press: mockCallback,
        ),
      ),
    );

    expect(find.text("My Account"), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);

    await tester.tap(find.text("My Account"));
    await tester.pump();

    expect(callbackCalled, true);
  });

  testWidgets('ProfilePic', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ProfilePic(),
    ));

    expect(find.byType(CircleAvatar), findsOneWidget);
    expect(find.byType(TextButton), findsOneWidget);

    await tester.tap(find.byIcon(Icons.camera_alt_outlined));
    await tester.pump();
  });
}
