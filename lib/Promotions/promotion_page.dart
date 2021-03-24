import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beaudio/utils/appColors.dart';
import 'package:flutter_beaudio/utils/appSize.dart';
import 'package:flutter_beaudio/utils/appTextStyle.dart';
import 'package:flutter_beaudio/utils/appTexts.dart';

class PromotionPage extends StatefulWidget {
  PromotionPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  PromotionPageState createState() => PromotionPageState();
}

class PromotionPageState extends State<PromotionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Padding(
          padding: AppSize.defaultMarginTheme,
          child: Card(
            color: AppColors.backgroundCard,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListView(
              children: [
                Padding(
                  padding: AppSize.defaultCard,
                  child: Container(
                    width: 210,
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColors.purpleColor,
                    ),
                    child: Text(
                      AppTexts.promotions,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.styleTextPromoHead,
                    ),
                  ),
                ),
                getTitleList(6),
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.defaultGradientPri, AppColors.defaultGradientSec],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}

Column getTitleList(numberOfTiles) {
  List<Widget> titleList = List();
  int index = 0;

  for (int i = 0; i < (numberOfTiles / 2); i++) {
    List<Widget> imageList = List();

    imageList.add(
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'assets/images/promotions/Image_${++index}.jpg',
          height: 140,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
    imageList.add(
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'assets/images/promotions/Image_${++index}.jpg',
          height: 140,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
    titleList.add(Padding(
      padding: AppSize.defaultImagesPromotion,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: imageList,
      ),
    ));
  }

  return Column(
    children: titleList,
  );
}
