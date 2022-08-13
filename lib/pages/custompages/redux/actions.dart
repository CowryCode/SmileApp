// Actions: Actions are payloads of information that send data from your
// application to your store. They are the only source of information
// for the store. You send them to the store using store.dispatch().

import 'package:SmileApp/pages/custompages/redux/models/drink.dart';

class UpdateDrinkAction{
  final Drink updateDrink;
  UpdateDrinkAction(this.updateDrink);
}