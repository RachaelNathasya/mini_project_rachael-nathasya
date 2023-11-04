import 'package:flutter/material.dart';
import 'package:kopicel/page/profile_page.dart';
import 'package:kopicel/page/chat_page.dart';
import 'package:kopicel/widgets/sparkling_widget.dart';
import 'package:kopicel/widgets/frappuccino_widget.dart';
import 'package:kopicel/widgets/coffee_widget.dart';
import 'package:kopicel/widgets/tea_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
    ;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Text(
                        "KopiCel",
                        style: GoogleFonts.caveat(
                          fontSize: 80,
                          color: Color(0xff967259),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ChatPage(),
                        ));
                      },
                      child: Icon(
                        Icons.chat_outlined,
                        color: Color(0xff967259),
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Espresso Yourself!",
                  style: TextStyle(
                    color: Color(0xff967259),
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                width: MediaQuery.of(context).size.width,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Find your coffee",
                    hintStyle: TextStyle(
                      color: Color(0xff967259),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.brown.withOpacity(0.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(
                            0xff967259), // Mengubah warna border ketika input tidak aktif
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(
                            0xff967259), // Mengubah warna border ketika input aktif
                      ),
                    ),
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: Color(0xff967259),
                unselectedLabelColor: Color.fromARGB(255, 88, 58, 47),
                isScrollable: true,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 3,
                    color: Color(0xff967259),
                  ),
                  insets: EdgeInsets.symmetric(horizontal: 16),
                ),
                labelStyle: TextStyle(fontSize: 20),
                labelPadding: EdgeInsets.symmetric(horizontal: 30),
                tabs: [
                  Tab(text: "Coffee"),
                  Tab(text: "Frappuccino"),
                  Tab(text: "Tea"),
                  Tab(text: "Sparkling"),
                ],
              ),
              SizedBox(height: 10),
              Center(
                child: [
                  CoffeeWidget(),
                  FrappuccinoWidget(),
                  TeaWidget(),
                  SparklingWidget(),
                ][_tabController.index],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
