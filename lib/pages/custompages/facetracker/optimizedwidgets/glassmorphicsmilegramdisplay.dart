import 'package:SmileApp/apis/models/userprofile.dart';
import 'package:SmileApp/pages/custompages/facetracker/optimizedwidgets/happinessmap.dart';
import 'package:SmileApp/statemanagement/models/smilegamenotifiermodel.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GlassmorphicSmilegramDisplay extends StatefulWidget {
  const GlassmorphicSmilegramDisplay({Key? key}) : super(key: key);

  @override
  _GlassmorphicSmilegramDisplayState createState() =>
      _GlassmorphicSmilegramDisplayState();
}

class _GlassmorphicSmilegramDisplayState
    extends State<GlassmorphicSmilegramDisplay> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ValueListenableBuilder(
              // valueListenable: counterNotifier,
              valueListenable: smileAppValueNotifier.value.deactivetSound,
              builder: (context, bool value, child) {
                return IconButton(
                    onPressed: () {
                      smileAppValueNotifier.updateSoundDeactivation(
                          deactivateSound: !value);
                    },
                    icon: Icon(
                      (value != true)
                          ? FontAwesomeIcons.volumeHigh
                          : FontAwesomeIcons.volumeOff,
                      color: Colors.green,
                    ));
              },
            ),
            ValueListenableBuilder(
              // valueListenable: counterNotifier,
              valueListenable: smileAppValueNotifier.value.smileDurationCount,
              builder: (context, value, child) {
                return Text(
                  "${value.toString()} ",
                  style: const TextStyle(
                      fontSize: 33.0,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                );
              },
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              // margin: const EdgeInsets.only(left: 5, right: 5, top: 1),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                border:
                    Border.all(width: 1.0, color: Colors.grey.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: ValueListenableBuilder(
                // valueListenable: counterNotifier,
                valueListenable: smileAppValueNotifier.value.nextCountry,
                builder: (context, String value, child) {
                  return Text(
                    '   $value',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      fontFamily: 'Poppins',
                      fontSize: 14.0,
                    ),
                  );
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              // margin: const EdgeInsets.only(left: 5, right: 5, top: 1),
              decoration: BoxDecoration(
                // color:  Colors.black12,
                color: Theme.of(context).primaryColor,
                border:
                    Border.all(width: 1.0, color: Colors.grey.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(16.0),
              ),
              // child: ValueListenableBuilder(
              //   valueListenable: userProfileNotifier,
              //   builder: (context, UserProfile userfile, child) {
              //     return Row(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.solidCircle,
                    color: Colors.black45,
                    size: 12,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  ValueListenableBuilder(
                      valueListenable: userProfileNotifier,
                      builder: (context, UserProfile userfile, child) {
                        return Text(
                          (userfile.todayTargetValue == null)
                              ? " Today'sTarget:"
                              : " Today'sTarget:  ${userfile.todayTargetValue}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 12.0,
                          ),
                        );
                      }),
                  // Text(
                  //   (userfile.todayTargetValue == null) ? " Today'sTarget:" : " Today'sTarget:  ${userfile.todayTargetValue}",
                  //   style: const TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.black,
                  //     fontFamily: 'Poppins',
                  //     fontSize: 12.0,
                  //   ),
                  // ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    FontAwesomeIcons.solidCircle,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 12,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  ValueListenableBuilder(
                      valueListenable: smileGameNofitier,
                      builder: (context, SmileGameVariables smilegramvariables, child) {
                        return Text(
                         " Today's Score:  ${smilegramvariables.numberOfStarMeetings}", //Number of meetings represents number of countires painted
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 12.0,
                          ),
                        );
                      }),
                  // Text(
                  //   (userfile.todayAchievedValue == null)
                  //       ? "Today's Score:"
                  //       : " Today's Score:  ${userfile.todayAchievedValue}",
                  //   style: const TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.black,
                  //     fontFamily: 'Poppins',
                  //     fontSize: 12.0,
                  //   ),
                  // ),
                ],
                //  );
                //   },
              ),
            ),
          ],
        ),
        Align(alignment: Alignment.center, child: HappinessMap()),
      ],
    ));
  }
}
