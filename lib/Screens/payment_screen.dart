import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  static const route = "/payment";
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

List<String> paymentType = ["Paypal", "Credit", "Wallet"];

// "Credit", "Wallet"];

const kBoldText = TextStyle(fontWeight: FontWeight.bold);

Color primaryColor = Color(0xff795548);
Color primaryColorLight = Color(0xffa1887f);

Color backgroundColor = Color.fromRGBO(231, 232, 236, 1);
bool isSwitched = false;

String totalPrice;

var _largeButtonWidth = 200.0;

var _screenWidth;

// var _smallButtonColor;
var _selectedButtonIndex = 0;
// var _smallButtonHeight = 50.0;
bool isSelected = false;
double _btnPadding = 8.0;

class _PaymentScreenState extends State<PaymentScreen> {
  static final Duration _animationDuration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    totalPrice = ModalRoute.of(context).settings.arguments;
    _screenWidth = MediaQuery.of(context).size.height;

    final appBar = AppBar(
      title: Text("Payment Data"),
      backgroundColor: backgroundColor,
      elevation: 0,
    );
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: _screenWidth -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Total Amount", style: kBoldText),
                      Text(
                        totalPrice,
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Payment Method", style: kBoldText),
                      SizedBox(height: 5),
                      Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: 
                          // PageView.builder(
                          //     controller: PageController(viewportFraction: 0.8),
                          //     onPageChanged: (pageIndex) {
                          //       setState(() {
                          //          _selectedButtonIndex = pageIndex;
                          //       });
                               
                          //     },
                          //     itemCount: paymentType.length,
                          //     itemBuilder: (ctx, index) {
                          //       return AnimatedContainer(
                          //         duration: _animationDuration,
                          //         padding: EdgeInsets.symmetric(
                          //             horizontal:
                          //             _btnPadding
                          //             //  _selectedButtonIndex == index ? 15.0: 8.0
                          //             ),
                          //         onEnd: () {
                          //           setState(() {
                          //             _btnPadding = 8.0;
                          //           });
                          //         },
                          //         child: MaterialButton(
                          //           minWidth: 200,
                          //           onPressed: () {
                          //             setState(() {
                          //               _selectedButtonIndex == index ? _btnPadding = 12: _btnPadding =8;
                          //             });
                          //           },
                          //           color: primaryColor,
                          //           shape: RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.circular(8.0),
                          //           ),
                          //           child: Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.spaceBetween,
                          //             children: <Widget>[
                          //               Text(
                          //                 paymentType[index],
                          //                 style: TextStyle(color: Colors.white),
                          //               ),
                          //               SizedBox(width: 5),
                          //               Icon(
                          //                 Icons.check_circle_outline,
                          //                 color: Colors.white,
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       );
                          //     })

                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (ctx, index) {
                              return AnimatedContainer(
                                padding: EdgeInsets.symmetric(

                                 horizontal:  (_selectedButtonIndex == index)

                                      ? _btnPadding
                                      : _btnPadding = _btnPadding + 2.0,
                                ),
                                duration: _animationDuration,
                                onEnd: () {
                                  setState(() {
                                    isSelected = false;
                                    _btnPadding = 8.0;
                                  });
                                },
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                _selectedButtonIndex = index;
                                isSelected = true;
                                _btnPadding = 10.0;
                              });
                            },
                            color: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  paymentType[index],
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                              );
                            },
                            itemCount: paymentType.length,
                          ),
                          ),
                    ]),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Card Number",
                        style: kBoldText,
                      ),
                      SizedBox(height: 5),
                      TextField(
                        decoration: InputDecoration(
                            prefixIcon: Image.asset(
                              "images/mastercard_logo.jpg",
                              width: 60,
                            ),
                            prefixIconConstraints: BoxConstraints(maxWidth: 70),
                            hintText: "**** **** **** ****",
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none),
                      ),
                    ]),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: paymentInput(
                          titleOfInput: "Valid Until", hintText: "Month/Year"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child:
                            paymentInput(titleOfInput: "CVV", hintText: "***"))
                  ],
                ),
                paymentInput(
                    titleOfInput: "Card Holder",
                    hintText: "Your Name and Surname"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Save Card for Future Payment",
                      style: kBoldText,
                    ),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {},
                      activeColor: primaryColor,
                      inactiveThumbColor: primaryColorLight,
                    )
                  ],
                ),
                Center(
                  child: AnimatedContainer(
                    duration: _animationDuration,
                    width: _largeButtonWidth,
                    onEnd: () {
                      setState(() {
                        // _largeButtonWidth == 200.0
                        //     ? _largeButtonWidth = 300
                        //     :
                        _largeButtonWidth = 200;
                      });
                    },
                    child: MaterialButton(
                      elevation: 0,
                      onHighlightChanged: (bool) {
                        if (bool) {
                          setState(() {
                            _largeButtonWidth += 50;
                          });
                        }
                      },
                      color: primaryColor,
                      onPressed: () {
                        // setState(() {
                        //     _largeButtonWidth += 50;
                        //   });
                        // Navigator.pop(context);
                      },
                      child: Text(
                        "Proceed to Confirm",
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget paymentInput({
    titleOfInput,
    hintText,
  }) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            titleOfInput,
            style: kBoldText,
          ),
          SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
                hintText: hintText,
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none),
          ),
        ]);
  }
}
