import 'package:deliciousfood/home/food_page_body.dart';
import 'package:deliciousfood/widgets/BigText.dart';
import 'package:flutter/material.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 30,bottom: 15),
              padding: EdgeInsets.only(right: 25,left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Fargona"),
                      Row(
                        children: [
                          Text("Qoqon"),
                          Icon(Icons.arrow_drop_down_outlined)
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.teal
                    ),
                    child: Icon(Icons.search,color: Colors.white,),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: FoodPageBody()
              )
          )
        ],
      ),
    );
  }
}
