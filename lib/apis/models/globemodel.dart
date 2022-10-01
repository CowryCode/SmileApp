import 'package:SmileApp/apis/models/countrymodel.dart';

class GlobeModel {
  String userCountriesIndexString = "0";
  String? nextCountry;
  List<Model>? countriesmodel;
  List<int>? indices;



  List<int>? splitString({required String countriesIndexString}){
    try{
      if(countriesIndexString.isNotEmpty){
        List<String> countries = countriesIndexString.split(",");
        List<int> countriesIndices = countries.map(int.parse).toList();
        return countriesIndices;
      }else{
        return null;
      }
    }catch(e){
      return null;
    }

  }

  List<Model>? loadModels({List<int>? indices}){
    try{
      if(indices != null){
        List<Model> list = [];
        indices.forEach((element) {
         list.add(modelsDictionary().elementAt(element));
        });

        int nextElement = indices.last + 1;
        if(nextElement < modelsDictionary().length){
          Model nextCountryTopaint = Model(state: modelsDictionary().elementAt(nextElement).state, storage: "Low");
          list.add(nextCountryTopaint);
        }

        return list;
      }else{
        return null;
      }
    }catch(e){
      return null;
    }

  }

  List<Model>? getProcessedcountries({required String userCountriesIndexString}){
    List<int>? indes = splitString(countriesIndexString: userCountriesIndexString);
    this.indices = indes;
    if(indes != null){
      this.countriesmodel = loadModels(indices: splitString(countriesIndexString: userCountriesIndexString)!);
    }
    return this.countriesmodel;
  }

  List<Model> modelsDictionary(){
    return <Model>[
      Model(state: "Country Name", storage: "Low"),
      Model(state:   "Afghanistan", storage: "High"),
      Model(state:   "Angola", storage: "High"),
      Model(state:   "Albania", storage: "High"),
      Model(state:   "United Arab Emirates", storage: "High"),
      Model(state:   "Argentina", storage: "High"),
      Model(state:   "Armenia", storage: "High"),
      Model(state:   "Australia", storage: "High"),
      Model(state:   "Austria", storage: "High"),
      Model(state:   "Azerbaijan", storage: "High"),
      Model(state:   "Burundi", storage: "High"),
      Model(state:   "Belgium", storage: "High"),
      Model(state:   "Benin", storage: "High"),
      Model(state:   "Burkina Faso", storage: "High"),
      Model(state:   "Bangladesh", storage: "High"),
      Model(state:   "Bulgaria", storage: "High"),
      Model(state:   "The Bahamas", storage: "High"),
      Model(state:   "Bosnia and Herzegovina", storage: "High"),
      Model(state:   "Belarus", storage: "High"),
      Model(state:   "Belize", storage: "High"),
      Model(state:   "Bolivia", storage: "High"),
      Model(state:   "Brazil", storage: "High"),
      Model(state:   "Brunei", storage: "High"),
      Model(state:   "Bhutan", storage: "High"),
      Model(state:   "Botswana", storage: "High"),
      Model(state:   "Central African Republic", storage: "High"),
      Model(state:   "Canada", storage: "High"),
      Model(state:   "Switzerland", storage: "High"),
      Model(state:   "Chile", storage: "High"),
      Model(state:   "China", storage: "High"),
      Model(state:   "Ivory Coast", storage: "High"),
      Model(state:   "Cameroon", storage: "High"),
      Model(state:   "Democratic Republic of the Congo", storage: "High"),
      Model(state:   "Republic of Congo", storage: "High"),
      Model(state:   "Colombia", storage: "High"),
      Model(state:   "Costa Rica", storage: "High"),
      Model(state:   "Cuba", storage: "High"),
      Model(state:   "Northern Cyprus", storage: "High"),
      Model(state:   "Cyprus", storage: "High"),
      Model(state:   "Czech Republic", storage: "High"),
      Model(state:   "Germany", storage: "High"),
      Model(state:   "Djibouti", storage: "High"),
      Model(state:   "Denmark", storage: "High"),
      Model(state:   "Dominican Republic", storage: "High"),
      Model(state:   "Algeria", storage: "High"),
      Model(state:   "Ecuador", storage: "High"),
      Model(state:   "Egypt", storage: "High"),
      Model(state:   "Eritrea", storage: "High"),
      Model(state:   "Spain", storage: "High"),
      Model(state:   "Estonia", storage: "High"),
      Model(state:   "Ethiopia", storage: "High"),
      Model(state:   "Finland", storage: "High"),
      Model(state:   "Fiji", storage: "High"),
      Model(state:   "Falkland Islands", storage: "High"),
      Model(state:   "France", storage: "High"),
      Model(state:   "Gabon", storage: "High"),
      Model(state:   "United Kingdom", storage: "High"),
      Model(state:   "Georgia", storage: "High"),
      Model(state:   "Ghana", storage: "High"),
      Model(state:   "Guinea", storage: "High"),
      Model(state:   "Gambia", storage: "High"),
      Model(state:   "Guinea Bissau", storage: "High"),
      Model(state:   "Equatorial Guinea", storage: "High"),
      Model(state:   "Greece", storage: "High"),
      Model(state:   "Greenland", storage: "High"),
      Model(state:   "Guatemala", storage: "High"),
      Model(state:   "Guyana", storage: "High"),
      Model(state:   "Honduras", storage: "High"),
      Model(state:   "Croatia", storage: "High"),
      Model(state:   "Haiti", storage: "High"),
      Model(state:   "Hungary", storage: "High"),
      Model(state:   "Indonesia", storage: "High"),
      Model(state:   "India", storage: "High"),
      Model(state:   "Ireland", storage: "High"),
      Model(state:   "Iran", storage: "High"),
      Model(state:   "Iraq", storage: "High"),
      Model(state:   "Iceland", storage: "High"),
      Model(state:   "Israel", storage: "High"),
      Model(state:   "Italy", storage: "High"),
      Model(state:   "Jamaica", storage: "High"),
      Model(state:   "Jordan", storage: "High"),
      Model(state:   "Japan", storage: "High"),
      Model(state:   "Kazakhstan", storage: "High"),
      Model(state:   "Kenya", storage: "High"),
      Model(state:   "Kyrgyzstan", storage: "High"),
      Model(state:   "Cambodia", storage: "High"),
      Model(state:   "South Korea", storage: "High"),
      Model(state:   "Kosovo", storage: "High"),
      Model(state:   "Kuwait", storage: "High"),
      Model(state:   "Laos", storage: "High"),
      Model(state:   "Lebanon", storage: "High"),
      Model(state:   "Liberia", storage: "High"),
      Model(state:   "Libya", storage: "High"),
      Model(state:   "Sri Lanka", storage: "High"),
      Model(state:   "Lesotho", storage: "High"),
      Model(state:   "Lithuania", storage: "High"),
      Model(state:   "Luxembourg", storage: "High"),
      Model(state:   "Latvia", storage: "High"),
      Model(state:   "Morocco", storage: "High"),
      Model(state:   "Moldova", storage: "High"),
      Model(state:   "Madagascar", storage: "High"),
      Model(state:   "Mexico", storage: "High"),
      Model(state:   "Macedonia", storage: "High"),
      Model(state:   "Mali", storage: "High"),
      Model(state:   "Myanmar", storage: "High"),
      Model(state:   "Montenegro", storage: "High"),
      Model(state:   "Mongolia", storage: "High"),
      Model(state:   "Mozambique", storage: "High"),
      Model(state:   "Mauritania", storage: "High"),
      Model(state:   "Malawi", storage: "High"),
      Model(state:   "Malaysia", storage: "High"),
      Model(state:   "Namibia", storage: "High"),
      Model(state:   "New Caledonia", storage: "High"),
      Model(state:   "Niger", storage: "High"),
      Model(state:   "Nigeria", storage: "High"),
      Model(state:   "Nicaragua", storage: "High"),
      Model(state:   "Netherlands", storage: "High"),
      Model(state:   "Norway", storage: "High"),
      Model(state:   "Nepal", storage: "High"),
      Model(state:   "New Zealand", storage: "High"),
      Model(state:   "Oman", storage: "High"),
      Model(state:   "Pakistan", storage: "High"),
      Model(state:   "Panama", storage: "High"),
      Model(state:   "Peru", storage: "High"),
      Model(state:   "Philippines", storage: "High"),
      Model(state:   "Papua New Guinea", storage: "High"),
      Model(state:   "Poland", storage: "High"),
      Model(state:   "Puerto Rico", storage: "High"),
      Model(state:   "North Korea", storage: "High"),
      Model(state:   "Portugal", storage: "High"),
      Model(state:   "Paraguay", storage: "High"),
      Model(state:   "Palestine", storage: "High"),
      Model(state:   "Qatar", storage: "High"),
      Model(state:   "Romania", storage: "High"),
      Model(state:   "Russia", storage: "High"),
      Model(state:   "Rwanda", storage: "High"),
      Model(state:   "Western Sahara", storage: "High"),
      Model(state:   "Saudi Arabia", storage: "High"),
      Model(state:   "Sudan", storage: "High"),
      Model(state:   "South Sudan", storage: "High"),
      Model(state:   "Senegal", storage: "High"),
      Model(state:   "Solomon Islands", storage: "High"),
      Model(state:   "Sierra Leone", storage: "High"),
      Model(state:   "El Salvador", storage: "High"),
      Model(state:   "Somaliland", storage: "High"),
      Model(state:   "Somalia", storage: "High"),
      Model(state:   "Republic of Serbia", storage: "High"),
      Model(state:   "Suriname", storage: "High"),
      Model(state:   "Slovakia", storage: "High"),
      Model(state:   "Slovenia", storage: "High"),
      Model(state:   "Sweden", storage: "High"),
      Model(state:   "Swaziland", storage: "High"),
      Model(state:   "Syria", storage: "High"),
      Model(state:   "Chad", storage: "High"),
      Model(state:   "Togo", storage: "High"),
      Model(state:   "Thailand", storage: "High"),
      Model(state:   "Tajikistan", storage: "High"),
      Model(state:   "Turkmenistan", storage: "High"),
      Model(state:   "East Timor", storage: "High"),
      Model(state:   "Trinidad and Tobago", storage: "High"),
      Model(state:   "Tunisia", storage: "High"),
      Model(state:   "Turkey", storage: "High"),
      Model(state:   "Taiwan", storage: "High"),
      Model(state:   "United Republic of Tanzania", storage: "High"),
      Model(state:   "Uganda", storage: "High"),
      Model(state:   "Ukraine", storage: "High"),
      Model(state:   "Uruguay", storage: "High"),
      Model(state:   "United States of America", storage: "High"),
      Model(state:   "Uzbekistan", storage: "High"),
      Model(state:   "Venezuela", storage: "High"),
      Model(state:   "Vietnam", storage: "High"),
      Model(state:   "Vanuatu", storage: "High"),
      Model(state:   "Yemen", storage: "High"),
      Model(state:   "South Africa", storage: "High"),
      Model(state:   "Zambia", storage: "High"),
      Model(state:   "Zimbabwe", storage: "High"),
    ];
  }

}
