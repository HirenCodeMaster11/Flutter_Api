import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiHelper
{
  Future<String?> fetchApiData()
  async {
    Uri url = Uri.parse('https://dummyjson.com/recipes');
    Response response = await http.get(url);

    if(response.statusCode == 200)
    {
      return response.body;
      // Map data = jsonDecode(json);
      // return data;
    }
    else
    {
      return null;
    }
  }
}