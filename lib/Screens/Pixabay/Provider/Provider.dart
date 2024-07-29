import 'package:flutter/cupertino.dart';

import '../Api Helper/api helper.dart';
import '../Modal/pixabayModal.dart';

class PixabayProvider extends ChangeNotifier {
  ApiHelper apiHelper = ApiHelper();
  Pixabay? pixabay;
  String search = '';

  void searchImage(String img)
  {
    search = img;
    notifyListeners();
  }
  Future<Pixabay?> fromMap(String img) async {

    final data = await apiHelper.fetchApiData(img);
    pixabay = Pixabay.fromJson(data);

    print(pixabay);

    return pixabay;
  }
}
