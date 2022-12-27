import 'package:SmileApp/pages/custompages/Questionnaire_Codes/MoodQModel.dart';
import 'package:flutter/cupertino.dart';


class DataFile{


  static List<MoodQModel> getMoodModel(BuildContext context) {
    List<MoodQModel> moodList = [];

    MoodQModel mainModel = new MoodQModel();
    mainModel.id = 1; // Appeared in 11
    mainModel.name = "Lively";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Definitely do not feel";
    mainModel.end = "Definitely feel";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 2;
    mainModel.name = "Happy";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Definitely do not feel";
    mainModel.end = "Definitely feel";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 3;
    mainModel.name = "Sad";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Definitely do not feel";
    mainModel.end = "Definitely feel";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 4;
    mainModel.name = "Tired";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Definitely do not feel";
    mainModel.end = "Definitely feel";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 5;
    mainModel.name = "Caring";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Definitely do not feel";
    mainModel.end = "Definitely feel";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 6;
    mainModel.name = "Content";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Definitely do not feel";
    mainModel.end = "Definitely feel";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 7;
    mainModel.name = "Gloomy (feeling distressed)";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Definitely do not feel";
    mainModel.end = "Definitely feel";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 8; // APPEARED IN 12
    mainModel.name = "Jittery (Nervous)";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Definitely do not feel";
    mainModel.end = "Definitely feel";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 9;
    mainModel.name = "Drowsy (half asleep)";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Definitely do not feel";
    mainModel.end = "Definitely feel";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 10;
    mainModel.name = "Grouchy (irritable)";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Definitely do not feel";
    mainModel.end = "Definitely feel";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 11; // Appeared in 1
    mainModel.name = "Peppy (lively)";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Definitely do not feel";
    mainModel.end = "Definitely feel";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 12; // APPEARED IN 8
    mainModel.name = "Nervous ";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Definitely do not feel";
    mainModel.end = "Definitely feel";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 13;
    mainModel.name = "Calm ";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Definitely do not feel";
    mainModel.end = "Definitely feel";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 14;
    mainModel.name = "Loving ";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Definitely do not feel";
    mainModel.end = "Definitely feel";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 15;
    mainModel.name = "Fed Up ";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Definitely do not feel";
    mainModel.end = "Definitely feel";
    moodList.add(mainModel);

    mainModel = new MoodQModel();
    mainModel.id = 16;
    mainModel.name = "Active ";
    mainModel.image = "logo1.jpeg";
    mainModel.start ="Definitely do not feel";
    mainModel.end = "Definitely feel";
    moodList.add(mainModel);

    // MoodQModel mainModel = new MoodQModel();
    // mainModel.id = 1;
    // mainModel.name = "Using the buttons below, rate how you feel now.";
    // mainModel.image = "logo1.jpeg";
    // mainModel.start ="Worthless";
    // mainModel.end = "Valuable";
    // moodList.add(mainModel);
    //
    // mainModel = new MoodQModel();
    // mainModel.id = 2;
    // mainModel.name = "Using the buttons below, rate how you feel now.";
    // mainModel.image = "logo1.jpeg";
    // mainModel.start ="Pessimistic";
    // mainModel.end = "Optimistic";
    // moodList.add(mainModel);
    //
    // mainModel = new MoodQModel();
    // mainModel.id = 3;
    // mainModel.name = "Using the buttons below, rate how you feel now.";
    // mainModel.image = "logo1.jpeg";
    // mainModel.start ="Apathetic";
    // mainModel.end = "Motivated";
    // moodList.add(mainModel);
    //
    // mainModel = new MoodQModel();
    // mainModel.id = 4;
    // mainModel.name = "Using the buttons below, rate how you feel now.";
    // mainModel.image = "logo1.jpeg";
    // mainModel.start ="Guilty";
    // mainModel.end = "Proud";
    // moodList.add(mainModel);
    //
    // mainModel = new MoodQModel();
    // mainModel.id = 5;
    // mainModel.name = "Using the buttons below, rate how you feel now.";
    // mainModel.image = "logo1.jpeg";
    // mainModel.start ="Numb";
    // mainModel.end = "Interested";
    // moodList.add(mainModel);
    //
    // mainModel = new MoodQModel();
    // mainModel.id = 6;
    // mainModel.name = "Using the buttons below, rate how you feel now.";
    // mainModel.image = "logo1.jpeg";
    // mainModel.start ="Withdrawn";
    // mainModel.end = "Welcoming";
    // moodList.add(mainModel);
    //
    // mainModel = new MoodQModel();
    // mainModel.id = 7;
    // mainModel.name = "Using the buttons below, rate how you feel now.";
    // mainModel.image = "logo1.jpeg";
    // mainModel.start ="Hopeless";
    // mainModel.end = "Hopeful";
    // moodList.add(mainModel);
    //
    // mainModel = new MoodQModel();
    // mainModel.id = 8;
    // mainModel.name = "Using the buttons below, rate how you feel now.";
    // mainModel.image = "logo1.jpeg";
    // mainModel.start ="Tense";
    // mainModel.end = "Relaxed";
    // moodList.add(mainModel);
    //
    // mainModel = new MoodQModel();
    // mainModel.id = 9;
    // mainModel.name = "Using the buttons below, rate how you feel now.";
    // mainModel.image = "logo1.jpeg";
    // mainModel.start ="Worried";
    // mainModel.end = "Untroubled";
    // moodList.add(mainModel);
    //
    // mainModel = new MoodQModel();
    // mainModel.id = 10;
    // mainModel.name = "Using the buttons below, rate how you feel now.";
    // mainModel.image = "logo1.jpeg";
    // mainModel.start ="Fearful";
    // mainModel.end = "Fearless";
    // moodList.add(mainModel);
    //
    // mainModel = new MoodQModel();
    // mainModel.id = 11;
    // mainModel.name = "Using the buttons below, rate how you feel now.";
    // mainModel.image = "logo1.jpeg";
    // mainModel.start ="Anxious";
    // mainModel.end = "Peaceful";
    // moodList.add(mainModel);
    //
    // mainModel = new MoodQModel();
    // mainModel.id = 12;
    // mainModel.name = "Using the buttons below, rate how you feel now.";
    // mainModel.image = "logo1.jpeg";
    // mainModel.start ="Restless";
    // mainModel.end = "Calm";
    // moodList.add(mainModel);

    return moodList;
  }



}