import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiHelper
{
  Future<String?> fetchApiData()
  async {
    Uri url = Uri.parse('https://dummyjson.com/products');

    Response response = await http.get(url);

    if(response.statusCode == 200)
      {
        final json = response.body;
        print('api called');
        // final data = jsonDecode(json);
        return json;
      }
    else
      {
        return null;
      }
  }
}