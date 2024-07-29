import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Modal/modal.dart';
import '../../Provider/provider.dart';
import 'Componant/category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RecipesProvider recipesProviderTrue =
        Provider.of<RecipesProvider>(context, listen: true);
    RecipesProvider recipesProviderFalse =
        Provider.of<RecipesProvider>(context, listen: false);

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: (recipesProviderTrue.recipesModal == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: h * 0.18,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border(
                          bottom:
                              BorderSide(color: Colors.deepOrange, width: 6)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        opacity: 0.5,
                        image: AssetImage('assets/images/banner.jpeg'),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 18.0, right: 18, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Hello,',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: w * 0.045,
                                    fontWeight: FontWeight.w400),
                              ),
                              Spacer(),
                              Icon(
                                CupertinoIcons.bell,
                                color: Colors.white,
                                size: 0.045,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Not sure what to',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: w * 0.066),
                              ),
                              Text(
                                ' cook',
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.w400,
                                    fontSize: w * 0.066),
                              ),
                            ],
                          ),
                          Text(
                            'tonight !!',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: w * 0.066),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25.0, right: 25, top: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              fillColor: Color(0xfff6f6f6),
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: w * 0.018,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: w * 0.07,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0, right: 14),
                    child: Row(
                      children: [
                        Text(
                          'Catagories',
                          style: TextStyle(
                              fontSize: w * 0.056, fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Text(
                          'See all',
                          style: TextStyle(
                              fontSize: w * 0.046,
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0, right: 14),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                            catagory.length,
                            (index) => Catagory(
                                h: h,
                                w: w,
                                img: catagory[index]['img'],
                                name: catagory[index]['name']),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0, right: 14),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                            10,
                            (index) => GestureDetector(
                              onTap: () {
                                recipesProviderTrue.selectIndex = index;
                                Navigator.of(context).pushNamed('detail');
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: w * 0.03),
                                height: h * 0.2,
                                width: w * 0.38,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(40),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    opacity: 0.66,
                                    image: NetworkImage(recipesProviderTrue
                                        .recipesModal!.recipes[index].image),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 14.0),
                                      child: Text(
                                        recipesProviderTrue
                                            .recipesModal!.recipes[index].name,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: w * 0.044),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 14.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.schedule,
                                            color: Colors.white,
                                            weight: 400,
                                            size: w * 0.044,
                                          ),
                                          SizedBox(
                                            width: w * 0.014,
                                          ),
                                          Text(
                                            '${recipesProviderTrue.recipesModal!.recipes[index].cookTimeMinutes} min',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: w * 0.044,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: h * 0.006,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Text(
                      'Cook again',
                      style: TextStyle(
                          fontSize: w * 0.056, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 14.0, right: 14, bottom: 12),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(
                            15,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: GestureDetector(
                                onTap: () {
                                  recipesProviderTrue.selectIndex = index+15;
                                  Navigator.of(context).pushNamed('detail');
                                },
                                child: Container(
                                  height: h * 0.18,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      opacity: 0.66,
                                      fit: BoxFit.cover,
                                      image: NetworkImage(recipesProviderTrue
                                          .recipesModal!
                                          .recipes[index + 15]
                                          .image),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, top: 8),
                                    child: Text(
                                      recipesProviderTrue.recipesModal!
                                          .recipes[index + 15].name,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: w * 0.045),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: Colors.black,
        selectedLabelStyle: TextStyle(
          color: Colors.deepOrange,
        ),
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              CupertinoIcons.home,
              color: Colors.deepOrange,
              size: w * 0.06,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.soup_kitchen,
              color: Colors.grey,
              size: w * 0.06,
            ),
            label: 'Kitchen',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shop,
              color: Colors.grey,
              size: w * 0.06,
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
              color: Colors.grey,
              size: w * 0.06,
            ),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.grey,
              size: w * 0.06,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}