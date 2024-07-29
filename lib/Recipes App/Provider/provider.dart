import 'dart:convert';

import 'package:flutter/material.dart';

import '../Api Helper/Api Helper.dart';
import '../Modal/modal.dart';

class RecipesProvider extends ChangeNotifier
{
  RecipesProvider()
  {
    fromMap();
  }
  RecipesModal? recipesModal;
  int selectIndex = 0;
  int memberNum = 1;

  void selectedCo()
  {
    selectIndex;
    notifyListeners();
  }

  void member(String op)
  {
    if(op=='increment')
      {
        memberNum++;
      }else{
      memberNum--;
    }
    notifyListeners();
    print(memberNum);
  }
  Future<void> fromMap()
  async {
    ApiHelper apiHelper =ApiHelper();

    String? data = await apiHelper.fetchApiData();
    Map json = jsonDecode(data!);
    recipesModal = RecipesModal.fromJson(json);
    notifyListeners();
  }
}