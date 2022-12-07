import 'dart:math';

import 'package:flutter/material.dart';

class RatingView extends StatefulWidget {
  const RatingView({Key? key}) : super(key: key);

  @override
  _RatingViewState createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {
  var _ratingPageController = PageController();
  var _starPosition = 200.0;
  var _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Container(
            height: max(300, MediaQuery.of(context).size.height * 0.3),
            child: PageView(
              controller: _ratingPageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _builderThanksNote(),
                _causeofRating(),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Theme.of(context).colorScheme.secondary,
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    'Done',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
              )),
          Positioned(
              right: 0,
              child: MaterialButton(
                onPressed: () {},
                child: Text('Skip'),
              )),
          AnimatedPositioned(
              top: _starPosition,
              left: 0,
              right: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    5,
                    (index) => IconButton(
                          icon: index < _rating ? Icon(Icons.star, size: 32,) :  Icon(Icons.star_border, size: 32,) ,
                          color: Theme.of(context).colorScheme.secondary,
                          onPressed: () {
                            print(" Rating : ${index + 1}");
                            setState(() {
                              _starPosition = 20.0;
                              _rating = index + 1;
                            });
                          },
                        )),
              ),
              duration: Duration(milliseconds: 300)),
        ],
      ),
    );
  }

  _builderThanksNote() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Thanks for using Smile App',
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
        Text(
          'We would love to get your feedback',
          style: TextStyle(color: Colors.black45),
        ),
      ],
    );
  }

  _causeofRating() {
    return Container();
  }
}
