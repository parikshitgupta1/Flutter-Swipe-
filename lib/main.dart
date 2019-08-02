import 'package:flutter/material.dart';
import 'PlanetCard.dart';
import 'CardDetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/cardDetails': (BuildContext context) {
            // return new CardDetails();
          }
        },
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<Widget> cardList = new List();

  void removeCards(index) {
    setState(() {
      cardList.removeAt(index);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cardList = _generateCards();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Tinder App"),
        backgroundColor: Colors.purple,
      ),
      body: Stack(alignment: Alignment.center, children: cardList),
    );
  }

  List<Widget> _generateCards() {
    List<PlanetCard> planetCard = new List();
    planetCard.add(
      PlanetCard(
          "Mussorie",
          "https://www.tripsavvy.com/thmb/LTudD1VFIPILWGW5MoCsgBmhOGs=/650x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/464741705-56a3c03d5f9b58b7d0d39809.jpg",
          70.0),
    );
    planetCard.add(
      PlanetCard(
          "Manali ",
          "https://www.tripsavvy.com/thmb/YGzlP0l5lE79cah0LdH8sSWe7EI=/650x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-535240938-591c2d7b3df78cf5fa4919b5.jpg",
          80.0),
    );
    planetCard.add(PlanetCard(
        "Gangtok (Sikkim)",
        "https://www.tripsavvy.com/thmb/5X29hRjFEbE-5IYT3PFk30kqMZ4=/650x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-675923006-5a82469c3418c6003689af24.jpg",
        90.0));
    planetCard.add(PlanetCard(
        "Darjeeling (West Bengal)",
        "https://www.tripsavvy.com/thmb/xbATyZ6fE8sMFYDrDXU7P1wnbgE=/650x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-503908231-591be3103df78cf5fa000b74.jpg",
        100.0));
    planetCard.add(
      PlanetCard(
          "Nainital (Uttarakhand)",
          "http://amazingindiablog.in/wp-content/uploads/2015/06/P5035083.jpg",
          110.0),
    );
    List<Widget> cardList = new List();

    for (int x = 0; x < 5; x++) {
      cardList.add(
        Positioned(
          top: planetCard[x].topMargin,
          child: Draggable(
              onDragEnd: (drag) {
                removeCards(x);
              },
              childWhenDragging: Container(),
              feedback: GestureDetector(
                onTap: () {
                  print("Hello All");
                },
                child: Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  // color: Color.fromARGB(250, 112, 19, 179),
                  child: Column(
                    children: <Widget>[
                      Hero(
                        tag: "imageTag",
                        child: Image.network(
                          planetCard[x].cardImage,
                          width: 320.0,
                          height: 440.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                          planetCard[x].cardTitle,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.purple,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return CardDetails(planetCard[x].cardImage, x);
                  }));
                },
                child: Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    // color: Color.fromARGB(250, 112, 19, 179),
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            image: DecorationImage(
                                image: NetworkImage(planetCard[x].cardImage),
                                fit: BoxFit.cover),
                          ),
                          height: 480.0,
                          width: 320.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Text(
                            planetCard[x].cardTitle,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.purple,
                            ),
                          ),
                        )
                      ],
                    )),
              )),
        ),
      );
    }
    return cardList;
  }
}
