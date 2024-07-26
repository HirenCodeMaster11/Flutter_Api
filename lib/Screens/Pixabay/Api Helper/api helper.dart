import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiHelper
{

  Future<Map> fetchApiData(String search)
  async {
     String api = 'https://pixabay.com/api/?key=45125781-1d67fb2dd49fcda36df785f07&q=$search&image_type=photo';
    Uri url = Uri.parse(api);

    Response response = await http.get(url);

    if(response.statusCode == 200)
      {
        final json = response.body;
        final Map data = jsonDecode(json);
        return data;
      }
    else
      {
        return{};
      }
  }
}
