class OnBoarding {
  String? image;
  String? title;
  String? description;

  OnBoarding({this.image, this.description,this.title});
}

class OnBoardingList {
  List<OnBoarding>? _list;

  List<OnBoarding> get list => _list!;

  OnBoardingList() {
    _list = [
      new OnBoarding(image: 'images/f1.png', description: 'Smile to paint the world grean. \n Your smile is heals the world.',title: 'SmileGram'),
      new OnBoarding(image: 'images/f-1.png', description: 'With this feature you can chat with Mfon  \n Our baby AI bot.',title: 'Pocket Buddy'),
      new OnBoarding(image: 'images/f-1.png', description: 'You are not alone.\n With this feature, \n You can receive lovely notes from people across the world',title: 'My Tribe'),
    ];
  }
}
