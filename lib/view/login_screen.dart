import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

 final _formkey = GlobalKey<FormState>();
 TextEditingController _emailTextEditingController = TextEditingController();
 TextEditingController _passwordTextEditingController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.pinkAccent,
            Colors.amberAccent,
          ],
          begin: FractionalOffset(0, 0),
          end: FractionalOffset(1, 0),
          stops: [0, 1],
          tileMode: TileMode.clamp,
        )),
        child: ListView(
          children: [
            Image.asset("images/logo.png"),
               
                const Text(
                    "hello friend, \nWelcome back",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        letterSpacing: 3,
                        color: Colors.white
                    ),
                  ),

                  Form(
                    key: _formkey,
                    child: Column(
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(top: 26.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Email",
                            ),
                            style:  const TextStyle(
                              fontSize: 24,
                            ),
                            controller: _emailTextEditingController,
                            validator: (valueEmail) {
                          
                              if(!valueEmail!.contains("@"))
                              
                              {
                                  return "Please write valid email";   
                              }
                          
                                  return null; 
                            },
                          ),

                        ),

                           Padding(
                          padding:  EdgeInsets.only(top: 21.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Password",
                            ),
                            style:  const TextStyle(
                              fontSize: 24,
                            ),
                            controller: _passwordTextEditingController,
                            validator: (valuePassword) {
                          
                              if(valuePassword!.length < 6 )
                              
                              {
                                  return "Password must be atleast 6 or more characters";   
                              }
                          
                                  return null; 
                            },
                          ),

                        ),

                        ElevatedButton(
                          onPressed: ()
                        {

                        }, 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue
                        ),
                        
                        child: const Text("Login", style: TextStyle(fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.bold),)
                        
                        )
                        
                      ],
                    ),
                       

                  )
          ],
        ),
      )
    );
  }
}