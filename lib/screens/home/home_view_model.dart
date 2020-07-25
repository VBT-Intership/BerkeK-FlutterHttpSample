import 'dart:convert';
import 'dart:io';
import 'package:examplehttpapp/screens/home/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home.dart';

abstract class HomeViewModel extends State<Home> {

  List<HomeModel> httpEarthquakes = [];
  final String _baseUrl = "https://turkiyedepremapi.herokuapp.com";

  double get pageHeight => MediaQuery.of(context).size.height;
  double get pageWidth => MediaQuery.of(context).size.height;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getEarthquakesList();
  }

  Future<void> getEarthquakesList() async {
    isLoadingChange();
    final response = await http.get("$_baseUrl/api");
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body);
        if (jsonBody is List) {
          httpEarthquakes = jsonBody.map((e) => HomeModel.fromJson(e)).toList();
        }
        break;
      default:
    }

    isLoadingChange();
  }

  void isLoadingChange() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}