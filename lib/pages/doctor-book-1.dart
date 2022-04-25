import 'package:flutter/material.dart';
import 'package:medico/models/doctor.dart';
import 'package:medico/models/user.dart';
class DoctorBookFirstStep extends StatefulWidget {
  @override
  _DoctorBookFirstStepState createState() => _DoctorBookFirstStepState();
}

class _DoctorBookFirstStepState extends State<DoctorBookFirstStep> {
  List<String> morningList=["08.00","09.00","10.00","11.00","12.00"];
  List<String> afternoonList=["13.00","14.00","15.00","16.00","17.00","18.00",];
  List<String> nightList=["19.00","20.00","21.00","22.00","23.00","00.00"];
  String selectedChoice = "";
  User currentUser=new User.init().getCurrentUser();
  Doctor currentDoctor = new Doctor.init().getCurrentDoctor();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color:Theme.of(context).primaryColor )
              
             
         ,
          onPressed: (){
            Navigator.of(context).pushNamed('/doctorProfil');
          },
        ),
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          'Select a time slot',
          style: TextStyle(
            fontSize:20.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                    height: 40,
                    padding: const EdgeInsets.only(left:0.0,right: 0.0,bottom: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft:Radius.circular(25.0),bottomRight: Radius.circular(25.0)),
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                Container(
                  padding:EdgeInsets.only(top:12.0,right: 12.0,left: 12.0,bottom: 12.0),
                  margin:EdgeInsets.only(right: 12.0,left: 12.0,bottom: 12.0,top: 0),
                  width: double.maxFinite,
                  decoration: BoxDecoration(            
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          ball(currentDoctor.avatar, Colors.transparent),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                currentDoctor.name,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14.0,

                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: 200,
                                child:Text(
                                  currentDoctor.description,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12.0,
                                    color:Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 15.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.chevron_left),
                            ),
                          ),
                          Container(
                            child: Text(
                              'Tomorrow,9 Dec',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            ),
                          ),
                          Container(
                            child: IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.chevron_right),
                            ),
                          ),
                      
                        ],
                      ),
                      SizedBox(height: 15.0,),
                      Container(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(top: 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(width: 1,color: Colors.grey.withOpacity(0.8)),
                                color: Colors.grey[100].withOpacity(0.4),
                              ),
                              child: Wrap(
                                children: _buildChoiceList(morningList),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 6,bottom: 6,left: 16,right: 16,),
                              margin: const EdgeInsets.only(left: 30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                //color: Colors.grey,
                                gradient: LinearGradient(
                                  colors: [Colors.red[200],Colors.blue[200]],
                                  begin: const FractionalOffset(0.0, 0.0),
                                  end: const FractionalOffset(0.5, 0.0),
                                  stops: [0.0,1.0],
                                  tileMode: TileMode.clamp,
                                )
                              ),
                              child: Text(
                                "Morning",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 14),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(top: 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(width: 1,color: Colors.grey.withOpacity(0.8)),
                                color: Colors.grey[100].withOpacity(0.4),
                              ),

                              child:Wrap(
                                children: _buildChoiceList(afternoonList),
                              ), 
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 6,bottom: 6,left: 16,right: 16,),
                              margin: const EdgeInsets.only(left: 30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                //color: Colors.grey,
                                gradient: LinearGradient(
                                  colors: [Colors.lightBlue[200],Colors.lightGreen[200]],
                                  begin: const FractionalOffset(0.0, 0.0),
                                  end: const FractionalOffset(0.5, 0.0),
                                  stops: [0.0,1.0],
                                  tileMode: TileMode.clamp,
                                )
                              ),
                              child: Text(
                                "Afternoon",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 14),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(top: 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(width: 1,color: Colors.grey.withOpacity(0.8)),
                                color: Colors.grey[100].withOpacity(0.4),
                              ),
                              child:Wrap(
                                children: _buildChoiceList(nightList)
                                  
                              ) 
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 6,bottom: 6,left: 16,right: 16,),
                              margin: const EdgeInsets.only(left: 30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                //color: Colors.grey,
                                gradient: LinearGradient(
                                  colors: [Colors.yellow[100],Colors.green[200]],
                                  begin: const FractionalOffset(0.0, 0.0),
                                  end: const FractionalOffset(0.5, 0.0),
                                  stops: [0.0,1.0],
                                  tileMode: TileMode.clamp,
                                )
                              ),
                              child: Text(
                                "Evening & Night",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),    
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Container(
              padding:EdgeInsets.only(right: 0.0,left: 50.0,bottom: 0.0,top: 0),
              margin:EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(width: 1,color: Colors.grey.withOpacity(0.6)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Give Feedback',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                  RaisedButton(
                    elevation: 0,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onPressed: (){
                      Navigator.of(context).pushNamed("/secondeDoctorBook");
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    color: Theme.of(context).accentColor,
                    child:Container(
                      margin: EdgeInsets.only(left: 55.0,right: 55.0,top: 12,bottom: 12),
                      child:Text(
                        'Book',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  )
                ],
              )
            ),
      ),
    );
  }
  Widget ball(String image,Color color){
    return Container(
      height: 60,width: 60.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100.0),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover,)
      ),
    );
  }
  _buildChoiceList(List<String> list) {
    List<Widget> choices = List();    
    list.forEach((item) {
      choices.add(
        Container(
          padding: const EdgeInsets.all(2.0),
          child: ChoiceChip(
            label: Text(item),
            selected: selectedChoice == item,
            onSelected: (selected) {
              setState(() {
                selectedChoice = item;
              });
            },
          ),
        )
      );
    }
    );return choices;
  }
}