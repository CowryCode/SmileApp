import 'dart:math';

import 'package:SmileApp/apis/networkUtilities.dart';
import 'package:SmileApp/models/countrymodel.dart';
import 'package:SmileApp/pages/custompages/SmilyRating/rating_view.dart';
import 'package:SmileApp/statemanagement/models/smilegamenotifiermodel.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class SmileGramGame extends StatefulWidget {
  const SmileGramGame({Key? key}) : super(key: key);

  @override
  _SmileGramGameState createState() => _SmileGramGameState();

}

class _SmileGramGameState extends State<SmileGramGame> {

  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          ValueListenableBuilder(
              valueListenable: smileGameNofitier,
              builder: (context, SmileGameVariables gamevariables, child) {
                return Visibility(
                  visible: true,
                  child: AnimatedPositioned(
                    // top: 17.0,
                    // left: 300.0,
                    top: gamevariables.targetVerticalposition,
                    left: gamevariables.targetHorrizontalposition,
                    child: Icon(
                      getFontAweSomeIcon(iconIndex: gamevariables.numberOfStarMeetings),
                      size: 60,
                      color: Colors.grey,
                    ),
                    duration: Duration(milliseconds: 300),
                  ),
                );
              }
          ),
          ValueListenableBuilder(
              valueListenable: smileGameNofitier,
              builder: (context, SmileGameVariables gamevariables, child){
                return Visibility(
                  visible: true,
                  child: AnimatedPositioned(
                    top: gamevariables.targetVerticalposition ,
                    left: gamevariables.movingObjectHorrizontalposition,
                    child: Icon(
                      //The condition here is to ensure the an Icon is reused for Level 2
                      getFontAweSomeIcon(iconIndex: gamevariables.numberOfStarMeetings ),
                      size: 60,
                      color: Colors.orange,
                    ) ,
                    duration: Duration(milliseconds: 300),
                  ),
                );
              }
          ),
        ],
      ),
    );
  }

  IconData getFontAweSomeIcon({required int iconIndex}){

    switch(iconIndex){
      case 0:
        return FontAwesomeIcons.pepperHot;
      case 1:
        return FontAwesomeIcons.personRunning;
      case 2:
        return FontAwesomeIcons.trophy;
      case 3:
        return FontAwesomeIcons.car;
      case 4:
        return FontAwesomeIcons.faceSmile;
      case 5:
        return FontAwesomeIcons.hippo;
      case 6:
        return FontAwesomeIcons.apple;
      case 7:
        return FontAwesomeIcons.tree;
      case 8:
        return FontAwesomeIcons.hand;
      case 9:
        return FontAwesomeIcons.key;
      case 10:
        return FontAwesomeIcons.truck;
      case 11:
        return FontAwesomeIcons.piggyBank;
      case 12:
        return FontAwesomeIcons.bicycle;
      case 13:
        return FontAwesomeIcons.person;
      case 14:
        return FontAwesomeIcons.fish;
      case 15:
        return FontAwesomeIcons.shirt;
      case 16:
        return FontAwesomeIcons.anchor;
      case 17:
        return FontAwesomeIcons.peopleGroup;
      case 18:
        return FontAwesomeIcons.carSide;
      case 19:
        return FontAwesomeIcons.userSecret;
      case 20:
        return FontAwesomeIcons.handHoldingHeart;
      case 21:
        return FontAwesomeIcons.kiwiBird;
      case 22:
        return FontAwesomeIcons.earlybirds;
      case 23:
        return FontAwesomeIcons.truckFront;
      case 24:
        return FontAwesomeIcons.cableCar;
      case 25:
        return FontAwesomeIcons.mountainSun;
      case 26:
        return FontAwesomeIcons.personShelter;
      case 27:
        return FontAwesomeIcons.personSkating;
      case 28:
        return FontAwesomeIcons.personSkiing;
      case 29:
        return FontAwesomeIcons.personSnowboarding;
      case 30:
        return FontAwesomeIcons.pencil;
      case 31:
        return FontAwesomeIcons.phoneVolume;
      case 32:
        return FontAwesomeIcons.carBurst;
      case 33:
        return FontAwesomeIcons.streetView;
      case 34:
        return FontAwesomeIcons.database;
      case 35:
        return FontAwesomeIcons.mobile;
      case 36:
        return FontAwesomeIcons.hourglass;
      case 37:
        return FontAwesomeIcons.store;
      case 38:
        return FontAwesomeIcons.flag;
      case 39:
        return FontAwesomeIcons.handPointUp;
      case 40:
        return FontAwesomeIcons.pagelines;
      case 41:
        return FontAwesomeIcons.shield;
      case 42:
        return FontAwesomeIcons.rocket;
      case 43:
        return FontAwesomeIcons.signature;
      case 44:
        return FontAwesomeIcons.restroom;
      case 45:
        return FontAwesomeIcons.sitemap;
      case 46:
        return FontAwesomeIcons.moon;
      case 47:
        return FontAwesomeIcons.doorOpen;
      case 48:
        return FontAwesomeIcons.doorClosed;
      case 49:
        return FontAwesomeIcons.marker;
      case 50:
        return FontAwesomeIcons.starOfLife;
      case 51:
        return FontAwesomeIcons.leaf;
      case 52:
        return FontAwesomeIcons.shower;
      case 53:
        return FontAwesomeIcons.placeOfWorship;
      case 54:
        return FontAwesomeIcons.wallet;
      case 55:
        return FontAwesomeIcons.award;
      case 56:
        return FontAwesomeIcons.ship;
      case 57:
        return FontAwesomeIcons.lightbulb;
      case 58:
        return FontAwesomeIcons.motorcycle;
      case 59:
        return FontAwesomeIcons.accessibleIcon;
      case 60:
        return FontAwesomeIcons.seedling;
      case 61:
        return FontAwesomeIcons.wrench;
      case 62:
        return FontAwesomeIcons.microchip;
      case 63:
        return FontAwesomeIcons.trophy;
      case 64:
        return FontAwesomeIcons.hammer;
      case 65:
        return FontAwesomeIcons.crown;
      case 66:
        return FontAwesomeIcons.virus;
      case 67:
        return FontAwesomeIcons.medal;
      case 68:
        return FontAwesomeIcons.radio;
      case 69:
        return FontAwesomeIcons.reply;
      case 70:
        return FontAwesomeIcons.chair;
      case 71:
        return FontAwesomeIcons.dragon;
      case 72:
        return FontAwesomeIcons.userTie;
      case 73:
        return FontAwesomeIcons.puzzlePiece;
      case 74:
        return FontAwesomeIcons.wineBottle;
      case 75:
        return FontAwesomeIcons.peopleArrows;
      case 76:
        return FontAwesomeIcons.glasses;
      case 77:
        return FontAwesomeIcons.kiwiBird;
      case 78:
        return FontAwesomeIcons.umbrellaBeach;
      case 79:
        return FontAwesomeIcons.microphone;
      case 80:
        return FontAwesomeIcons.dumbbell;
      case 81:
        return FontAwesomeIcons.vihara;
      case 82:
        return FontAwesomeIcons.usersLine;
      case 83:
        return FontAwesomeIcons.userGear;
      case 84:
        return FontAwesomeIcons.truckPlane;
      case 85:
        return FontAwesomeIcons.spa;
      case 86:
        return FontAwesomeIcons.socks;
      case 87:
        return FontAwesomeIcons.radiation;
      case 88:
        return FontAwesomeIcons.plateWheat;
      case 89:
        return FontAwesomeIcons.piggyBank;
      case 90:
        return FontAwesomeIcons.personRays;
      case 91:
        return FontAwesomeIcons.personMilitaryRifle;
      case 92:
        return FontAwesomeIcons.personHalfDress;
      case 93:
        return FontAwesomeIcons.personFallingBurst;
      case 94:
        return FontAwesomeIcons.personDrowning;
      case 95:
        return FontAwesomeIcons.personDressBurst;
      case 96:
        return FontAwesomeIcons.personBreastfeeding;
      case 97:
        return FontAwesomeIcons.personBiking;
      case 98:
        return FontAwesomeIcons.peoplePulling;
      case 99:
        return FontAwesomeIcons.peopleLine;
      case 100:
        return FontAwesomeIcons.peopleCarryBox;
      case 101:
        return FontAwesomeIcons.penRuler;
      case 102:
        return FontAwesomeIcons.paste;
      case 103:
        return FontAwesomeIcons.paragraph;
      case 104:
        return FontAwesomeIcons.parachuteBox;
      case 105:
        return FontAwesomeIcons.paperPlane;
      case 106:
        return FontAwesomeIcons.paintbrush;
      case 107:
        return FontAwesomeIcons.oilCan;
      case 108:
        return FontAwesomeIcons.notesMedical;
      case 109:
        return FontAwesomeIcons.mountainCity;
      case 110:
        return FontAwesomeIcons.mosquito;
      case 111:
        return FontAwesomeIcons.mound;
      case 112:
        return FontAwesomeIcons.mosquito;
      case 113:
        return FontAwesomeIcons.mortarPestle;
      case 114:
        return FontAwesomeIcons.solidMoon;
      case 115:
        return FontAwesomeIcons.monument;
      case 116:
        return FontAwesomeIcons.moneyBill;
      case 117:
        return FontAwesomeIcons.moneyBillWave;
      case 118:
        return FontAwesomeIcons.mobileScreenButton;
      case 119:
        return FontAwesomeIcons.mitten;
      case 120:
        return FontAwesomeIcons.minimize;
      case 121:
        return FontAwesomeIcons.microscope;
      case 122:
        return FontAwesomeIcons.microphoneLines;
      case 123:
        return FontAwesomeIcons.meteor;
      case 124:
        return FontAwesomeIcons.solidMessage;
      case 125:
        return FontAwesomeIcons.mercury;
      case 126:
        return FontAwesomeIcons.menorah;
      case 127:
        return FontAwesomeIcons.maskVentilator;
      case 128:
        return FontAwesomeIcons.martiniGlass;
      case 129:
        return FontAwesomeIcons.mapLocationDot;
      case 130:
        return FontAwesomeIcons.magnifyingGlassPlus;
      case 131:
        return FontAwesomeIcons.lungs;
      case 132:
        return FontAwesomeIcons.locust;
      case 133:
        return FontAwesomeIcons.lockOpen;
      case 134:
        return FontAwesomeIcons.locationPinLock;
      case 135:
        return FontAwesomeIcons.locationArrow;
      case 136:
        return FontAwesomeIcons.lightbulb;
      case 137:
        return FontAwesomeIcons.canadianMapleLeaf;
      case 138:
        return FontAwesomeIcons.laptopFile;
      case 139:
        return FontAwesomeIcons.landmarkFlag;
      case 140:
        return FontAwesomeIcons.landmarkDome;
      case 141:
        return FontAwesomeIcons.khanda;
      case 142:
        return FontAwesomeIcons.kaaba;
      case 143:
        return FontAwesomeIcons.jugDetergent;
      case 144:
        return FontAwesomeIcons.jetFighterUp;
      case 145:
        return FontAwesomeIcons.jetFighter;
      case 146:
        return FontAwesomeIcons.jar;
      case 147:
        return FontAwesomeIcons.jar;
      case 148:
        return FontAwesomeIcons.inbox;
      case 149:
        return FontAwesomeIcons.igloo;
      case 150:
        return FontAwesomeIcons.icicles;
      case 151:
        return FontAwesomeIcons.hurricane;
      case 152:
        return FontAwesomeIcons.houseChimneyWindow;
      case 153:
        return FontAwesomeIcons.houseTsunami;
      case 154:
        return FontAwesomeIcons.houseSignal;
      case 155:
        return FontAwesomeIcons.houseMedicalFlag;
      case 156:
        return FontAwesomeIcons.houseFloodWaterCircleArrowRight;
      case 157:
        return FontAwesomeIcons.houseFire;
      case 158:
        return FontAwesomeIcons.hourglassEnd;
      case 159:
        return FontAwesomeIcons.horse;
      case 160:
        return FontAwesomeIcons.hollyBerry;
      case 161:
        return FontAwesomeIcons.hockeyPuck;
      case 162:
        return FontAwesomeIcons.hillRockslide;
      case 163:
        return FontAwesomeIcons.hillAvalanche;
      case 164:
        return FontAwesomeIcons.highlighter;
      case 165:
        return FontAwesomeIcons.helmetSafety;
      case 166:
        return FontAwesomeIcons.helmetUn;
      case 167:
        return FontAwesomeIcons.helicopter;
      case 168:
        return FontAwesomeIcons.hatWizard;
      case 169:
        return FontAwesomeIcons.hatCowboy;
      case 170:
        return FontAwesomeIcons.handshakeSimple;
      case 171:
        return FontAwesomeIcons.handshakeAngle;
      case 172:
        return FontAwesomeIcons.handsPraying;
      case 173:
        return FontAwesomeIcons.handsHoldingChild;
      case 174:
        return FontAwesomeIcons.handScissors;
      case 175:
        return FontAwesomeIcons.graduationCap;
      case 176:
        return FontAwesomeIcons.golfBallTee;
      default:
        return FontAwesomeIcons.guitar;
    }
  }

}
