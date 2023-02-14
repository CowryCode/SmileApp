import 'package:SmileApp/apis/models/userprofile.dart';
import 'package:SmileApp/pages/custompages/facetracker/optimizedwidgets/happinessmap.dart';
import 'package:SmileApp/statemanagement/models/smilegamenotifiermodel.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.solidCircle,
                    color: Colors.black45,
                    size: 14,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  ValueListenableBuilder(
                      valueListenable: smileGameNofitier,
                      builder: (context, SmileGameVariables value, child) {
                        int pending = 175 - value.getSmileNumberofCountriesPainted();
                        return Text(
                          (value.getSmileNumberofCountriesPainted() == null)
                              ? " Pending:"
                              : " Pending:  $pending",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.5),
                            fontFamily: 'Poppins',
                            fontSize: 12.0.sp,
                          ),
                        );
                      }),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    FontAwesomeIcons.solidCircle,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 12.sp,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  ValueListenableBuilder(
                      valueListenable: smileGameNofitier,
                      builder: (context, SmileGameVariables value, child) {
                        return Text(
                         " Completed:  ${value.getSmileNumberofCountriesPainted()}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.5),
                            fontFamily: 'Poppins',
                            fontSize: 12.0.sp,
                          ),
                        );
                      }),
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
