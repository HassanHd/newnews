// body: Center(
// child: RaisedButton(
// onPressed: () async {
// NewsApi newsApi=NewsApi();
// var data=await newsApi.fetchArticles();
// for(var x in data){
// print("title------------->"+x.title);
// }
// },
// child: Text("fetchData"),
// )),