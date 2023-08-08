import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_user_side/screen/controller/home_controller.dart';
import 'package:firebase_user_side/screen/model/product_model.dart';
import 'package:firebase_user_side/utils/firebase_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  homeController controller = homeController();
  @override
  Widget build(BuildContext context) {
    fireBase_Helper fbh = fireBase_Helper();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff1F2125),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                CupertinoIcons.bag,
                color: Colors.white,
              ),
            )
          ],
          title: Text(
            'PixelsCo.',
            style: GoogleFonts.aBeeZee(color: Colors.white),
          ),
        ),
        backgroundColor: Color(0xff1F2125),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: StreamBuilder(

            stream: fbh.readFireBaseData(), builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {


    if (snapshot.hasError) {
    return Text("${snapshot.error}");
    }
    else if (snapshot.hasData) {
    QuerySnapshot querySnapshot = snapshot.data!;
    List<QueryDocumentSnapshot> qdocList = querySnapshot.docs;
    // Map? MapData = {};
    List<productModel> productDataList = [];
    controller.data = productDataList;
    for (var x in qdocList) {
    Map MapData = x.data() as Map;
    // MapData = x.data() as Map;
    String id = x.id;
    String name = MapData['name'];
    String price = MapData['price'];
    String description = MapData['description'];
    String offer = MapData['offer'];
    String category = MapData['category'];
    String size = MapData['size'];
    String image = MapData['image'];
    productModel model = productModel(
    pprice: price,
    psize: size,
    poffer: offer,
    pcateg: category,
    pdesc: description,
    id: id,
    pname: name,
    img: image);
    productDataList.add(model);
    }
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              Color(0xff3C4049),
              Color(0xff24272C),
            ]),
          ),
          child: Row(
            children: [
              SizedBox(width: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Now Best\nCollection",
                        style: GoogleFonts.aBeeZee(
                            color: Colors.white, fontSize: 30),
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      child: Center(
                          child: Text(
                            "Explore Now",
                            style: GoogleFonts.aBeeZee(
                                color: Colors.white, fontSize: 15),
                          )),
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Color(0xff818387)),
                        borderRadius: BorderRadius.circular(23),
                        gradient: LinearGradient(colors: [
                          Color(0xff24272C),
                          Color(0xff3C4049),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 160,
                      width: 100,
                      child: Image.asset(
                          'assets/images/mobile1.png'),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 30)
            ],
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Popular",
                style: GoogleFonts.aBeeZee(
                    color: Colors.white, fontSize: 22),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Expanded(
          child: GridView.builder(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: () {
                      productModel model = productModel(id: productDataList[index].id,img: productDataList[index].img,pcateg: productDataList[index].pcateg,pdesc: productDataList[index].pdesc,pname: productDataList[index].pname,poffer: productDataList[index].poffer,pprice: productDataList[index].pprice,psize: productDataList[index].psize);
                      Get.toNamed('viewProduct',arguments: model);
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(
                                      2.0),
                                  child: Icon(
                                    CupertinoIcons.star_fill,
                                    color: Colors.amber,
                                    size: 13,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(
                                      2.0),
                                  child: Text(
                                    "4.5",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 13,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: 60,
                              width: 60,
                              child: Image.network(
                                  "${productDataList[index].img}")),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                Text(
                                  "${productDataList[index].pname }",
                                  style: GoogleFonts.aBeeZee(
                                      color: Colors.white,
                                      fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                Text(
                                  "₹ ${productDataList[index].pprice}",
                                  style: GoogleFonts.aBeeZee(
                                      color: Colors.white,
                                      fontSize: 17),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(
                                      8.0),
                                  child: Container(
                                    child: Icon(
                                      CupertinoIcons.arrow_right,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                    height: 22,
                                    width: 22,
                                    decoration: BoxDecoration(
                                        color: Color(0xff1e2024),
                                        borderRadius:
                                        BorderRadius.circular(4)),
                                  ),
                                ),
                                SizedBox(width: 5),
                              ],
                            ),
                          ),
                        ],
                      ),
                      height: 300,
                      width: 180,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff24272C),
                              Color(0xff3C4049),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                );
              },
              itemCount: productDataList.length),
        ),
      ],
    );
    }
    return Center(
    child: CircularProgressIndicator(
    color: Colors.black,
    ));
    },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          selectedIconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff1F2125),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
