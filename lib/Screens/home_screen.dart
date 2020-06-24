import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/detail_screen.dart';
import 'package:flutterapp/coffee_card.dart';
import 'package:flutterapp/coffee_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Coffee coffee = CoffeeList.coffeeList[0];
  // EdgeInsets.only(top:50.0,left: 50,right: 0),

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
                  padding: const EdgeInsets.only(left: 50),
                  child: Text(
                    "Coffee",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2),
                  ),
                ),
                SizedBox(height: 60),
                Center(
                  child: Container(
                    // margin: EdgeInsets.only(right:10),
                    height: 350,
                    // width: MediaQuery.of(context).size.width/0.1,

                    child: PageView.builder(
                        controller: PageController(
                            viewportFraction: 0.75, initialPage: 0),
                        itemCount: CoffeeList.coffeeList.length,
                        itemBuilder: (context, index) {
                          Coffee coffee = CoffeeList.coffeeList[index];
                          var name = coffee.coffeeName;
                          var image = coffee.coffeeImage;
                          var price = coffee.coffeePrice;
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return DetailScreen(coffeeName: name,coffeeImage: image,coffeePrice: price,);
                                }),
                              );
                            },
                            child: CoffeCard(
                                coffeeName: name,
                                coffeeImage: image, 
                                coffeePrice: price,
                                coffeeSubtext: coffee.coffeesubText),
                          );
                        }),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
