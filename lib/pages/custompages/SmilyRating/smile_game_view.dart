import 'dart:math';

import 'package:flutter/material.dart';

class SmileGame extends StatefulWidget {
  const SmileGame({Key? key}) : super(key: key);

  @override
  _SmileGameState createState() => _SmileGameState();
}

class _SmileGameState extends State<SmileGame> {
  var _verticalPosition = 0.0;
  var _horizontalPosition = 0.0;
  var _rating = 0;
  @override
  Widget build(BuildContext context) {
    print('Horizontal : $_horizontalPosition  Vertical : $_verticalPosition' );
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          AnimatedPositioned(
                      top: _verticalPosition,
                      left: _horizontalPosition,
                      child: Icon(
                        Icons.star,
                        size: 32,
                      ) ,
                      duration: Duration(milliseconds: 300),
                    ),
          AnimatedPositioned(
            top: 12.0,
            left: 25.0,
            //right: 20.0,
            child: Icon(
              Icons.star_border,
              size: 45,
            ) ,
            duration: Duration(milliseconds: 300),
          ),
          Positioned(
            bottom: 0,
            child: Row(
                          children: [
                            MaterialButton(
                              onPressed: (){horrizontalMove(leftmove: true);},
                              child: Text(
                                'LEFT', style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold, fontSize: 20.0),
                              ),
                            ),
                            MaterialButton(
                              onPressed: (){horrizontalMove(leftmove: false);},
                              child: Text(
                                'RIGHT', style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold, fontSize: 20.0),
                              ),
                            ),
                            MaterialButton(
                              onPressed: (){verticalMove(moveUp: true);},
                              child: Text(
                                'TOP', style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold, fontSize: 20.0),
                              ),
                            ),
                            MaterialButton(
                              onPressed: (){verticalMove(moveUp: false);},
                              child: Text(
                                'DOWN', style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold, fontSize: 20.0),
                              ),
                            ),
                            MaterialButton(
                              onPressed: (){},
                              child: Text(
                                'REFRESH', style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold, fontSize: 20.0),
                              ),
                            ),
                          ],
                        ),
          ),
        ],
      ),
    );

    // return SafeArea(
    //       child: Column(
    //         children: [
    //           AnimatedPositioned(
    //             top: 25,
    //             left: 25,
    //             child: Icon(
    //               Icons.star,
    //               size: 32,
    //             ) ,
    //             duration: Duration(milliseconds: 300),
    //           ),
    //           Container(
    //             height: max(400, MediaQuery.of(context).size.height * 0.3),
    //             child: AnimatedPositioned(
    //               top: 0,
    //               left: 0,
    //               right: 25,
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: List.generate(
    //                     5,
    //                         (index) => IconButton(
    //                       icon: index < _rating
    //                           ? Icon(
    //                         Icons.star,
    //                         size: 32,
    //                       )
    //                           : Icon(
    //                         Icons.star_border,
    //                         size: 32,
    //                       ),
    //                       color: Theme.of(context).colorScheme.secondary,
    //                       onPressed: () {
    //                       },
    //                     )),
    //               ),
    //               duration: Duration(milliseconds: 300),
    //             )
    //           ),
    //           Row(
    //               children: [
    //                 MaterialButton(
    //                   onPressed: (){horrizontalMove(leftmove: true);},
    //                   child: Text(
    //                     'LEFT', style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold, fontSize: 20.0),
    //                   ),
    //                 ),
    //                 MaterialButton(
    //                   onPressed: (){horrizontalMove(leftmove: false);},
    //                   child: Text(
    //                     'RIGHT', style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold, fontSize: 20.0),
    //                   ),
    //                 ),
    //                 MaterialButton(
    //                   onPressed: (){verticalMove(moveUp: true);},
    //                   child: Text(
    //                     'TOP', style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold, fontSize: 20.0),
    //                   ),
    //                 ),
    //                 MaterialButton(
    //                   onPressed: (){verticalMove(moveUp: false);},
    //                   child: Text(
    //                     'DOWN', style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold, fontSize: 20.0),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //         ],
    //       ),
    // );
  }

  void verticalMove({required bool moveUp}){
     if(moveUp) {
       if (_verticalPosition > 0) {
         setState(() {
           _verticalPosition =  (_verticalPosition > 2) ? (_verticalPosition - 2) : 0.0;
         });
       }
     }
     if(!moveUp)
       setState(() {
         _verticalPosition = _verticalPosition + 2;
       });
    }

  void horrizontalMove({required bool leftmove}){
    if(leftmove) {
      if (_horizontalPosition > 0) {
        setState(() {
          _horizontalPosition = (_horizontalPosition > 2) ? (_horizontalPosition - 2) : 0.0  ;
        });
      }
    }
    if(!leftmove)
      setState(() {
        _horizontalPosition = _horizontalPosition + 2;
      });

  }
}
