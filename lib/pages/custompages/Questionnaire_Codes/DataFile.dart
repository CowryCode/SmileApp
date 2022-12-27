import 'package:SmileApp/pages/custompages/Questionnaire_Codes/MoodQModel.dart';
import 'package:flutter/cupertino.dart';


class DataFile{


  static List<MoodQModel> getMoodModel(BuildContext context) {
    List<MoodQModel> moodList = [];

    MoodQModel mainModel = new MoodQModel();
    mainModel.id = 1;
    mainModel.name = "Using the buttons below, rate how you feel now.";
  //  mainModel.image = "intr_1.jpg";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Worthless";
    mainModel.end = "Valuable";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 2;
    mainModel.name = "Using the buttons below, rate how you feel now.";
   // mainModel.image = "intr_1.jpg";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Pessimistic";
    mainModel.end = "Optimistic";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 3;
    mainModel.name = "Using the buttons below, rate how you feel now.";
   // mainModel.image = "intr_1.jpg";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Apathetic";
    mainModel.end = "Motivated";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 4;
    mainModel.name = "Using the buttons below, rate how you feel now.";
   // mainModel.image = "intr_1.jpg";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Guilty";
    mainModel.end = "Proud";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 5;
    mainModel.name = "Using the buttons below, rate how you feel now.";
   // mainModel.image = "intr_1.jpg";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Numb";
    mainModel.end = "Interested";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 6;
    mainModel.name = "Using the buttons below, rate how you feel now.";
   // mainModel.image = "intr_1.jpg";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Withdrawn";
    mainModel.end = "Welcoming";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 7;
    mainModel.name = "Using the buttons below, rate how you feel now.";
  //  mainModel.image = "intr_1.jpg";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Hopeless";
    mainModel.end = "Hopeful";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 8;
    mainModel.name = "Using the buttons below, rate how you feel now.";
  //  mainModel.image = "intr_1.jpg";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Tense";
    mainModel.end = "Relaxed";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 9;
    mainModel.name = "Using the buttons below, rate how you feel now.";
   // mainModel.image = "intr_1.jpg";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Worried";
    mainModel.end = "Untroubled";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 10;
    mainModel.name = "Using the buttons below, rate how you feel now.";
  //  mainModel.image = "intr_1.jpg";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Fearful";
    mainModel.end = "Fearless";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 11;
    mainModel.name = "Using the buttons below, rate how you feel now.";
   // mainModel.image = "intr_1.jpg";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Anxious";
    mainModel.end = "Peaceful";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 12;
    mainModel.name = "Using the buttons below, rate how you feel now.";
   // mainModel.image = "intr_1.jpg";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Restless";
    mainModel.end = "Calm";
    moodList.add(mainModel);

    return moodList;
  }



}