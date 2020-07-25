import 'package:examplehttpapp/screens/home/home_view_model.dart';
import 'package:examplehttpapp/screens/home/model/home_model.dart';
import 'package:flutter/material.dart';

class HomeView extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.rotate_left),
        onPressed: () {
          getEarthquakesList();
        },
      ),
      appBar: buildAppBar(),
      body: ListView.builder(
        itemCount: httpEarthquakes.length,
        itemBuilder: (context, index) {
          return buildCard(httpEarthquakes[index]);
        },
      ),
    );
  }

  Widget buildCard(HomeModel model) {
    return ListTile(
      leading: Icon(Icons.book),
      title: Text(model.yer),
      trailing: Text(model.buyukluk),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: buildVisibilityLoading(),
      title: Text("Earthquakes List"),
    );
  }

  Visibility buildVisibilityLoading() {
    return Visibility(
      visible: isLoading,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      ),
    );
  }
}