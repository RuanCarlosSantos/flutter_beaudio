import 'package:flutter/material.dart';
import 'package:flutter_beaudio/utils/appColors.dart';
import 'package:flutter_beaudio/utils/appSize.dart';
import 'package:flutter_beaudio/utils/appTextStyle.dart';
import 'package:flutter_beaudio/utils/appTexts.dart';

class OrderDialog {
  final shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  );

  final _formKey = GlobalKey<FormState>();

  Future<void> orderDialog(context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Padding(
            padding: AppSize.defaultMarginTheme, //Margem do corpo
            child: Card(
              color: AppColors.backgroundCard,
              shape: shape,
              child: ListView(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: AppSize.closeButton,
                          child: Container(
                            child: GestureDetector(
                              child: Icon(
                                Icons.close_rounded,
                                color: AppColors.iconClose,
                                size: 33,
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    //COMEÇA O "PEÇA SUA MUSICA"
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppTexts.requestMusic,
                        style: AppTextStyle.styleTextOrderHead,
                      ),
                    ],
                  ),
                  Padding(
                    padding: AppSize.buttonSize,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            validator: (value) {
                              if (value.isEmpty) return AppTexts.buttonIfEmpty;
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: AppColors.iconSearch,
                              ),
                              hintMaxLines: 1,
                              hintText: AppTexts.searchMusic,
                              hintStyle: AppTextStyle.styleTextSearchMusic,
                            ),
                            cursorColor: AppColors.cursorColor,
                          ),
                          Padding(
                            padding: AppSize.centrButton,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: AppColors.buttonDialog,
                                padding: AppSize.marginSizeButton,
                                shape: shape,
                              ),
                              child: Text(
                                AppTexts.sendMusicButton,
                                style: AppTextStyle.styleTextMusic,
                              ),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  //VALIDADOR E CAMPO
                                  DialogSubmit().dialogSubmit(context);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    //COMEÇA O "MANDE UMA MENSAGEM"
                    padding: AppSize.submitMsg,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          AppTexts.sendMessage,
                          style: AppTextStyle.styleTextMusic,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    // TEXT AREA
                    padding: AppSize.buttonSize,
                    child: Container(
                      height: 150,
                      width: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.shadowColor,
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: AppSize.areaTextMargin,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: AppSize.areaTextMargin,
                              child: TextField(
                                maxLines: 5,
                                decoration: InputDecoration.collapsed(
                                  hintText: null,
                                ),
                                cursorColor: AppColors.cursorColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    // COMEÇA "ENVIAR MENSAGEM"
                    padding: AppSize.buttonSubmitMsg,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.buttonDialog,
                        padding: AppSize.marginSizeButton,
                        shape: shape,
                      ),
                      child: Text(
                        AppTexts.sendButtonMsg,
                        style: AppTextStyle.styleTextMusic,
                      ),
                      onPressed: () {
                        DialogSubmit().dialogSubmit(context);
                      },
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
        );
      },
    );
  }
}

// BOTÕES DE ENVIAR
class DialogSubmit {
  Future<void> dialogSubmit(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(
              AppTexts.buttonIfNotEmpty,
              style: AppTextStyle.styleTextBtNotEmpty,
            ),
          ),
          content: Container(
            child: Text(
              AppTexts.favProgramation,
              style: AppTextStyle.styleTextFavProg,
            ),
          ),
          actions: <Widget>[
            GestureDetector(
              child: Padding(
                padding: AppSize.buttonDialogCentralization,
                child: Container(
                  height: 50,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.defaultGradientPri,
                        AppColors.defaultGradientSec
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check,
                      color: AppColors.buttonTextColor,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
