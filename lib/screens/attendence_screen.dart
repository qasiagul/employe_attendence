import 'package:employe_attendence/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_act/slide_to_act.dart';

class AttendenceScreen extends StatefulWidget {
  const AttendenceScreen({super.key});

  @override
  State<AttendenceScreen> createState() => AttendenceScreenState();
}

class AttendenceScreenState extends State<AttendenceScreen> {
  final GlobalKey<SlideActionState> Key = GlobalKey<SlideActionState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin:  EdgeInsets.only(top: 32),
              child: Text(
                "Welcome",
                style: TextStyle(color: Colors.black54,fontSize: 30),
              ),
            ),
            // Consumer<DbService>(builder: (context,dbService,child){
            //   return FutureBuilder(
            //       future: dbService.getUserData(),
            //       builder: (context,snapshot){
            //
            //         UserModel user = snapshot.data;
            //
            //         if (snapshot.hasData){
            //           return  Container(
            //             alignment: Alignment.centerLeft,
            //             child: Text(
            //               user.name != '' ? user.name : "${user.employeeId}",
            //               style: TextStyle(fontSize: 25),
            //             ),
            //           );
            //         }
            //         return const SizedBox(width: 60,child: LinearProgressIndicator(),);
            //       });
            // }),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top : 32),
              child: Text(
                "Today Status",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12, bottom: 32),
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(2, 2)
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Check In",style: TextStyle(fontSize: 20,color: Colors.black54),),
                          SizedBox(width: 80,child: Divider(),),
                          Text("00:30",style: TextStyle(fontSize: 25),)
                        ],
                      )
                  ),
                  Expanded(
                      child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Check In",style: TextStyle(fontSize: 20,color: Colors.black54),),
                          SizedBox(width: 80,child: Divider(),),
                          Text("--/--",style: TextStyle(fontSize: 25),)
                        ],
                      )
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                DateFormat("dd MMMM yyyy").format(DateTime.now()),
                style: TextStyle(fontSize: 20),),
            ),
            StreamBuilder<Object>(
                stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                return Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    DateFormat("hh:mm:ss a").format(DateTime.now()),
                    style: TextStyle(fontSize: 15,color: Colors.black54),),
                );
              }
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              child: Builder(builder: (context){
                return SlideAction(
                  text: "Slide to Check Out",
                  textStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                  outerColor: Colors.white,
                  innerColor:Colors.redAccent,
                  key: Key,
                  onSubmit: (){
                    Key.currentState!.reset();
                  },
                );
              }),
            )
          ],
        ),
      )
    );
  }
}
