import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

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
                    height: h * 0.28,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(28),
                        bottomLeft: Radius.circular(28),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(recipesProviderTrue.recipesModal!
                            .recipes[recipesProviderTrue.selectIndex].image),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.018,
                  ),
                  Center(
                      child: Text(
                    recipesProviderTrue.recipesModal!
                        .recipes[recipesProviderTrue.selectIndex].name,
                    style: TextStyle(
                        fontSize: w * 0.06, fontWeight: FontWeight.w500),
                  )),
                  SizedBox(
                    height: h * 0.018,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Colors.deepOrange,
                        size: w * 0.05,
                      ),
                      SizedBox(
                        width: w * 0.014,
                      ),
                      Text(
                        '${recipesProviderTrue.recipesModal!.recipes[recipesProviderTrue.selectIndex].cookTimeMinutes} min',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: w * 0.04),
                      ),
                      SizedBox(
                        width: w * 0.02,
                      ),
                      Icon(
                        Icons.local_fire_department_outlined,
                        color: Colors.deepOrange,
                        size: w * 0.05,
                      ),
                      SizedBox(
                        width: w * 0.014,
                      ),
                      Text(
                        'Cal ${recipesProviderTrue.recipesModal!.recipes[recipesProviderTrue.selectIndex].caloriesPerServing}',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: w * 0.04),
                      ),
                      SizedBox(
                        width: w * 0.02,
                      ),
                      Icon(
                        Icons.task_alt,
                        color: Colors.deepOrange,
                        size: w * 0.05,
                      ),
                      SizedBox(
                        width: w * 0.014,
                      ),
                      Text(
                        recipesProviderTrue
                            .recipesModal!
                            .recipes[recipesProviderTrue.selectIndex]
                            .difficulty,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: w * 0.04),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.018,
                  ),
                  Center(
                    child: Container(
                      height: h * 0.046,
                      width: w * 0.32,
                      decoration: BoxDecoration(
                        color: Color(0xffF1F1F1),
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: w * 0.02,
                          ),
                          Icon(
                            Icons.supervisor_account,
                            size: w * 0.06,
                          ),
                          Container(
                            height: h * 0.046,
                            width: w * 0.24,
                            decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(23)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    recipesProviderTrue.member('decremnet');
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    size: w * 0.054,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  height: h * 0.042,
                                  width: w * 0.066,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    recipesProviderTrue.memberNum.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: w * 0.046),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    recipesProviderTrue.member('increment');
                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: w * 0.054,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Ingredients',
                          style: TextStyle(
                              fontSize: w * 0.053, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Missing ingredients?',
                          style: TextStyle(
                              fontSize: w * 0.044,
                              fontWeight: FontWeight.w400,
                              color: Colors.deepOrange),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(
                        recipesProviderTrue
                            .recipesModal!
                            .recipes[recipesProviderTrue.selectIndex]
                            .ingredients
                            .length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: h * 0.045,
                                width: w * 0.035,
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                '   ${recipesProviderTrue.recipesModal!.recipes[recipesProviderTrue.selectIndex].ingredients[index]}',
                                style: TextStyle(
                                    fontSize: w * 0.044,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Text(
                      'Instructions',
                      style: TextStyle(
                          fontSize: w * 0.053, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(
                        recipesProviderTrue
                            .recipesModal!
                            .recipes[recipesProviderTrue.selectIndex]
                            .instructions
                            .length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: h * 0.045,
                                width: w * 0.035,
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(
                                width: 350,
                                child: Text(
                                  '   ${recipesProviderTrue.recipesModal!.recipes[recipesProviderTrue.selectIndex].instructions[index]}',
                                 maxLines: 1,overflow: TextOverflow.clip, style: TextStyle(
                                      fontSize: w * 0.044,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
