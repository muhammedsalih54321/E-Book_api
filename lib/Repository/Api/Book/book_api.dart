import 'dart:convert';


import 'package:e_book/Repository/Api/api_client.dart';
import 'package:e_book/Repository/Model/book_model.dart';

import 'package:http/http.dart';


class BookApi {
  ApiClient apiClient = ApiClient();

   Future<List<Bookmodel>> getBook() async {
    String trendingpath = 'https://all-books-api.p.rapidapi.com/getBooks';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return Bookmodel.listFromJson(jsonDecode(response.body));
  }
  
}