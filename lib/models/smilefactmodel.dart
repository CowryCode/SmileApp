import 'dart:math';

class SmileFactsModel{
  String modelsDictionary(){
    int index = Random().nextInt(35);
    List<String> smilefacts = <String>[
      /* Source: https://www.1800flowers.com/blog/delivering-smiles/smile-facts/ */
     "There are 19 types of smiles.",
     "People are attracted to those who smile and are pushed away  by those who frown or scowl.",
      "Study shows that 69% of people preferred a smiling face not wearing makeup to a non-smiling, makeup-wearing face!",
      "It’s hard to be down when you have a genuine smile on! ",
      "Did you know that you can trick yourself into being in a better mood simply by smiling?",
      "Smiling helps you relax and boosts your immune system.",
      "Smiling lowers blood pressure. ",
      "Smiling releases endorphins and relieves stress. ",
      "Smiling is a sometimes referred to as a natural pain killer! ",
      "Smiles are contagious- a study done in Sweden showed that people struggled to frown when they looked at other people who were smiling",
      "The two muscles that create a smile are the zygomatic major and the orbicularis oculi.",
      "Smiles are the most easily recognizable facial expression.",
      "Duchenne smiles are the scientific name for genuine smiles.",
      "The crinkling in the corner of the eyes is a tell-tale sign of a genuine smile.",
      "People who smile are more likely to get a promotion.",
      "Smiles are the most easily recognized facial expression; they can be recognized from over 300 feet away.",
      "Women smile more than men.",
      "Women are more likely to tell the difference between a genuine and a fake smile.",
      "Babies start smiling as soon as they are born in their sleep. They start voluntarily smiling as soon as four weeks of age.",
      "Newborns prefer a smiling person to a non-smiling person.",
      "A dog smiles by wagging its tail!",
      "American emoticons focus on the mouth whereas Japanese emoticons focus on the eyes ",
      "Primates smile for all the same reasons humans do.",
      "The orbitofrontal cortex which shows feeling for close relations, becomes active when parents see their own babies smile, but not other babies.",
     "Research has found that a slow onset smile (a smile that takes longer to spread across the face) is found to be more trustworthy",
     /* https://ethosorthodontics.com.au/blog/11-facts-about-smiling/ */
     "You feel better when you smile.",
     "Smiling is contagious.",
     "You will look more attractive to men when you are smiling, if you are a woman.",
     "It makes you sound friendly.",
     "Those who smile live longer.",
     "Newborns are able to smile.",
     "You are more likely to get a promotion if you always smile.",
     "There are 19 types of smiles.",
     "People tend to smile more when surrounded by people than alone.",
     "Smiling is a universal sign of happiness.",
     "There are 19 types of smiles.",

   ];

    return smilefacts.elementAt(index);
  }
}