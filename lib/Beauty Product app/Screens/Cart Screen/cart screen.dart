import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import '../../Provider/provider.dart';

class BeautyCartScreen extends StatelessWidget {
  const BeautyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BeautyProvider beautyProviderTrue = Provider.of<BeautyProvider>(context, listen: true);
    BeautyProvider beautyProviderFalse = Provider.of<BeautyProvider>(context, listen: false);

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: beautyProviderTrue.beautyModal == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      CupertinoIcons.left_chevron,
                      size: w * 0.06,
                    ),
                  ),
                  SizedBox(
                    width: w * 0.2,
                  ),
                  Text(
                    'Review Purchase',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: w * 0.056),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 14),
              child: Column(
                children: [
                  ...List.generate(beautyProviderTrue.cart.length, (index) => Row(
                    children: [
                      Container(
                        height: h * 0.1,
                        width: w * 0.2,
                        decoration: BoxDecoration(
                          color: Color(0xffDEDFE1),
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(beautyProviderTrue.cart[index]['images'][0]),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: w * 0.03,
                      ),
                      SizedBox(
                        width: 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              beautyProviderTrue.cart[index]['title'],
                              style: TextStyle(
                                  fontSize: w * 0.052,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '\$ ${beautyProviderTrue.cart[index]['price']}',
                              style: TextStyle(
                                fontSize: w * 0.054,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff047857),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Column(
                        children: [
                          SizedBox(
                            height: h * 0.02,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: h * 0.043,
                              width: w * 0.262,
                              decoration: BoxDecoration(
                                color: Color(0xff047857),
                                borderRadius: BorderRadius.circular(26),
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      beautyProviderTrue.qty('dec',index);
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    beautyProviderTrue.cart[index]['quantity'].toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: w * 0.046),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      beautyProviderTrue.qty('inc',index);
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              beautyProviderFalse.deleteP(index);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.black,
                              size: w * 0.06,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.024,
            ),
            Divider(
              color: Colors.grey,
              height: 2,
            ),
            SizedBox(
              height: h * 0.012,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Text(
                'Have a gift code?',
                style: TextStyle(
                    color: Color(0xff047857),
                    fontSize: w * 0.05,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: h * 0.012,
            ),
            Divider(
              color: Colors.grey,
              height: 2,
            ),
            SizedBox(
              height: h * 0.024,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 14),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: TextStyle(
                            fontSize: w * 0.048,
                            fontWeight: FontWeight.w400,
                            color: Colors.blueGrey),
                      ),
                      Text(
                        '\$ ${beautyProviderTrue.price.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: w * 0.048,
                            fontWeight: FontWeight.w400,
                            color: Colors.blueGrey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.014,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shipping & Handling',
                        style: TextStyle(
                            fontSize: w * 0.048,
                            fontWeight: FontWeight.w400,
                            color: Colors.blueGrey),
                      ),
                      Text(
                        '\$ ${beautyProviderTrue.shippingFee.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: w * 0.048,
                            fontWeight: FontWeight.w400,
                            color: Colors.blueGrey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.014,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount',
                        style: TextStyle(
                            fontSize: w * 0.048,
                            fontWeight: FontWeight.w400,
                            color: Colors.blueGrey),
                      ),
                      Text(
                        '${beautyProviderTrue.discountPercentage} %',
                        style: TextStyle(
                            fontSize: w * 0.048,
                            fontWeight: FontWeight.w400,
                            color: Colors.blueGrey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.014,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                            fontSize: w * 0.05,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Text(
                        '\$ ${beautyProviderTrue.totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: w * 0.05,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 38.0, right: 38, bottom: 8),
        child: Container(
          height: w * 0.12,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xff047857),
              borderRadius: BorderRadius.circular(30)),
          alignment: Alignment.center,
          child: Text(
            'Purchase',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: w * 0.052),
          ),
        ),
      ),
    );
  }
}
