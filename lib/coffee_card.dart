import 'package:flutter/material.dart';

class CoffeCard extends StatelessWidget {
  final coffeeName;
  final coffeeImage;
  final coffeePrice;
  final coffeeSubtext;
// rgb(242, 174, 163)
//  Color brown = Color.fromRGBO(242, 174, 163,0);
  // Color blackContainer =  Color.fromRGBO(37, 34, 44,0);
  // black = rgb(37, 34, 44)
//  Color greySign =  Color.fromRGBO(146, 144, 148,0);
  // rgb(146, 144, 148)

  const CoffeCard(
      {Key key,
      this.coffeeName,
      this.coffeeImage,
      this.coffeePrice,
      this.coffeeSubtext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var containerWidth = constraints.maxWidth;
        var containerHeight = constraints.maxHeight;
        
        return Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              
              width: 260,
              height: 330,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(45),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45),
              ),
              child: Image.asset(
                coffeeImage,
                width: 260,
                
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              bottom: 45,
              left: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    coffeeName,
                    style: TextStyle(
                        color: Color.fromRGBO(242, 174, 163, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                  Text(
                    coffeeSubtext,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        wordSpacing: 1.4),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: containerHeight / 90,
              right: containerWidth / 10,
             
              child: Container(
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text:"₦",style:TextStyle(
                            color: Color.fromRGBO(146, 144, 148,1)
                        ),
                        ),
                        TextSpan(
                          text: coffeePrice,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)
                        )
                      ]
                    ),
                  ),

                 
                ),
                width: 65,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(37, 34, 40, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );

    
  }
}
