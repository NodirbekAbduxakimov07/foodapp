import 'package:deliciousfood/widgets/BigText.dart';
import 'package:deliciousfood/widgets/SmallText.dart';
import 'package:deliciousfood/widgets/icon_and_text_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);
  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}
class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;

  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
       _currentPageValue = pageController.page!;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context,position){
              return _buildPageItem(position);
            },
          ),
        ),
    DotsIndicator(
    dotsCount: 5,
    position: _currentPageValue,
    decorator: DotsDecorator(
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    ),
        Container(
          margin: EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              BigText(text: "Popular"),
              SizedBox(width: 10.0,),
              SmallText(text: "pairing")
            ],
          ),
        ),
        Container(
          height: 1200,
          child: ListView.builder(
           physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index){
              return Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5.0),
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: AssetImage("assest/images/font.jpg"),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 5.0
                        ),
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15.0),bottomRight: Radius.circular(15.0)
                          )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(text: "Uzbek very deleciues foods"),
                            SizedBox(height: 10.0,),
                            SmallText(text: "dfdkfndkhfjdhfjdfdddfdd"),
                            SizedBox(height: 10.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconAndTextWidet(
                                    iconData: Icons.circle,
                                    text: "Normal",
                                    colorIcon: Colors.orangeAccent),
                                IconAndTextWidet(
                                    iconData: Icons.location_on_outlined,
                                    text: "1.7 km",
                                    colorIcon: Colors.tealAccent),
                                IconAndTextWidet(
                                    iconData: Icons.watch_later_outlined,
                                    text: "32 min",
                                    colorIcon: Colors.deepOrangeAccent),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix4 = Matrix4.identity();
    if(index == _currentPageValue.floor()){
      var currScale = 1 - (_currentPageValue - index)*(1 - _scaleFactor);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
    } else if(index == _currentPageValue.floor() + 1){
      var currScale = _scaleFactor + (_currentPageValue-index+1)*(1-_scaleFactor);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
    }
    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
        Container(
        height: 250,
        margin: EdgeInsets.only(right: 5,left: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
                image: AssetImage("assest/images/font.jpg"),
                fit: BoxFit.cover
            )
        ),
      ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: EdgeInsets.only(right: 25,left: 25,bottom: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow:[ BoxShadow(color: Color(0xFFe8e8e8),blurRadius: 5,offset: Offset(0,5))]
              ),
              child: Container(
                margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Uzbek Food"),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Wrap(children: List.generate(5, (index) => Icon(Icons.star,color: Colors.tealAccent,size: 18,)),),
                      //  Icon(Icons.star,color: Colors.tealAccent),
                        SizedBox(width: 10,),
                        SmallText(text: "4.5"),
                        SizedBox(width: 10,),
                        SmallText(text: "114715"),
                        SizedBox(width: 5,),
                        SmallText(text: "coments")
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidet(
                            iconData: Icons.circle,
                            text: "Normal",
                            colorIcon: Colors.orangeAccent),
                        IconAndTextWidet(
                            iconData: Icons.location_on_outlined,
                            text: "1.7 km",
                            colorIcon: Colors.tealAccent),
                        IconAndTextWidet(
                            iconData: Icons.watch_later_outlined,
                            text: "32 min",
                            colorIcon: Colors.deepOrangeAccent),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
