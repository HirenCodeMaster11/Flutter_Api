import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../Api Helper/api helper.dart';
import '../Modal/pixabayModal.dart';

class HomeProvider extends ChangeNotifier
{
  Helper helper = Helper();
  SearchModal? searchModal;
  String search = '';
  int selectIndex = 0;


  void searchImg(String img)
  {
    search = img;
    notifyListeners();
  }

  void selectCo()
  {
    selectIndex;
    notifyListeners();
  }

  Future<SearchModal?> fromMap(String img)
  async {
    final data = await helper.fetchApiData(img);
    searchModal = SearchModal.fromJson(data);
    return searchModal;
  }

  Future<void> setWallpaper(String url) async {
    String result;
    bool goToHome = false;

    try {
      result = await AsyncWallpaper.setWallpaper(
        url: url,
        wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
        goToHome: goToHome,
        toastDetails: ToastDetails.success(),
        errorToastDetails: ToastDetails.error(),
      )
          ? 'Wallpaper set'
          : 'Failed to set wallpaper.';
    }on PlatformException
    {
      result = 'Failed to set wallpaper.';
    }
  }
}