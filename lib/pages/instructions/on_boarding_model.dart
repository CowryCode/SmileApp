class OnBoarding {
  String? image;
  String? title;
  String? description;
  int? featureID;

  OnBoarding({this.image, this.description,this.title, this.featureID});
}

class OnBoardingList {
  List<OnBoarding>? _list;

  List<OnBoarding> get list => _list!;

  OnBoardingList() {
    _list = [
      // new OnBoarding(image: 'assets/logo1.jpeg', description: 'Smile to paint the world grean. \n Your smile is heals the world.',title: 'SmileGram'),
      // new OnBoarding(image: 'assets/logo1.jpeg', description: 'With this feature you can chat with Mfon  \n Our baby AI bot.',title: 'Pocket Buddy'),
      // new OnBoarding(image: 'assets/logo1.jpeg', description: 'You are not alone.\n With this feature, \n You can receive lovely notes from people across the world',title: 'My Tribe'),

      new OnBoarding(image: 'assets/logo1.jpeg', title: 'SmileGram', featureID: 1),
      new OnBoarding(image: 'assets/logo1.jpeg', title: 'Pocket Buddy', featureID: 2),
      new OnBoarding(image: 'assets/logo1.jpeg', title: 'My Tribe', featureID: 3),
    ];
  }
}
