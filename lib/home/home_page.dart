import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beaudio/Promotions/promotion_page.dart';
import 'package:flutter_beaudio/order/orderDialog.dart';
import 'package:flutter_beaudio/utils/appColors.dart';
import 'package:flutter_beaudio/utils/appSize.dart';
import 'package:flutter_beaudio/utils/appTextStyle.dart';
import 'package:flutter_beaudio/utils/appTexts.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final pageViewController = PageController(); //Controle de paginas

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Wrap(
            children: [
              Text(
                AppTexts.nameEmp,
                style: AppTextStyle.appBarPrimaryText,
              ),
              Text(
                AppTexts.nameCity,
                style: AppTextStyle.appBarSecondaryText,
              ),
              Icon(Icons.arrow_drop_down_circle_outlined),
            ],
          ),
        ),
      ),
      body: PageView(
        //possibilita arrastar para trocar de pagina
        controller: pageViewController, //Controla as paginas
        children: [
          Container(
            height: double.infinity,
            child: Padding(
              padding: AppSize.defaultMarginTheme,
              child: Card(
                color: AppColors.backgroundCard,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: ListView(
                  padding: AppSize.marginListView,
                  children: [
                    Column(
                      //TUTULO MOSTRANDO O QUE ESTÁ OUVINDO
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          AppTexts.hearingThis,
                          style: AppTextStyle.styleTextHomePage,
                        ),
                        Padding(
                          padding: AppSize.marginSubText ,
                          child: Container(
                            width: 210,
                            padding: AppSize.paddingContentheadText,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: AppColors.purpleColor,
                            ),
                            child: Text(
                              AppTexts.openMic,
                              textAlign: TextAlign.center,
                              style: AppTextStyle.styleTextHomeHead,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: AppSize.paddingCardHeader,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Column(
                              //MUSICA QUE ESTÁ TOCANDO AGORA (ALÔ AMBEV)
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 130,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: AppSize.paddingImageMusic,
                                        child: Image.asset(
                                          'assets/images/Programacao_Ze_Neto.jpg',
                                          width: 90,
                                          height: 90,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 130,
                                  child: Padding(
                                    padding: AppSize.paddingCardHeader,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Wrap(
                                          children: [
                                            Icon(
                                              Icons.headset,
                                              color: AppColors.purpleColor,
                                            ),
                                            Text(
                                              AppTexts.playingNow,
                                              style: AppTextStyle.styleTexCardtcontent,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: AppSize.paddingDescMusic,
                                          child: Text(
                                            AppTexts.musicName,
                                            style: AppTextStyle.styleTextNameMusic,
                                          ),
                                        ),
                                        Text(
                                          AppTexts.artistName,
                                          style: AppTextStyle.styleTextNameArtist,
                                        ),
                                        Padding(
                                          padding: AppSize.paddingDescMusic,
                                          child: Text(
                                            AppTexts.timeMusic,
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
                    ),
                    Padding(
                      padding: AppSize.alignmentShare,
                      child: Column(
                        //ICONES COMPATILHAR E BOTÕES
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Wrap(
                            children: [
                              Text(AppTexts.shareText),
                              Icon(
                                Icons.share,
                                color: AppColors.shadowColor,
                              ),
                            ],
                          ), //FALTA ICON
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: AppSize.marginListView,
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.gradientPriColor,
                                  AppColors.gradientSecColor
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                              ),
                            ),
                            child: GestureDetector(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: AppSize.paddingContentCar,
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: AppSize.alignTextContent,
                                          child: Container(
                                            height: 50,
                                            width: 100,
                                            child: Text(
                                              AppTexts.requestMusic,
                                              style: AppTextStyle.styleTextOrderMusic,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 180,
                                          child: Text(
                                            AppTexts.participation,
                                            style: AppTextStyle.styleTextparticipation,
                                          ),
                                        ),
                                       /* Container(    COLOCAR IMAGEM DA FORMA CORRETA
                                          color: Colors.red,
                                          height: 50,
                                          width: 50,
                                          child: Image.asset(
                                              'assets/images/homem_pedido_musical.png'),
                                          alignment: Alignment(1, 1),
                                        ),*/
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                OrderDialog().orderDialog(context);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: AppSize.marginBottomInf,
                      child: Column(
                        //ICONES REDES SOCIAIS
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Wrap(
                            children: [
                              Text(
                                AppTexts.follow,
                                style: AppTextStyle.styleTextBottomPri,
                              ),
                              Text(
                                AppTexts.nameEmpSec,
                                style: AppTextStyle.styleTextBottomSec,
                              ),
                              Container(
                                child: Icon(
                                  Icons.close,
                                  color: AppColors.shadowColor,
                                ),
                              ),
                              Container(
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: AppColors.shadowColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.defaultGradientPri,
                  AppColors.defaultGradientSec
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          PromotionPage(),
          Container(), //TIRAR
          Container(), //TIRAR
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: pageViewController,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              currentIndex: pageViewController?.page?.round() ?? 0,
              //Se o Controle não achar nada, retorna pro index 0
              onTap: (index) {
                pageViewController.jumpToPage(index);
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColors.bottomBar,
              iconSize: 30,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.play_arrow),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.card_giftcard),
                  label: 'Promotions',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.close),
                  label: 'Document',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            );
          }),
    );
  }
}
