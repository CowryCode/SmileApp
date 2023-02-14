import 'package:SmileApp/pages/custompages/Questionnaire_Codes/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// import 'package:html/parser.dart';

class ConstantWidget {
  static double getPercentSize(double total, double percent) {
    return (total * percent) / 100;
  }

  static Widget getHorizonSpace(double space) {
    return SizedBox(
      width: space,
    );
  }

  static Widget getRoundCornerButtonWithoutIcon(String texts, Color color,
      Color textColor, double btnRadius, Function function) {
    return InkWell(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.circular(btnRadius),
              shape: BoxShape.rectangle,
              color: color,
// border: BorderSide(color: borderColor, width: 1)
            ),

// shape: RoundedRectangleBorder(
//     borderRadius: new BorderRadius.circular(btnRadius),
//     side: BorderSide(color: borderColor, width: 1)),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),

            child: Center(
              child: getCustomText(
                  texts, textColor, 1, TextAlign.center, FontWeight.w500, 18),
            ),
          )
        ],
      ),
      onTap: () {
        function();
      },
    );
  }

  static Widget getButtonWidget1(
      BuildContext context, String s, var color, Function function) {
    double height = ConstantWidget.getScreenPercentSize(context, 8.5);
    double radius = ConstantWidget.getPercentSize(height, 20);
    double fontSize = ConstantWidget.getPercentSize(height, 30);

    return InkWell(
      child: Container(
        height: height,
        margin: EdgeInsets.symmetric(
            vertical: ConstantWidget.getScreenPercentSize(context, 1.2)),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
        child: Center(
            child: getDefaultTextWidget(
                s, TextAlign.center, FontWeight.w500, fontSize, Colors.black)),
      ),
      onTap: () {
        function();
      },
    );
  }


  static double largeTextSize = 28;

  static double getMarginTop(BuildContext context) {
    // double height = getScreenPercentSize(context, 20);
    double height = getScreenPercentSize(context, 23);

    return (height / 2) + getScreenPercentSize(context, 2.5);
  }

  static double getBlankTop(BuildContext context) {
    double height = getScreenPercentSize(context, 20);

    return getPercentSize(height, 85);
  }


  static Widget getCustomTextWithoutAlign(
      String text, Color color, FontWeight fontWeight, double fontSize) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: Constants.fontsFamily,
          decoration: TextDecoration.none,
          fontWeight: fontWeight),
    );
  }

  static double getScreenPercentSize(BuildContext context, double percent) {
    return (MediaQuery.of(context).size.height * percent) / 100;
  }

  static double getWidthPercentSize(BuildContext context, double percent) {
    return (MediaQuery.of(context).size.width * percent) / 100;
  }

  static Widget getSpace(double space) {
    return SizedBox(
      height: space,
    );
  }




  static Widget getTextWidgetWithFontWithMaxLine1(
      String text,
      Color color,
      TextAlign textAlign,
      FontWeight fontWeight,
      double textSizes,
      String font) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: textSizes,
          color: color,
          fontFamily: font,

          letterSpacing: 1,
          fontWeight: fontWeight),
      textAlign: textAlign,
    );
  }



  static Widget getCustomText(String text, Color color, int maxLine,
      TextAlign textAlign, FontWeight fontWeight, double textSizes) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: textSizes,
          color: color,
          fontFamily: Constants.fontsFamily,
          fontWeight: fontWeight),
      maxLines: maxLine,
      textAlign: textAlign,
    );
  }

  static Widget getCustomTextFont(
      String text,
      Color color,
      int maxLine,
      TextAlign textAlign,
      FontWeight fontWeight,
      double textSizes,
      String font) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: textSizes,
          color: color,
          fontFamily: font,
          height: 1.1,
          fontWeight: fontWeight),
      maxLines: maxLine,
      textAlign: textAlign,
    );
  }

  static Widget getTextWidgetWithSpacing(String text, Color color,
      TextAlign textAlign, FontWeight fontWeight, double textSizes) {
    return Text(
      text,
      style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: textSizes,
          color: color,
          height: 1.5,
          fontFamily: Constants.fontsFamily,
          fontWeight: fontWeight),
      textAlign: textAlign,
    );
  }

  static Widget getTextWidget(String text, Color color, TextAlign textAlign,
      FontWeight fontWeight, double textSizes) {
    return Text(
      text,
      style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: textSizes,
          color: color,
          fontFamily: Constants.fontsFamily,
          fontWeight: fontWeight),
      textAlign: textAlign,
    );
  }

  static Widget getTextWidgetWithFont(
      String text,
      Color color,
      TextAlign textAlign,
      FontWeight fontWeight,
      double textSizes,
      String font) {
    return Text(
      text,

      style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: textSizes,
          color: color,
          fontFamily: font,
          letterSpacing: 1,
          fontWeight: fontWeight),
      textAlign: textAlign,
    );
  }


  static Widget getTextWidgetWithFontWithMaxLine(
      String text,
      Color color,

      TextAlign textAlign,
      FontWeight fontWeight,
      double textSizes,
      String font,int maxLine) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine,
      style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: textSizes,
          color: color,
          fontFamily: font,
          letterSpacing: 1,
          fontWeight: fontWeight),
      textAlign: textAlign,
    );
  }


  static Widget getDefaultTextWidget(String s, TextAlign textAlign,
      FontWeight fontWeight, double fontSize, var color) {
    return Text(
      s,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: Constants.fontsFamily,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color
      ),
    );
  }


}








TextStyle homeWhiteRegularTextStyle = TextStyle(
  fontFamily: Constants.fontsFamily,
  fontSize: 17,
  color: Colors.white,
);