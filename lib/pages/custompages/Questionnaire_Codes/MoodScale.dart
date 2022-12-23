import 'dart:io';

import 'package:SmileApp/pages/custompages/Questionnaire_Codes/ConstantWidget.dart';
import 'package:SmileApp/pages/custompages/Questionnaire_Codes/Constants.dart';
import 'package:SmileApp/pages/custompages/Questionnaire_Codes/DataFile.dart';
import 'package:SmileApp/pages/custompages/Questionnaire_Codes/MoodQModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'SizeConfig.dart';

class MoodScale extends StatefulWidget {
  // final ValueChanged<bool> onChanged;

  // IntroPage(this.onChanged);

  @override
  _MoodScale createState() {
    return _MoodScale();
    // return _IntroPage(this.onChanged);
  }
}

class _MoodScale extends State<MoodScale> {
  int _position = 0;
  int groupValue = 0;
  List<int> moods = [0,0,0,0,0,0,0,0,0,0,0,0];
  String btnTxt = "Next";
  // final ValueChanged<bool> onChanged;

  // _IntroPage(this.onChanged);

  Future<bool> _requestPop() {


    if(Platform.isIOS){
      exit(0);
    }else{
      SystemNavigator.pop();
    }
    return new Future.value(false);
  }

  final controller = PageController();

  List<MoodQModel> moodModelList = [];


  void submit(){
    // PrefData.setIsIntro(false);
   // Navigator.of(context).pop(true);
   // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeWidget(1)));
    Navigator.of(context).pushNamed('/home');
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    moodModelList = DataFile.getMoodModel(context).cast<MoodQModel>();

    double firstSize = ConstantWidget.getScreenPercentSize(context, 55);
    double secondSize = ConstantWidget.getScreenPercentSize(context,45);
    double remainSize =
        ConstantWidget.getScreenPercentSize(context, 100) - firstSize;
    double defMargin = ConstantWidget.getScreenPercentSize(context, 2);
    double nextHeight = Constants.getScreenPercentSize(context, 7.5);
    setState(() {});

    return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [

                Expanded(
                  child: Container(
                    child: PageView.builder(
                      controller: controller,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, position) {
                        return Container(
                          child: Stack(
                            children: [
                              Container(
                                height: firstSize,
                                child: Image.asset(Constants.assetsImagePath+
                                    moodModelList[position].image!,fit: BoxFit.scaleDown,),
                              ),

                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(top: secondSize),
                                padding: EdgeInsets.symmetric(vertical:
                                ConstantWidget.getScreenPercentSize(context, 2),horizontal: (defMargin)),
                                // decoration: BoxDecoration(
                                //     color: accentColor,
                                //     // color: Colors.white,
                                //     borderRadius: BorderRadius.only(
                                //         topRight: Radius.circular(
                                //             ConstantWidget.getPercentSize(
                                //                 secondSize, 17)))),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: (defMargin ),
                                          bottom: defMargin ),
                                      child:
                                      ConstantWidget.getCustomTextFont(
                                          moodModelList[position]
                                              .name!,
                                          Colors.black,
                                          // Colors.black87,
                                          2,
                                          TextAlign.center,
                                          FontWeight.bold,
                                          ConstantWidget.getPercentSize(
                                              remainSize, 5),
                                          meriendaOneFont),
                                    ),

                                    SizedBox(height: 20,),

                                    Row(
                                      children: [
                                        ConstantWidget.getCustomTextFont(
                                          // "introModelList[position].desc!",
                                            moodModelList[position].start!,
                                            Colors.black87,
                                            // Colors.black45,
                                            5,
                                            TextAlign.center,
                                            FontWeight.w700,
                                            ConstantWidget.getScreenPercentSize(context,2),
                                            Constants.fontsFamily),

                                        Spacer(),

                                        ConstantWidget.getCustomTextFont(
                                            moodModelList[position].end!,
                                            Colors.black87,
                                            5,
                                            TextAlign.center,
                                            FontWeight.w700,
                                            ConstantWidget.getScreenPercentSize(context,2),
                                            Constants.fontsFamily),
                                      ],
                                    ),

                                    SizedBox(height: 20,),
                                    myRadio(),
                                    
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: moodModelList.length,
                      onPageChanged: _onPageViewChange,
                    ),
                  ),
                ),

                InkWell(
                  onTap: (){
                    if(groupValue == 0){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please select an option to proceed.')),
                      );
                    }else{
                      onNext();
                    }
                  },
                  child: Container(
                    width:Constants.getWidthPercentSize(context, 40),
                    height:nextHeight,
                    margin: EdgeInsets.only(bottom: defMargin*2),
                    padding: EdgeInsets.symmetric(horizontal:(defMargin/1.3)),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: Offset(0.0, 2), //(x,y)
                            blurRadius: 5,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(Constants.getWidthPercentSize(context, 40)))
                    ),

                    child: Row(
                      children: [
                        SizedBox(width:Constants.getWidthPercentSize(context, 3) ,),
                        Expanded(child: getCustomText(btnTxt,
                            Colors.black87, 1, TextAlign.start, FontWeight.bold, Constants.getPercentSize(nextHeight,
                                30))),


                        Container(
                          height: Constants.getPercentSize(nextHeight, 75),
                          width: Constants.getPercentSize(nextHeight, 75),
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                              shape: BoxShape.circle
                          ),
                          child: Center(
                            child: Icon(Icons.navigate_next,color: Theme.of(context).colorScheme.secondary,size: Constants.getPercentSize(nextHeight, 50),),
                          ),
                        )


                      ],
                    ),
                  ),
                ),
                Container(height: 0.3,margin: EdgeInsets.only(bottom: defMargin),color: Colors.grey.shade300,),
                Row(
                  children: [


                    InkWell(
                      onTap: () {
                        goBack();
                        // skip();
                      },
                      child: Padding(
                        padding: EdgeInsets.all(defMargin),
                        child: ConstantWidget.getCustomText(
                            "Back",
                            Colors.black54,

                            1,
                            TextAlign.start,
                            FontWeight.w600,
                            15),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(right: defMargin),
                          height: ConstantWidget.getScreenPercentSize(context, 5),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: moodModelList.length,
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              double size =
                              ConstantWidget.getPercentSize(
                                  ConstantWidget
                                      .getScreenPercentSize(
                                      context, 5),
                                  25);
                              return Container(
                                height: size,
                                width: size,
                                margin: EdgeInsets.only(
                                    right: (size / 1.2)),
                                decoration: BoxDecoration(
                                  color: (index == _position)
                                      ? Theme.of(context).colorScheme.secondary
                                      : Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                )

              ],
            ),
          ),
        ),
        onWillPop: _requestPop);
  }
  onNext(){
    if (_position <
        (moodModelList.length - 1)) {
      updateRadioVal(_position);
      _position++;
      setRadioVal(_position);
      changeBtnTxtToSubmit();
      controller.jumpToPage(_position);
      setState(() {});
    } else {
      if(btnTxt == "Submit"){
        submit();
      }
    }
  }

  goBack(){
    if (_position <=
        (moodModelList.length - 1) && _position > 0) {
      // print("The position is $_position");
      _position--;
      setRadioVal(_position);
      // print("The position is $_position");
      changeBtnTxtToNext();
      controller.jumpToPage(_position);
      setState(() {});
    }
  }
  void changeBtnTxtToSubmit() {
    if(_position == 11 && moods[_position] > 0){
      btnTxt = "Submit";
    }
  }

  void changeBtnTxtToNext() {
    if(_position < 11){
      btnTxt = "Next";
    }
  }

  changeBtnStatus(int pos){
    if(moods[pos] == 0){

    }
  }

  _onPageViewChange(int page) {
    _position = page;
    setState(() {});
  }

  Row myRadio(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Radio(value: 1, groupValue: groupValue, activeColor: Theme.of(context).colorScheme.secondary, onChanged: _valueChangedHandler(),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Radio(value: 2, groupValue: groupValue, activeColor: Theme.of(context).colorScheme.secondary, onChanged: _valueChangedHandler(),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Radio(value: 3, groupValue: groupValue, activeColor: Theme.of(context).colorScheme.secondary, onChanged: _valueChangedHandler(),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Radio(value: 4, groupValue: groupValue, activeColor: Theme.of(context).colorScheme.secondary, onChanged: _valueChangedHandler(),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Radio(value: 5, groupValue: groupValue, activeColor: Theme.of(context).colorScheme.secondary, onChanged: _valueChangedHandler(),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Radio(value: 6, groupValue: groupValue, activeColor: Theme.of(context).colorScheme.secondary, onChanged: _valueChangedHandler(),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Radio(value: 7, groupValue: groupValue, activeColor: Theme.of(context).colorScheme.secondary, onChanged: _valueChangedHandler(),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ],
    );
  }

  ValueChanged<int?> _valueChangedHandler() {
    return (value) => setState(() {
      groupValue = value!;
      if(_position == 11){
        updateRadioVal(_position);
        btnTxt = "Submit";
      }
    });
  }

  updateRadioVal(int pos){
    moods[pos] = groupValue;
  }

  setRadioVal(int pos){
    groupValue = moods[pos];
  }

  Widget getCustomText(String text, Color color, int maxLine, TextAlign textAlign,
      FontWeight fontWeight, double textSizes) {
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

}
