import 'package:deliciousfood/widgets/SmallText.dart';
import 'package:flutter/material.dart';

class IconAndTextWidet extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color colorIcon;
  const IconAndTextWidet({Key? key,
    required this.iconData,
    required this.text,
    required this.colorIcon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData,color: colorIcon,),
        SizedBox(width: 5,),
        SmallText(text: text)
      ],
    );
  }
}
