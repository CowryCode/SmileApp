
import 'package:flutter/material.dart';

class LuckPot extends StatefulWidget {
  const LuckPot({Key key}) : super(key: key);

  @override
  _LuckPotState createState() => _LuckPotState();
}

class _LuckPotState extends State<LuckPot> {
  int _value = 0;
  bool _activated = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: LuchMatrics()
    );
  }

  Widget LuchMatrics(){
  return Wrap(
    children: List<Widget>.generate(
      20,
          (int index) {
        return index == 10 && _activated == true?
        IconButton(
          key: Key("$index"),
          icon: const Icon(Icons.call),
          color: Theme.of(context).colorScheme.secondary,
          onPressed: () {
          },
        ):
        ChoiceChip(
          key: Key('$index'),
          elevation: 6.0,
          backgroundColor:  Colors.white,
          padding: const EdgeInsets.only(left :10, right : 10),
        //  label: Text('Item $index'),
          label: Text('Item'),
          selected: _value == index,
          onSelected: (bool selected) {
            setState(() {
              _value = selected ? index : null;
              _activated = index == 10 ? true : false;
              print("Selected Value if $_value");
            });
          },
        );
      },
    ).toList(),
  );
  //   return Wrap(
  //     children: [
  //       thechipchoices(1),
  //       thechipchoices(2),
  //       thechipchoices(3),
  //       thechipchoices(4),
  //       thechipchoices(5),
  //       thechipchoices(6),
  //       thechipchoices(7),
  //       thechipchoices(8),
  //       thechipchoices(9),
  //       thechipchoices(10),
  //       thechipchoices(11),
  //       thechipchoices(12),
  //       thechipchoices(13),
  //       thechipchoices(14),
  //       thechipchoices(15),
  //       thechipchoices(16),
  //       thechipchoices(17),
  //       thechipchoices(18),
  //       thechipchoices(19),
  //       thechipchoices(20),
  //       thechipchoices(21),
  //       thechipchoices(22),
  //       thechipchoices(23),
  //     ],
  //   );
}

Widget thechipchoices(int index){
  return ChoiceChip(
    elevation: 6.0,
    backgroundColor:  Colors.white,
    padding: const EdgeInsets.only(left :10, right : 10),
    //  label: Text('Item $index'),
    label: Text('Item'),
    selected: _value == index,
    onSelected: (bool selected) {
      setState(() {
        _value = selected ? index : null;
        print("Selected Value if $_value");
      });
    },
  );
}

}


