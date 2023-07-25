import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trendy_news/utils/key.dart';
import 'package:trendy_news/components/searchbar.dart';

Future<List> fetchnews() async{
  final response = await http.get(
    Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey='+
    Key1.key+ '&q='+ SearchBar1.searchcontroller.text),
  );
  Map result = jsonDecode(response.body);
  print('Fetched');

  return (result['articles']);

}