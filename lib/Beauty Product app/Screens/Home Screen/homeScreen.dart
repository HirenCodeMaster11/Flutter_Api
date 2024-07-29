import 'package:api/Beauty%20Product%20app/Modal/modal.dart';
import 'package:api/Beauty%20Product%20app/Provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

TextEditingController txtSearch = TextEditingController();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BeautyProvider beautyProviderTrue = Provider.of(context, listen: true);
    BeautyProvider beautyProviderFalse = Provider.of(context, listen: false);

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff1f1f1),
        title: Text(
          'Home',
          style: TextStyle(fontSize: w * 0.06, fontWeight: FontWeight.w500),
        ),
        leading: Icon(
          Icons.menu,
          size: w * 0.066,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('cart');
            },
            child: Icon(
              CupertinoIcons.cart,
              size: w * 0.068,
            ),
          ),
          SizedBox(
            width: w * 0.03,
          ),
          Icon(
            CupertinoIcons.profile_circled,
            size: w * 0.068,
          ),
          SizedBox(
            width: w * 0.02,
          ),
        ],
      ),
      backgroundColor: Color(0xfff1f1f1),
      body: (beautyProviderTrue.beautyModal == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 14, top: 14),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: txtSearch,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              size: w * 0.064,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Text(
                      'Good Morning,',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: w * 0.056),
                    ),
                    Text(
                      'How you need today?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: w * 0.062),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            height: h * 0.047,
                            width: w * 0.23,
                            decoration: BoxDecoration(
                              color: Color(0xff047857),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Body',
                              style: TextStyle(
                                  fontSize: w * 0.044,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(width: w*0.09,),
                          Text('Face',style: TextStyle(
                              fontSize: w * 0.044,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),),
                          SizedBox(width: w*0.09,),
                          Text('Digital & Technologies',style: TextStyle(
                              fontSize: w * 0.044,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),),
                          SizedBox(width: w*0.09,),
                          Text('Grocery',style: TextStyle(
                              fontSize: w * 0.044,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),),
                          SizedBox(width: w*0.09,),
                          Text('Food',style: TextStyle(
                              fontSize: w * 0.044,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Container(
                      height: h * 0.22,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blueGrey,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/1.jpeg'),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: h * 0.018,
                            ),
                            Text(
                              'Summer offer',
                              style: TextStyle(
                                fontSize: w * 0.048,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: h * 0.01),
                            Text(
                              'Get up to',
                              style: TextStyle(
                                  fontSize: w * 0.04,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '50% OFF',
                              style: TextStyle(
                                fontSize: w * 0.056,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: h * 0.016),
                            Container(
                              height: h * 0.047,
                              width: w * 0.34,
                              decoration: BoxDecoration(
                                color: Color(0xff047857),
                                borderRadius: BorderRadius.circular(45),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Order now',
                                style: TextStyle(
                                    fontSize: w * 0.042,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.016,
                    ),
                    Text(
                      'Popular Categories',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: w * 0.05),
                    ),
                    SizedBox(
                      height: h * 0.016,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                            10,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 14.0),
                              child: GestureDetector(
                                onTap: () {
                                  beautyProviderTrue.selectedIndex = index;
                                  Navigator.of(context).pushNamed('detail');
                                },
                                child: Container(
                                  height: h * 0.289,
                                  width: w * 0.4,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(9.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: h * 0.18,
                                          width: w * 0.35,
                                          decoration: BoxDecoration(
                                            color: Color(0xffDEDFE1),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  beautyProviderTrue.beautyModal!
                                                      .product[index].images[0]),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.008,
                                        ),
                                        Text(
                                          beautyProviderTrue
                                              .beautyModal!.product[index].brand
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: w * 0.042,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          beautyProviderTrue
                                              .beautyModal!.product[index].title,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: w * 0.036,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.016,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recommended for you',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: w * 0.05),
                        ),
                        Text(
                          'View all',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: w * 0.046),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h * 0.016,
                    ),
                    Column(
                      children: [
                        ...List.generate(
                          15,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 14.0),
                            child: GestureDetector(
                              onTap: () {
                                beautyProviderTrue.selectedIndex = index+10;
                                Navigator.of(context).pushNamed('detail');
                              },
                              child: Container(
                                height: h * 0.12,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: h * 0.09,
                                        width: w * 0.18,
                                        decoration: BoxDecoration(
                                          color: Color(0xffDEDFE1),
                                          borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(
                                            image: NetworkImage(beautyProviderTrue
                                                .beautyModal!
                                                .product[index + 10]
                                                .images[0]),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: w * 0.02,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8, left: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 210,
                                              child: Text(
                                                beautyProviderTrue.beautyModal!.product[index+10].title.toString(),
                                                overflow: TextOverflow.ellipsis,style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: w * 0.046),
                                              ),
                                            ),
                                            Text(
                                              '\$ ${beautyProviderTrue.beautyModal!.product[index+10].price}',
                                              style: TextStyle(
                                                  color:Color(0xff047857),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: w * 0.048),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      IconButton(
                                        onPressed: () {

                                        },
                                        icon: Icon(
                                          CupertinoIcons.cart,
                                          color: Color(0xff047857),
                                          size: w * 0.064,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}