import 'dart:convert';

import 'package:news/0_Data/exceptions/exceptions.dart';

import '../models/news_model.dart';
import 'package:http/http.dart' as http;

abstract class NewsRemoteDataSource {
  Future<News> getNewsFromApi();
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final http.Client client;
  NewsRemoteDataSourceImpl({required this.client});
  @override
  Future<News> getNewsFromApi() async {
    final response = await client.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=8b38b42439bd40d3a599005d0cc8146d'));

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      var responseBody = json.decode(response.body);
      print('pizo$responseBody');
      return News.fromJson(responseBody);
    }
  }
}
