import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  static const route = "/payment";
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

List<String> paymentType = ["Paypal", "Credit", "Wallet"];
// rgb(114, 98, 231)
// Color primaryColor = Color.fromRGBO(242, 174, 163, 1);
// Color primaryColorLight = Color.fromRGBO(242, 174, 163, 1);
// rgb(231, 232, 236)
const kBoldText = TextStyle(fontWeight: FontWeight.bold);
Color primaryColor = Color.fromRGBO(114, 98, 231, 1);
Color primaryColorLight = Color.fromRGBO(114, 98, 231, 0.8);
Color backgroundColor = Color.fromRGBO(231, 232, 236, 1);
bool isSwitched = false;


String totalPrice;

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    totalPrice = ModalRoute.of(context).settings.arguments;
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
            height: MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Total Amount",style: kBoldText
                      ),
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
                      Text("Payment Method",style: kBoldText),
                      SizedBox(height: 5),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: MaterialButton(
                                focusColor: primaryColorLight,
                                onPressed: () {
                                  
                                },
                                color: primaryColorLight,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    
                                    Text(
                                      paymentType[index],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Icon(Icons.arrow_drop_down),
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
                        style:kBoldText,
                      ),
                      SizedBox(height: 5),
                     
                       
                      TextField(
                        decoration: InputDecoration(
                        
                         prefixIcon: Image.asset("images/mastercard_logo.jpg",width: 60,) ,
                         prefixIconConstraints:BoxConstraints(
                            maxWidth: 70
                         ),
                        hintText: "**** **** **** ****",
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none
                          ),
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
                    Text("Save Card for Future Payment",style: kBoldText,),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {},
                      activeColor: primaryColor,
                      inactiveThumbColor: primaryColorLight,
                    )
                  ],
                ),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.infinity,
                  color: primaryColor,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Proceed to Confirm",
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
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
