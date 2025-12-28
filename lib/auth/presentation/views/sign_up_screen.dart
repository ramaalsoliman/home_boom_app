/*import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
   late TextEditingController firstname;
    late TextEditingController lastname;
    late TextEditingController date;
     @override
  void initState() {
    firstname = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    firstname.dispose();
    super.dispose();
  }
    

    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
     
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80,left: 90,right: 67),
            child: Text(("Sing Up"),style: TextStyle(fontSize: 32,fontWeight: FontWeight.w900,color: Color(0xff2c4728)),),
          ),
           Padding(
            padding: const EdgeInsets.only(top: 15,left: 90,right: 67),
            child: Text(("Create an account,It's free"),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Color(0xff2c4728)),),
          ),
         /*SizedBox(
          width: 300,
          height: 300,

          child:Image.asset("assets/mmm.jpg",fit: BoxFit.cover,),),*/
          // Image(image: AssetImage("assets/mmm.jpg"))),
         Container(
          margin: EdgeInsets.only(top: 30,left: 20),
          height: 50,
          width: 350,
           child: TextField(
            controller: firstname,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                
              ),
                 hintStyle: TextStyle(fontSize: 20),
                  label: Text(("Enter your first name"),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),)
           
            ),
             onChanged: (String value) {
                      print(firstname.text);
                      setState(() {});
                }
           
           ),
         ),
         
          
            Container(
              margin: EdgeInsets.only(
                top: 15,left: 20
              ),
            height: 50,
            width: 350,
             child: TextField(
              controller: firstname,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  
                ),
                   hintStyle: TextStyle(fontSize: 20),
                    label: Text(("Enter your last name"),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),)
             
              ),
               onChanged: (String value) {
                        print(firstname.text);
                        setState(() {});
                  }
             
             ),
           ),
            Container(
              margin: EdgeInsets.only(
                top: 15,left: 20
              ),
            height: 50,
            width: 350,
             child: TextField(
              controller: firstname,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  
                ),
                   hintStyle: TextStyle(fontSize: 20),
                    label: Text(("Enter your date"),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),)
             
              ),
               onChanged: (String value) {
                        print(firstname.text);
                        setState(() {});
                  }
             
             ),
           ),
         
          



        ],
      ),
    );
  }
}*/
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/auth/presentation/manage/cubit_auth.dart';
import 'package:home_boom_app/auth/presentation/manage/state_auth.dart';
import 'package:home_boom_app/auth/presentation/views/login_screen.dart';
import 'package:home_boom_app/textfield.dart';
import 'package:home_boom_app/view/choose_type.dart';
import 'package:home_boom_app/Apartments/presentation/views/page_for_tenant.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  File? pickedImage;
  File? idImage;
  final ImagePicker _picker = ImagePicker();

  final Dio dio = Dio();
  late TextEditingController firstname;
  late TextEditingController lastname;
  late TextEditingController birthday;
  late TextEditingController phoneNumber;
  late TextEditingController password;
  late TextEditingController password_confirmation;
  String selectedRole = "tenant";
  GlobalKey<FormState> form1 = GlobalKey();

  @override
  void initState() {
    firstname = TextEditingController();
    lastname = TextEditingController();
    birthday = TextEditingController();
    phoneNumber = TextEditingController();
    password = TextEditingController();
    password_confirmation = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    firstname.dispose();
    lastname.dispose();
    birthday.dispose();
    password.dispose();
    password_confirmation.dispose();
    phoneNumber.dispose();
    super.dispose();
  }

  void _showDatePicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 250,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime.now(),
            minimumYear: 1900,
            maximumYear: 2100,
            onDateTimeChanged: (value) {
              String formatted =
                  "${value.year.toString().padLeft(4, '0')}-"
                  "${value.month.toString().padLeft(2, '0')}-"
                  "${value.day.toString().padLeft(2, '0')}";
              setState(() {
                birthday.text = formatted;
              });
            },
          ),
        );
      },
    );
  }

  Future<void> pickProfileImage() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) setState(() => pickedImage = File(picked.path));
  }

  Future<void> pickIdImage() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) setState(() => idImage = File(picked.path));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CubitAuth, StateAuth>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          if (state.user.active == "no") {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Your account is awaiting admin approval. Please wait.",
                ),
                duration: Duration(seconds: 5),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Account created successfully"),
                duration: Duration(seconds: 5),
              ),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const PageForTenant()),
            );
          }
        } else if (state is AuthFauiler) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Color.fromARGB(255, 201, 66, 57)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 32),
          child: ListView(
            children: [
              Form(
                key: form1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Create your account now",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff7eaf96),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "Create your account to continue to your apartments",
                      style: TextStyle(color: Color(0xff7eaf96)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        pickProfileImage;
                      },
                      child: CircleAvatar(
                        child:IconButton(
                        icon: const Icon(Icons.image),
                        onPressed: pickProfileImage,
                      ),
                      
                      ),
                    ),
                   /* IconButton(
                      icon: const Icon(Icons.image),
                      onPressed: pickProfileImage,
                    ),*/
                    if (pickedImage != null)
                      Image.file(pickedImage!, width: 80, height: 80),

                    SizedBox(height: 10),
                    const Text("Profile Image"),
                    SizedBox(height: 20),
                    CustomTextField(
                      label: "first name",
                      isPassword: false,
                      controller: firstname,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      label: "last name",
                      isPassword: false,
                      controller: lastname,
                    ),
                    SizedBox(height: 20),
                    Container(
                   
                      margin: EdgeInsets.only(top: 15, left: 20),
                     
                  
                      child: TextField(
                        controller: birthday,
                        readOnly: true,
                        onTap: _showDatePicker,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50))
                          ),
                          
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: Color(0xff7eaf96),
                              width: 2,
                            ),
                          ),
                          label: Text(
                            "Enter your date",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff7eaf96),
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.calendar_month,
                            color: Color(0xff7eaf96),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      label: "phone number",
                      isPassword: false,
                      controller: phoneNumber,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      label: "password",
                      isPassword: true,
                      controller: password,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      label: "password confirmation",
                      isPassword: true,
                      controller: password_confirmation,
                    ),
                    SizedBox(height: 20),
                    const Text("Id Image "),
                    const SizedBox(height: 10),
                    IconButton(
                      icon: const Icon(Icons.image),
                      onPressed: pickIdImage,
                    ),
                    if (idImage != null)
                      Image.file(idImage!, width: 80, height: 80),
                    DropdownButtonFormField<String>(
                  
                      value: selectedRole,
                      items: const [
                        DropdownMenuItem(
                          value: "landlord",
                          child: Text("Landlord"),
                        ),
                        DropdownMenuItem(
                          value: "tenant",
                          child: Text("Tenant"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedRole = value!;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: "Select Role",hoverColor: Color(0xff7eaf96),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    BlocBuilder<CubitAuth, StateAuth>(
                      builder: (context, state) {
                        bool isloading = state is AuthLoading;

                        return ElevatedButton(
                          onPressed: isloading
                              ? null
                              : () {
                                  if (form1.currentState!.validate()) {
                                    if (pickedImage == null ||
                                        idImage == null) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "Please pick profile and ID images",
                                          ),
                                          backgroundColor: Color.fromARGB(255, 201, 66, 57),
                                        ),
                                      );
                                      return;
                                    }
                                    Map<String, dynamic> data = {
                                      "firstname": firstname.text,
                                      "lastname": lastname.text,
                                      "number_phone": phoneNumber.text,
                                      "birthday": birthday.text,
                                      "password": password.text,
                                      "password_confirmation":
                                          password_confirmation.text,
                                      "role": selectedRole,
                                    };
                                    BlocProvider.of<CubitAuth>(
                                      context,
                                    ).register(
                                      data: data,
                                      profileImage: pickedImage!,
                                      idImage: idImage!,
                                    );
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff7eaf96),
                            //  maximumSize: const Size(double.infinity,100),
                            fixedSize: Size(200, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: isloading
                              ? const SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 3,
                                  ),
                                )
                              : const Text(
                                  ("SignUp"),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
