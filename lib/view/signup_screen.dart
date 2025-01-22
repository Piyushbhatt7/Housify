import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController =
  TextEditingController();
  TextEditingController _firstNameTextEditingController =
    TextEditingController();
  TextEditingController _lastNameTextEditingController =
      TextEditingController();
  TextEditingController _cityTextEditingController = TextEditingController();
  TextEditingController _countryTextEditingController = TextEditingController();
  TextEditingController _bioTextEditingController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.pinkAccent,
              Colors.amberAccent,
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          )),
        ),
        title: Text(
          "Create New Account",
          style: TextStyle(color: Colors.white,
          
          ),
        ),
      ),

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

            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25,),
              child: Image.asset("images/signup.png",
              width: 240, 
              ),
            ),

            const Text("Tell us about you:", style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
            textAlign: TextAlign.center,
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    
                     Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Email",
                              ),
                              style:  const TextStyle(
                                fontSize: 25,
                              ),
                              controller: _emailTextEditingController,
                              validator: (text) {
                            
                                if(text!.isEmpty)
                                
                                {
                                    return "Please write valid email";   
                                }
                            
                                    return null; 
                              },
                            ),
                    
                          ),

                          Padding(
                            padding:  EdgeInsets.only(top: 20.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Password",
                              ),
                              style:  const TextStyle(
                                fontSize: 24,
                              ),
                              controller: _passwordTextEditingController,
                              obscureText: true,
                              validator: (valuePassword) {
                            
                                if(valuePassword!.length < 6 )
                                
                                {
                                    return "Password must be atleast 6 or more characters";   
                                }
                            
                                    return null; 
                              },
                            ),
                    
                          ),

                          Padding(
                            padding:  EdgeInsets.only(top: 21.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: "FirstName",
                              ),
                              style:  const TextStyle(
                                fontSize: 24,
                              ),
                              controller: _firstNameTextEditingController,
                              obscureText: true,
                              validator: (valueFirstName) {
                            
                                if(valueFirstName!.isEmpty )
                                
                                {
                                    return "Please write your first name";   
                                }
                            
                                    return null; 
                              },
                              textCapitalization: TextCapitalization.words,
                            ),
                    
                          ),

                          Padding(
                            padding:  EdgeInsets.only(top: 21.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: "LastName",
                              ),
                              style:  const TextStyle(
                                fontSize: 24,
                              ),
                              controller: _passwordTextEditingController,
                              obscureText: true,
                              validator: (valuePassword) {
                            
                                if(valuePassword!.length < 6 )
                                
                                {
                                    return "Password must be atleast 6 or more characters";   
                                }
                            
                                    return null; 
                              },
                            ),
                    
                          ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
