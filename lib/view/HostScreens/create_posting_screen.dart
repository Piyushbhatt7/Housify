import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  final List<String> residenceTypes = [
    'Detatched House',
    'Villa',
    'Apartment',
    'Condo',
    'Flat',
    'Town House',
    'Studio',
  ];

  String residenceTypesSelected = "";
  

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                    // Listing name
                      Padding(
                        padding: EdgeInsets.only(top: 1.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Listing name"
                          ),
                          style: TextStyle(
                            fontSize: 25.0
                          ),

                          controller: _nameTextEditingController,
                          validator: (textInput) {
                              
                              if(textInput!.isEmpty)
                              {
                                return "please enter valid name";
                              }

                              return null;
                          },
                        ),
                      
                      ),
                   
                     // Select property type
                   
                     Padding(
                      padding: EdgeInsets.only(top: 28.0),
                      child: DropdownButton(
                        items: residenceTypes.map((item)
                        {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )
                            );
                        }).toList(), 
                        onChanged: (valueItem)
                        {
                           setState(() {
                             residenceTypesSelected = valueItem.toString();
                           });
                        },

                        isExpanded: true,
                        value: residenceTypesSelected,
                        hint: Text(
                          "Selected property type",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        
                        ),
                     ),
                   
                    // Price
                   
                   Padding(
                     padding: EdgeInsets.only(top: 21.0),

                     child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                          
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "Price",
                              ),
                              style: TextStyle(
                                fontSize: 25.0,
                              ),
                              keyboardType: TextInputType.number,
                              controller: _priceTextEditingController,
                              validator: (text) {
                                 if(text!.isEmpty)
                                 {
                                  return "please enter a valid price";
                                 }
                                 return null;
                              },
                            ),
                          
                          ),

                          const Padding(
                            padding: EdgeInsets.only(
                              left: 10.0, bottom: 10.0,
                            ),

                            child: Text(
                              "\$ / night",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          
                          ),
                      ],
                     ),
                   
                   ),
                   
                    
                    // Description

                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Description",
                        ),
                        style: TextStyle(
                          fontSize: 25.0,

                        ),

                        controller: _descriptionTextEditingController,
                        maxLines: 1,
                        minLines: 1,
                        validator: (text) {
                           
                           if(text!.isEmpty)
                           {
                            return "please enter a valid description";
                           }

                           return null;
                        },
                      ),
                    
                    )
                    ],
                  )
                  
                ),
              ],
            ),
            ),
        ),
      ),
   
   
    );
  }
}