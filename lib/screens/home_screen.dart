import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:yolobank/widget/bank_card_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _cardList = ["1", "2", "3"];

  PageController _controller =
      PageController(initialPage: 0, viewportFraction: 0.75);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: SlidingUpPanel(
          minHeight:200,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
          panelBuilder: (sc) => _panel(sc),
          body: slidingBody()),
    );
  }

  Widget slidingBody() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "My Cards",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              InkWell(
                child: Stack(
                  children: <Widget>[
                    Icon(Icons.notifications),
                    Positioned(
                      right: 0,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.yellow),
                            shape: BoxShape.circle,
                            color: Colors.red),
                      ),
                    ),
                  ],
                ),
                onTap: () {},
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 40),
          height: 175,
          child: PageView.builder(
              
              controller: _controller,
              itemCount: _cardList.length,
              itemBuilder: (context, index) {
                return BankCardWidget();
              }),
        ),
        Padding(
          padding: EdgeInsets.only(left: 35, right: 35, top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              customButton(icon: Icons.arrow_downward, text: "Tap up"),
              customButton(icon: Icons.arrow_forward, text: "Send"),
              customButton(icon: Icons.add, text: "Pay"),
            ],
          ),
        ),
      ],
    );
  }

  Widget customButton({IconData icon, String text}) {
    return Column(
      children: <Widget>[
        RaisedButton(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(icon),
          ),
          shape: CircleBorder(),
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(controller: sc, children: <Widget>[
          SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ],
          ),
          SizedBox(
            height: 18.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Today",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      Text(
                        "Search",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
