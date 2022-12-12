import 'dart:math';

import 'package:flutter/material.dart';

class RatingView_BACKUP extends StatefulWidget {
  const RatingView_BACKUP({Key? key}) : super(key: key);

  @override
  _RatingViewState createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView_BACKUP> {
  var _ratingPageController = PageController();
  var _starPosition = 200.0;
  var _rating = 0;
  var _selectedChipIndex = -1;
  var _isMoreDetailsActive = false;
  var _moreDetailFocuseNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          //Back Button
          if(_isMoreDetailsActive)
            Positioned(
                left: 0,
                top: 0,
                child: MaterialButton(
                  onPressed: (){
                    setState(() {
                      _isMoreDetailsActive = false;
                    });
                  },
                  child: Icon(Icons.arrow_back_ios),
                )
            ),
          //Skip Button
          Positioned(
              right: 0,
              child: MaterialButton(
                onPressed: _hideDialog,
                child: Text('Skip'),
              )),
          //Thanks Note
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
          //Star Rating
          AnimatedPositioned(
              top: _starPosition,
              left: 0,
              right: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    5,
                    (index) => IconButton(
                          icon: index < _rating
                              ? Icon(
                                  Icons.star,
                                  size: 32,
                                )
                              : Icon(
                                  Icons.star_border,
                                  size: 32,
                                ),
                          color: Theme.of(context).colorScheme.secondary,
                          onPressed: () {
                            _ratingPageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                            print(" Rating : ${index + 1}");
                            setState(() {
                              _starPosition = 20.0;
                              _rating = index + 1;
                            });
                          },
                        )),
              ),
              duration: Duration(milliseconds: 300)),
          // Done Button
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Theme.of(context).colorScheme.secondary,
                child: MaterialButton(
                  onPressed: _hideDialog,
                  child: Text(
                    'Done',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
              )),

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
          'Rate Your Feeling',
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
        Text(
          'Smile makes your look younger and have stronger immune system.',
          style: TextStyle(color: Colors.black45),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  _causeofRating() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
            visible: !_isMoreDetailsActive,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('What could we do better'),
                // Cause Selection
                Wrap(
                  spacing: 8.0,
                  alignment: WrapAlignment.center,
                  children: List.generate(6, (index) => InkWell(
                    onTap: (){
                      setState(() {
                        _selectedChipIndex = index;
                      });
                    },
                    child: Chip(
                      backgroundColor: _selectedChipIndex == index ? Theme.of(context).colorScheme.secondary : Colors.grey[300],
                      label: Text('Text ${index + 1}', style: TextStyle(color: _selectedChipIndex == index ? Theme.of(context).primaryColor :  Theme.of(context).colorScheme.secondary ),),
                    ),
                  )),
                ),
                SizedBox(height: 16,),
                // More Button
                InkWell(
                  onTap: (){
                    _moreDetailFocuseNode.requestFocus();
                    setState(() {
                      _isMoreDetailsActive = true;
                    });
                  },
                  child: Text(
                    'Want to tell us more',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          replacement: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Tell Us More'),
              Chip(label: Text('Text ${_selectedChipIndex + 1}')),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  focusNode: _moreDetailFocuseNode,
                  decoration: InputDecoration(
                    hintText: "Write your review here...",
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    border: InputBorder.none
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  _hideDialog(){
    if(Navigator.canPop(context))  Navigator.pop(context);
  }
}
