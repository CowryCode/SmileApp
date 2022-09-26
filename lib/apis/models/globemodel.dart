import 'package:SmileApp/apis/models/countrymodel.dart';

class GobeModel1 {
  String userCountriesIndexString = "0";
  String? nextCountry;
  List<Model1>? countriesmodel;

  // GobeModel(){
  //   List<int>? indes = splitString(countriesIndexString: userCountriesIndexString);
  //
  // }


  List<int>? splitString({required String countriesIndexString}){
    try{
      if(countriesIndexString.isNotEmpty){
        print("*********************************************");
        print("Index String $countriesIndexString");
        print("String is empty ${countriesIndexString.isEmpty}");
        List<String> countries = countriesIndexString.split(",");
        print("Splitted String $countries");
        List<int> countriesIndices = countries.map(int.parse).toList();
        print("Splitted Int $countriesIndices");
        return countriesIndices;
      }else{
        return null;
      }
    }catch(e){
      return null;
    }

  }

  List<Model1>? loadModels({List<int>? indices}){
    try{
      if(indices != null){
        List<Model1> list = [];
        indices.forEach((element) {
         // list.add(modelsDictionary().elementAt(element));
        });
        return list;
      }else{
        return null;
      }
    }catch(e){
      return null;
    }

  }

  List<Model1>? getProcessedcountries({required String userCountriesIndexString}){
    List<int>? indes = splitString(countriesIndexString: userCountriesIndexString);
    if(indes != null){
      this.countriesmodel = loadModels(indices: splitString(countriesIndexString: userCountriesIndexString)!);
    }
    return this.countriesmodel;
  }

  // List<Model> modelsDictionary(){
  //   return <Model>[
  //     Model(country: "Country Name", status: "Low"),
  //     Model(country:   "Afghanistan", status: "High"),
  //     Model(country:   "Angola", status: "High"),
  //     Model(country:   "Albania", status: "High"),
  //     Model(country:   "United Arab Emirates", status: "High"),
  //     Model(country:   "Argentina", status: "High"),
  //     Model(country:   "Armenia", status: "High"),
  //     Model(country:   "Australia", status: "High"),
  //     Model(country:   "Austria", status: "High"),
  //     Model(country:   "Azerbaijan", status: "High"),
  //     Model(country:   "Burundi", status: "High"),
  //     Model(country:   "Belgium", status: "High"),
  //     Model(country:   "Benin", status: "High"),
  //     Model(country:   "Burkina Faso", status: "High"),
  //     Model(country:   "Bangladesh", status: "High"),
  //     Model(country:   "Bulgaria", status: "High"),
  //     Model(country:   "The Bahamas", status: "High"),
  //     Model(country:   "Bosnia and Herzegovina", status: "High"),
  //     Model(country:   "Belarus", status: "High"),
  //     Model(country:   "Belize", status: "High"),
  //     Model(country:   "Bolivia", status: "High"),
  //     Model(country:   "Brazil", status: "High"),
  //     Model(country:   "Brunei", status: "High"),
  //     Model(country:   "Bhutan", status: "High"),
  //     Model(country:   "Botswana", status: "High"),
  //     Model(country:   "Central African Republic", status: "High"),
  //     Model(country:   "Canada", status: "High"),
  //     Model(country:   "Switzerland", status: "High"),
  //     Model(country:   "Chile", status: "High"),
  //     Model(country:   "China", status: "High"),
  //     Model(country:   "Ivory Coast", status: "High"),
  //     Model(country:   "Cameroon", status: "High"),
  //     Model(country:   "Democratic Republic of the Congo", status: "High"),
  //     Model(country:   "Republic of Congo", status: "High"),
  //     Model(country:   "Colombia", status: "High"),
  //     Model(country:   "Costa Rica", status: "High"),
  //     Model(country:   "Cuba", status: "High"),
  //     Model(country:   "Northern Cyprus", status: "High"),
  //     Model(country:   "Cyprus", status: "High"),
  //     Model(country:   "Czech Republic", status: "High"),
  //     Model(country:   "Germany", status: "High"),
  //     Model(country:   "Djibouti", status: "High"),
  //     Model(country:   "Denmark", status: "High"),
  //     Model(country:   "Dominican Republic", status: "High"),
  //     Model(country:   "Algeria", status: "High"),
  //     Model(country:   "Ecuador", status: "High"),
  //     Model(country:   "Egypt", status: "High"),
  //     Model(country:   "Eritrea", status: "High"),
  //     Model(country:   "Spain", status: "High"),
  //     Model(country:   "Estonia", status: "High"),
  //     Model(country:   "Ethiopia", status: "High"),
  //     Model(country:   "Finland", status: "High"),
  //     Model(country:   "Fiji", status: "High"),
  //     Model(country:   "Falkland Islands", status: "High"),
  //     Model(country:   "France", status: "High"),
  //     Model(country:   "Gabon", status: "High"),
  //     Model(country:   "United Kingdom", status: "High"),
  //     Model(country:   "Georgia", status: "High"),
  //     Model(country:   "Ghana", status: "High"),
  //     Model(country:   "Guinea", status: "High"),
  //     Model(country:   "Gambia", status: "High"),
  //     Model(country:   "Guinea Bissau", status: "High"),
  //     Model(country:   "Equatorial Guinea", status: "High"),
  //     Model(country:   "Greece", status: "High"),
  //     Model(country:   "Greenland", status: "High"),
  //     Model(country:   "Guatemala", status: "High"),
  //     Model(country:   "Guyana", status: "High"),
  //     Model(country:   "Honduras", status: "High"),
  //     Model(country:   "Croatia", status: "High"),
  //     Model(country:   "Haiti", status: "High"),
  //     Model(country:   "Hungary", status: "High"),
  //     Model(country:   "Indonesia", status: "High"),
  //     Model(country:   "India", status: "High"),
  //     Model(country:   "Ireland", status: "High"),
  //     Model(country:   "Iran", status: "High"),
  //     Model(country:   "Iraq", status: "High"),
  //     Model(country:   "Iceland", status: "High"),
  //     Model(country:   "Israel", status: "High"),
  //     Model(country:   "Italy", status: "High"),
  //     Model(country:   "Jamaica", status: "High"),
  //     Model(country:   "Jordan", status: "High"),
  //     Model(country:   "Japan", status: "High"),
  //     Model(country:   "Kazakhstan", status: "High"),
  //     Model(country:   "Kenya", status: "High"),
  //     Model(country:   "Kyrgyzstan", status: "High"),
  //     Model(country:   "Cambodia", status: "High"),
  //     Model(country:   "South Korea", status: "High"),
  //     Model(country:   "Kosovo", status: "High"),
  //     Model(country:   "Kuwait", status: "High"),
  //     Model(country:   "Laos", status: "High"),
  //     Model(country:   "Lebanon", status: "High"),
  //     Model(country:   "Liberia", status: "High"),
  //     Model(country:   "Libya", status: "High"),
  //     Model(country:   "Sri Lanka", status: "High"),
  //     Model(country:   "Lesotho", status: "High"),
  //     Model(country:   "Lithuania", status: "High"),
  //     Model(country:   "Luxembourg", status: "High"),
  //     Model(country:   "Latvia", status: "High"),
  //     Model(country:   "Morocco", status: "High"),
  //     Model(country:   "Moldova", status: "High"),
  //     Model(country:   "Madagascar", status: "High"),
  //     Model(country:   "Mexico", status: "High"),
  //     Model(country:   "Macedonia", status: "High"),
  //     Model(country:   "Mali", status: "High"),
  //     Model(country:   "Myanmar", status: "High"),
  //     Model(country:   "Montenegro", status: "High"),
  //     Model(country:   "Mongolia", status: "High"),
  //     Model(country:   "Mozambique", status: "High"),
  //     Model(country:   "Mauritania", status: "High"),
  //     Model(country:   "Malawi", status: "High"),
  //     Model(country:   "Malaysia", status: "High"),
  //     Model(country:   "Namibia", status: "High"),
  //     Model(country:   "New Caledonia", status: "High"),
  //     Model(country:   "Niger", status: "High"),
  //     Model(country:   "Nigeria", status: "High"),
  //     Model(country:   "Nicaragua", status: "High"),
  //     Model(country:   "Netherlands", status: "High"),
  //     Model(country:   "Norway", status: "High"),
  //     Model(country:   "Nepal", status: "High"),
  //     Model(country:   "New Zealand", status: "High"),
  //     Model(country:   "Oman", status: "High"),
  //     Model(country:   "Pakistan", status: "High"),
  //     Model(country:   "Panama", status: "High"),
  //     Model(country:   "Peru", status: "High"),
  //     Model(country:   "Philippines", status: "High"),
  //     Model(country:   "Papua New Guinea", status: "High"),
  //     Model(country:   "Poland", status: "High"),
  //     Model(country:   "Puerto Rico", status: "High"),
  //     Model(country:   "North Korea", status: "High"),
  //     Model(country:   "Portugal", status: "High"),
  //     Model(country:   "Paraguay", status: "High"),
  //     Model(country:   "Palestine", status: "High"),
  //     Model(country:   "Qatar", status: "High"),
  //     Model(country:   "Romania", status: "High"),
  //     Model(country:   "Russia", status: "High"),
  //     Model(country:   "Rwanda", status: "High"),
  //     Model(country:   "Western Sahara", status: "High"),
  //     Model(country:   "Saudi Arabia", status: "High"),
  //     Model(country:   "Sudan", status: "High"),
  //     Model(country:   "South Sudan", status: "High"),
  //     Model(country:   "Senegal", status: "High"),
  //     Model(country:   "Solomon Islands", status: "High"),
  //     Model(country:   "Sierra Leone", status: "High"),
  //     Model(country:   "El Salvador", status: "High"),
  //     Model(country:   "Somaliland", status: "High"),
  //     Model(country:   "Somalia", status: "High"),
  //     Model(country:   "Republic of Serbia", status: "High"),
  //     Model(country:   "Suriname", status: "High"),
  //     Model(country:   "Slovakia", status: "High"),
  //     Model(country:   "Slovenia", status: "High"),
  //     Model(country:   "Sweden", status: "High"),
  //     Model(country:   "Swaziland", status: "High"),
  //     Model(country:   "Syria", status: "High"),
  //     Model(country:   "Chad", status: "High"),
  //     Model(country:   "Togo", status: "High"),
  //     Model(country:   "Thailand", status: "High"),
  //     Model(country:   "Tajikistan", status: "High"),
  //     Model(country:   "Turkmenistan", status: "High"),
  //     Model(country:   "East Timor", status: "High"),
  //     Model(country:   "Trinidad and Tobago", status: "High"),
  //     Model(country:   "Tunisia", status: "High"),
  //     Model(country:   "Turkey", status: "High"),
  //     Model(country:   "Taiwan", status: "High"),
  //     Model(country:   "United Republic of Tanzania", status: "High"),
  //     Model(country:   "Uganda", status: "High"),
  //     Model(country:   "Ukraine", status: "High"),
  //     Model(country:   "Uruguay", status: "High"),
  //     Model(country:   "United States of America", status: "High"),
  //     Model(country:   "Uzbekistan", status: "High"),
  //     Model(country:   "Venezuela", status: "High"),
  //     Model(country:   "Vietnam", status: "High"),
  //     Model(country:   "Vanuatu", status: "High"),
  //     Model(country:   "Yemen", status: "High"),
  //     Model(country:   "South Africa", status: "High"),
  //     Model(country:   "Zambia", status: "High"),
  //     Model(country:   "Zimbabwe", status: "High"),
  //
  //
  //   ];
  // }

}
