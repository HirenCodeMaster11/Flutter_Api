import 'package:api/Beauty%20Product%20app/Screens/Detail%20Screen/Componant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/provider.dart';

class BeautyDetailScreen extends StatelessWidget {
  const BeautyDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    BeautyProvider beautyProviderTrue = Provider.of(context, listen: true);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: h * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffDEDFE1),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(beautyProviderTrue.beautyModal!
                        .product[beautyProviderTrue.selectedIndex].images[0]),
                  ),
                ),
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 14.0, right: 14, top: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          CupertinoIcons.left_chevron,
                          size: w * 0.07,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.favorite_border,
                        size: w * 0.07,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14.0, right: 14, top: 12),
                child: Row(
                  children: [
                    Container(
                      height: h * 0.1,
                      width: w * 0.752,
                      child: Text(
                        beautyProviderTrue.beautyModal!
                            .product[beautyProviderTrue.selectedIndex].title,
                        style: TextStyle(
                            fontSize: w * 0.072, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      height: h * 0.05,
                      width: w * 0.179,
                      alignment: Alignment.centerRight,
                      child: Text(
                        '⭐ ${beautyProviderTrue.beautyModal!.product[beautyProviderTrue.selectedIndex].rating}',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: w * 0.048),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.018,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Text(
                  '\$ ${beautyProviderTrue.beautyModal!.product[beautyProviderTrue.selectedIndex].price}',
                  style: TextStyle(
                      fontSize: w * 0.06, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: h * 0.012,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14.0, right: 14),
                child: Text(
                  beautyProviderTrue.beautyModal!
                      .product[beautyProviderTrue.selectedIndex].description,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: w * 0.044,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: h * 0.018,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Text(
                  'Rating & reviews',
                  style: TextStyle(
                      fontSize: w * 0.056, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              ...List.generate(
                beautyProviderTrue.beautyModal!
                    .product[beautyProviderTrue.selectedIndex].reviews.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14.0, right: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reviewer Num ${index+1}',
                            style: TextStyle(
                                fontSize: w * 0.052,color: Colors.grey.shade700, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'name : ${beautyProviderTrue.beautyModal!.product[beautyProviderTrue.selectedIndex].reviews[index].reviewerName}',
                            style: TextStyle(
                                fontSize: w * 0.052,color: Colors.grey.shade700, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'rating : ${beautyProviderTrue.beautyModal!.product[beautyProviderTrue.selectedIndex].reviews[index].rating}',
                            style: TextStyle(
                                fontSize: w * 0.052,color: Colors.grey.shade700, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'comment : ${beautyProviderTrue.beautyModal!.product[beautyProviderTrue.selectedIndex].reviews[index].comment}',
                            style: TextStyle(
                                fontSize: w * 0.052,color: Colors.grey.shade700, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'date : ${beautyProviderTrue.beautyModal!.product[beautyProviderTrue.selectedIndex].reviews[index].date}',
                            style: TextStyle(
                                fontSize: w * 0.052,color: Colors.grey.shade700, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'email : ${beautyProviderTrue.beautyModal!.product[beautyProviderTrue.selectedIndex].reviews[index].reviewerEmail}',
                            style: TextStyle(
                                fontSize: w * 0.052,color: Colors.grey.shade700, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                beautyProviderTrue.cartAdd();
                Navigator.of(context).pushNamed('cart');
              },
              child: Container(
                height: h*0.058,
                width: w*0.43,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Color(0xff047857),width: 2),
                ),
                alignment: Alignment.center,
                child: Text('Add To Cart',style: TextStyle(color: Color(0xff047857),fontSize: w*0.048,fontWeight: FontWeight.w500),),
              ),
            ),
            Container(
              height: h*0.058,
              width: w*0.43,
              decoration: BoxDecoration(
                color: Color(0xff047857),
                borderRadius: BorderRadius.circular(30),
              ),
              alignment: Alignment.center,
              child: Text('Buy Now',style: TextStyle(color: Colors.white,fontSize: w*0.048,fontWeight: FontWeight.w500),),
            ),
          ],
        ),
      ),
    );
  }
}
