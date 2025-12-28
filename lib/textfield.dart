


import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final bool isPassword;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.label,
    required this.isPassword,
    required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextField();
}

class _CustomTextField extends State<CustomTextField> {
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
   
    if (!widget.isPassword) obscureText = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 234),
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w900,
              color: Color(0xff7eaf96),
              
            ),textAlign: TextAlign.start,
            
          ),
        ),
        SizedBox(
          height: 50,
          child: Container(
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white,border: BoxBorder.all(width: 2,color: Color(0xff7eaf96))),
            child: TextFormField(
              controller: widget.controller,
              obscureText: obscureText,
              validator: (value) {
                if (value!.isEmpty) return "The field is empty";
                if (widget.isPassword && value.length < 8) {
                  return "Please enter a password with at least 8 characters";
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 15,
                ),
                border: InputBorder.none,
                suffixIcon: widget.isPassword ?
                IconButton( icon: Icon(obscureText? Icons.visibility_off:Icons.visibility,color: Color(0xff7eaf96),),onPressed: (){
                  setState(() {
                    obscureText=!obscureText;
                  });
                })
                :null
              ),
            ),
          ),
        ),
      ],
    );
  }
}
