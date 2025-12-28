import 'package:flutter/material.dart';

class ChooseType extends StatelessWidget {
  const ChooseType({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xff2c4728),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 115, right: 115.32,bottom: 40),
            child: Text(("Join As "),style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color:Colors.white),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 280,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: BoxBorder.all(
                  width: 2,
                  color: Colors.black,
                  style: BorderStyle.solid,
                )
                
              ),
              child: Column(
                children: [
                  Row(
                    spacing: 16,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20,left: 30,),
                        child: Container(
                          
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            border: BoxBorder.all(
                              width: 2,
                              color: Color(0xff2c4728)
                            )
                          ),
                          child: CircleAvatar(
                            
                            radius: 35,
                            backgroundImage: AssetImage("assets/tt.jpg"),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(("Tenant"),style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Color(0xff2c4728)),),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(("Find Your new home,manager your lease,and connect with landlords"),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Color(0xff2c4728)),textAlign: TextAlign.center,),
                  ),
                  Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xff2c4728)

                    ),
                    child: Center(
                      child: Text(("Get Started AS Tenant"),style: 
                      TextStyle(fontSize: 21,fontWeight: FontWeight.w700,color: Colors.white)),
                    ),
                  )
                ],
              ),
            ),
          ),
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 280,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: BoxBorder.all(
                  width: 2,
                  color: Colors.black,
                  style: BorderStyle.solid,
                )
                
              ),
              child: Column(
                children: [
                  Row(
                    spacing: 16,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20,left: 30,),
                        child: Container(
                          
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            border: BoxBorder.all(
                              width: 2,
                              color: Color(0xff2c4728)
                            )
                          ),
                          child: CircleAvatar(
                            
                            radius: 35,
                            backgroundImage: AssetImage("assets/lod.jpg"),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(("Landlord"),style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Color(0xff2c4728)),),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(("Manage Properties ,collect rent,and communicate with tenants"),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Color(0xff2c4728)),textAlign: TextAlign.center,),
                  ),
                  Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xff2c4728)

                    ),
                    child: Center(
                      child: Text(("Get Started AS Landlord"),style: 
                      TextStyle(fontSize: 21,fontWeight: FontWeight.w700,color: Colors.white)),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}