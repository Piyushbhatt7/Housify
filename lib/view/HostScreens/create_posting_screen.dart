import 'package:flutter/material.dart';

class CreatePostingScreen extends StatefulWidget {
  const CreatePostingScreen({super.key});

  @override
  State<CreatePostingScreen> createState() => _CreatePostingScreenState();
}

class _CreatePostingScreenState extends State<CreatePostingScreen> {

  final formKey = GlobalKey<FormState>();

  TextEditingController _nameTextEditingController = TextEditingController();
  TextEditingController _priceTextEditingController = TextEditingController();
  TextEditingController _descriptionTextEditingController = TextEditingController();
  TextEditingController _addressTextEditingController = TextEditingController();
  TextEditingController _cityTextEditingController = TextEditingController();
  TextEditingController _countryTextEditingController = TextEditingController();
  TextEditingController _amenitiesTextEditingController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.pinkAccent,
                Colors.amber,
              ],
                 
                 begin: FractionalOffset(0.0, 0.0),
                 end: FractionalOffset(1.0, 0.0),
                 stops: [0.0, 1.0],
                 tileMode: TileMode.clamp,
            ),
          ),
        ),
        
        title: Text(
          "Create / Update a Posting",
          style: TextStyle(
            color: Colors.white
          ),
        ),

        actions: [
          IconButton(onPressed: ()
          {

          }, icon: const Icon(Icons.upload)
          )
        ],
      ),
      

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(26, 26, 26, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Form(
                  key: formKey,
                  child: 
                  
                )
              ],
            ),
            ),
        ),
      ),
   
   
    );
  }
}