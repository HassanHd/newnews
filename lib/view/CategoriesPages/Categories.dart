import 'package:cleennews/%20basicswidget/texttitel.dart';
import 'package:cleennews/services/Api.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant.dart';
class Categories extends StatefulWidget {


@override
_CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  var categore;
  NewsApi newsApi = NewsApi();
  Future<void> rateapp(String x) async {
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
    newsApi.fetchArticlesByCategory(categore);

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context).settings.arguments;
    print(args["categore"]);
    categore=args["categore"];

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
            padding: EdgeInsets.only(
                right: 20.0, left: 20.0, top: 30.0, bottom: 10.0),
            child: CustomText(
              alignment: Alignment.topLeft,
              fontSize: 22,
              color: textcolor,
              text: categore,
            ),
          ),
          Expanded(
              child: Container(
                  padding:
                  EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
                  child: FutureBuilder(
                      future: newsApi.fetchArticlesByCategory(categore),
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
                                    rateapp(snapshot.data[i].url);
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
