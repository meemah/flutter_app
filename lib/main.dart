import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Test',
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Coffee Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedPosition = 0;
  
  String _coffeePrice ="0";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.title),
        leading: Icon(Icons.cancel),
        actions: [
          Icon(Icons.favorite_border)
        ],
      ),
      body: Padding(padding: EdgeInsets.all(20), child: _mainBody(),) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  Widget _mainBody(){
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 0,
              child: Stack(
            children: [
              Container(
                width: double.maxFinite,
                height: 250,
                margin: EdgeInsets.only(left: 50, right: 50, bottom: 50, top: 60),
                decoration: BoxDecoration(borderRadius:
                BorderRadius.all(Radius.circular(180)),
                    color: Color.fromRGBO(239, 235, 233, 100)),
              ),
              Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                height: 350,
                child: Image.asset("images/cup_of_coffee.png", height: 300,),
              )
            ],
          )),
          Padding(padding: EdgeInsets.all(10),),
          Expanded(flex: 0,child: Text("Espresso Latte",
            style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 30),)),
          Padding(padding: EdgeInsets.all(6),),
          Expanded(flex: 0, child: Text("Select the cup size you want and we will deliver it to you in less than 48hours",
            style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 14, color: Colors.black45,),
            textAlign: TextAlign.start,),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, left: 20),
            height: 55,
            width: double.maxFinite,
            alignment: Alignment.center,
            child:Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(text: TextSpan(
                  text: "N",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 25, color: Colors.black87),
                  children: [
                    TextSpan(text: _coffeePrice, style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold))
                  ]
                ),),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                ),
                ListView.builder(itemBuilder: (context, index){

                  return InkWell(
                    child: _coffeeSizeButton(_selectedPosition == index,
                        index ==0? "S" : index ==1? "M": "L"),
                    onTap: (){
                      setState(() {
                        this._coffeePrice= index ==0? "300" : index ==1? "600": "900";
                        _selectedPosition = index;
                      });
                    },
                  );
                }, scrollDirection: Axis.horizontal,
                  itemCount: 3, shrinkWrap: true,),

              ],),
          ),

          Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.all(10),
            width: double.maxFinite,
            height: 70,
            child: FlatButton(onPressed: (){

            }, child: Center(child: Text("Add to Bag",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)
              ,),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _coffeeSizeButton(bool isSelected, String coffeeSize){
    return Stack(
      children: [
        Container(alignment: Alignment.center,  width: 55,
          child: Text(coffeeSize, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold,
              color: isSelected? Colors.blue: Colors.black45),),),
        new Container(
          margin: EdgeInsets.only(right: 10),
          child: Image.asset("images/coffee_cup_size.png", width:50, color: isSelected ? Colors.blue: Colors.black45,),
          decoration: BoxDecoration(border: Border(top: BorderSide(color: isSelected? Colors.blue: Colors.black45,
              width: isSelected? 2: 1), left: BorderSide(color: isSelected? Colors.blue: Colors.black45,
              width: isSelected? 2: 1), bottom: BorderSide(color: isSelected? Colors.blue: Colors.black45,
              width: isSelected? 2: 1), right:  BorderSide(color: isSelected ?Colors.blue: Colors.black45 ,
              width: isSelected? 2: 1)), borderRadius: BorderRadius.all(Radius.circular(5))),
        )
      ],
    );
  }

}
