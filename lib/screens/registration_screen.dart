import 'package:employe_attendence/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0,
      ),
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              height: screenHight / 4,
              width: screenWidth,
              decoration:  BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(70)
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.qr_code_scanner,
                    color: Colors.white,
                    size: 80,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "AIMERS",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 50,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        label: Text('Employee Email ID'),
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                      controller: _emailController,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        label: Text('Password'),
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                      ),
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    SizedBox(height: 30,),
                    Consumer<AuthService>(
                      builder: (context,authServiceProvider,child){
                        return SizedBox (
                          height: 60,
                          width: double.infinity,
                          child: authServiceProvider.isLoading ? const Center(
                            child: CircularProgressIndicator(),
                          ) : ElevatedButton(
                            onPressed: (){
                              authServiceProvider.registerEmployee(
                               _emailController.text.trim(),
                                _passwordController.text.trim(),
                                context
                              );
                            }, style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              )
                          ),child: Text("REGISTER", style: TextStyle(fontSize: 20)),

                          ),
                        );
                      },
                    ),
                  ]
              ),
            )
          ],
        )
    );
  }
}
