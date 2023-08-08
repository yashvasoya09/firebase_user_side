import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/home_controller.dart';
import '../model/product_model.dart';

class viewProductScreen extends StatefulWidget {
  const viewProductScreen({super.key});

  @override
  State<viewProductScreen> createState() => _viewProductScreenState();
}

class _viewProductScreenState extends State<viewProductScreen> {
  @override
  productModel data = Get.arguments;
  homeController controller = Get.put(homeController());

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1F2125),
        body: SingleChildScrollView (
          child: Column(
            children: [
              Container(
                child: Image.network("${data.img}"),
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff151618),
                      Color(0xff25262A),

                    ],

                  ),
                ),
                ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${data.pname}",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("₹ ${data.pprice}",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 26,fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(CupertinoIcons.star_fill,color: Colors.amber,size: 18,),
                    ),
                    Text("4.5",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w300)),
                    SizedBox(width: 7),
                    Text("(1.2K reviews)",style: GoogleFonts.aBeeZee(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w200)),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisis tellus, est lacus arcu ut ac fermentum. Sit eget proin nunc felis quam rutrum metus. lacus,  vel et arcu ut adipiscing morbi eget. At arcu varius ullamcorper eu varius. Et lacus, maecenas vel et arcu ut adipiscing morbi eget. ",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w100)),
                  height: 160,width: double.infinity),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      child: Center(
                          child: Icon(CupertinoIcons.bookmark_solid,color: Colors.white,)),
                      height: 65,
                      width: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.7, color: Color(0xff818387)),
                        borderRadius: BorderRadius.circular(23),
                        gradient: LinearGradient(colors: [
                          Color(0xff24272C),
                          Color(0xff3C4049),
                        ]),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Center(
                            child:                  Text("Add To Bag",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w300)),
                        ),
                        height: 65,
                        width: 240,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.7, color: Color(0xff818387)),
                          borderRadius: BorderRadius.circular(23),
                          gradient: LinearGradient(colors: [
                            Color(0xff24272C),
                            Color(0xff3C4049),
                          ]),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
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
