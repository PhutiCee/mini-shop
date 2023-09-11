import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_shop/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Banner image
          const Padding(
            padding: EdgeInsets.only(left: 80.0,right: 80, top: 200),
            child: Icon(Icons.shopping_cart, size: 150,),
          ),
          // const SizedBox(height: 20),

          //Welcome Message
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Push", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue ),),
              Text("IT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            ],
          ),
          const SizedBox(height: 50),

          //Message
          Text("CodeTechX", style: GoogleFonts.notoSerif( fontSize: 15),),

          const Spacer(),

          //Get Started Button
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return const HomePage();
              }));
            },
            child: Container(
              width: 300,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.green,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 80.0),
                    child: Text("Get Started", style: TextStyle(color: Colors.white, fontSize: 17),),
                  ),
                  Icon(Icons.arrow_forward)
                ],
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
