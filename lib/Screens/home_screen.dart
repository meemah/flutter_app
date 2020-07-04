import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutterapp/Screens/detail_screen.dart';
import 'package:flutterapp/coffee_card.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutterapp/json_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  static int currentItem = 0;
  
  List<Categories> categoriesList1 = [];


  Future _loadDataAsString() async {
    return await rootBundle.loadString("coffee.json");
  }

  Future _loadCategories() async {
    String jsonString = await _loadDataAsString();
    final jsonResponse = json.decode(jsonString);
    
    setState(() {
      categoriesList1 = new CategoriesList1.fromJson(jsonResponse).categories;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCategories();
    _pageController = PageController(viewportFraction: 0.75, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 231, 231, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 50.0, top: 50),
                child: Text(
                  "Select",
                  style: TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, bottom: 30),
                child: Text(
                  "Coffee",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, bottom: 15),
                child: SmoothPageIndicator(
                    effect: ExpandingDotsEffect(
                        dotHeight: 7.0,
                        dotWidth: 8.5,
                        activeDotColor: Colors.black87,
                        radius: 6.0,
                        spacing: 3.0),
                    controller: _pageController,
                    count: 3),
              ),
              Center(
                child: Container(
                  height: 350,
                  child: PageView.builder(
                      controller: _pageController,
                      itemCount: categoriesList1.length,
                      
                      itemBuilder: (context, index) {
                         
                        Contents contents = categoriesList1
                            [currentItem].contents[index];
                            var name = categoriesList1[currentItem].name;
                        
                        var subText = contents.name;
                        var image = contents.image;
                        var price = contents.price;

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailScreen(
                                  coffeeName: name,
                                  coffeeImage: image,
                                  coffeePrice: price,
                                );
                              }),
                            );
                          },
                          child: CoffeCard(
                              coffeeName: name,
                              coffeeImage: image,
                              coffeePrice: price,
                              coffeeSubtext: subText),
                        );
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (currentItem == 0) {
                              currentItem = 0;
                            } else {
                              currentItem -= 1;
                            }
                          });
                        },
                        child: Container(
                          width: 30,
                          height: 30.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Center(
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 30.0,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currentItem = index;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      // categoriesList1.categories[index].name
                                      categoriesList1[index].name,
                                      style: TextStyle(
                                        // fontWeight: FontWeight.w600,
                                        fontWeight: currentItem == index
                                            ? FontWeight.w600
                                            : FontWeight.w200,
                                        fontSize:
                                            currentItem == index ? 22 : 15,
                                        color: currentItem == index
                                            ? Colors.black
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: categoriesList1.length
                              // itemCount: categoriesList1.categories.length
                              ),
                        ),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
