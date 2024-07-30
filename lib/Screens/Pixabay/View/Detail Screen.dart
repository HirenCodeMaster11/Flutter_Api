import 'package:api/Screens/Pixabay/Modal/pixabayModal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Provider.dart';

class PixaDetailScreen extends StatelessWidget {
  SearchModal? hits;
  PixaDetailScreen({super.key, required this.hits});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProviderTrue =Provider.of<HomeProvider>(context,listen: true);
    HomeProvider homeProvider =Provider.of<HomeProvider>(context,listen: false);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(hits!.hits[homeProviderTrue.selectIndex].webformatURL),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 14.0,right: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: ()  async {
                homeProvider.setWallpaper(hits!.hits[homeProviderTrue.selectIndex].webformatURL);
                },
              child: Container(
                height: 40,
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15)
                ),
                alignment: Alignment.center,
                child: Text('Set Wallpaper',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 23),),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 40,
                width: 160,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)
                ),
                alignment: Alignment.center,
                child: Text('cancel',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 23),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
