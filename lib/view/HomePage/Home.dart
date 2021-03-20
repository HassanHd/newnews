import 'package:cleennews/%20basicswidget/custombutton.dart';
import 'package:cleennews/%20basicswidget/nave.dart';
import 'package:cleennews/%20basicswidget/texttitel.dart';
import 'package:cleennews/services/Api.dart';
import 'package:cleennews/view/CategoriesPages/Categories.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constant.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> {
  NewsApi newsApi = NewsApi();
  Future<void> _rateapp(String x) async {
    var urlrate =x;
    if (await canLaunch(urlrate)) {
      await launch(urlrate);
    } else {
      await launch(urlrate);
      //throw 'Could not launch $facebook';
    }
  }

  @override
  void initState() {
    newsApi.fetchArticles();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                right: 20.0, left: 20.0, top: 30.0, bottom: 10.0),
            child: CustomText(
              alignment: Alignment.topLeft,
              fontSize: 36,
              color: textcolor,
              text: "Choose News Categories",
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 5.0, left: 5.0),
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child:
                  ListView(scrollDirection: Axis.horizontal, children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RaisedButton(
                        child: Text('General',style: TextStyle(color: Colors.white),),

                        onPressed: (){
                          NavigationService.instance.navigationKey.currentState.pushNamed(
                            "Categories",
                            arguments: {"categore": "general"},
                          );
                        },

                        color: blue,
                        // padding: const EdgeInsets.all(5.0),
                        shape:new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RaisedButton(
                        child: Text('Science',style: TextStyle(color: Colors.white),),

                        onPressed: (){
                          NavigationService.instance.navigationKey.currentState.pushNamed(
                            "Categories",
                            arguments: {"categore": "science"},
                          );
                        },

                        color: yellow,
                         // padding: const EdgeInsets.all(5.0),
                        shape:new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RaisedButton(
                        child: Text('Health',style: TextStyle(color: Colors.white),),

                        onPressed: (){
                          NavigationService.instance.navigationKey.currentState.pushNamed(
                            "Categories",
                            arguments: {"categore": "health"},
                          );
                        },

                        color: red,
                       // padding: const EdgeInsets.all(5.0),
                        shape:new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RaisedButton(
                        child: Text('Business',style: TextStyle(color: Colors.white),),

                        onPressed: (){
                          NavigationService.instance.navigationKey.currentState.pushNamed(
                            "Categories",
                            arguments: {"categore": "business"},
                          );
                        },

                        color: green,
                        padding: const EdgeInsets.all(5.0),
                        shape:new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RaisedButton(
                        child: Text('Sports',style: TextStyle(color: Colors.white),),

                        onPressed: (){
                          NavigationService.instance.navigationKey.currentState.pushNamed(
                            "Categories",
                            arguments: {"categore": "sports"},
                          );
                        },

                        color: orangelight,
                        // padding: const EdgeInsets.all(5.0),
                        shape:new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RaisedButton(
                        child: Text('Entertainment',style: TextStyle(color: Colors.white),),

                        onPressed: (){
                          NavigationService.instance.navigationKey.currentState.pushNamed(
                            "Categories",
                            arguments: {"categore": "entertainment"},
                          );
                        },

                        color: blue,
                        // padding: const EdgeInsets.all(5.0),
                        shape:new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text('Technology',style: TextStyle(color: Colors.white),),

                        onPressed: (){
                          NavigationService.instance.navigationKey.currentState.pushNamed(
                            "Categories",
                            arguments: {"categore": "technology"},
                          );
                        },

                        color: orangedark,
                        // padding: const EdgeInsets.all(5.0),
                        shape:new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),

                      ),
                    ),






              ]),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                right: 20.0, left: 20.0, top: 30.0, bottom: 10.0),
            child: CustomText(
              alignment: Alignment.topLeft,
              fontSize: 22,
              color: textcolor,
              text: "Bast News",
            ),
          ),
          Expanded(
              child: Container(
                  padding:
                      EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
                  child: FutureBuilder(
                      future: newsApi.fetchArticles(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return Center(
                              child: CircularProgressIndicator(
                            backgroundColor: Colors.yellow,
                          ));
                        } else {
                          return  ListView.builder(
                          itemCount: snapshot.data.length,
    itemBuilder: (context, i)  {
      return  GestureDetector(
        onTap: () {
          _rateapp(snapshot.data[i].url);
        },
        child: new Card(
          child: new Container(
            child: new Column(
              children: <Widget>[
                Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.network(snapshot.data[i].urlToImage, fit: BoxFit.fitWidth),
                      ),
                      Text(snapshot.data[i].title, style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w800),textAlign: TextAlign.center,),
                    ]
                ),
              ],
            ),
          ),
        ),
      );
                              });
                        }
                      }))),
        ],
      ),
    );
  }
}
