import 'package:diu_student/features/navbar/presentation/pages/profileEdit.dart';
import 'package:diu_student/features/navbar/presentation/widgets/developer_info.dart';
import 'package:diu_student/features/navbar/presentation/widgets/user_info_show.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';

import '../../../../core/util/widgets/custom_alert_box.dart';
import '../../../authentication/presentation/pages/login.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    bool horizontal = h > w;

    void signOut() {
      showDialog(
          context: context,
          builder: (context) => CustomAlertBox(
              text: "Want to log out?",
              function: () {
                Box _box = Hive.box("routine_box");
                _box.clear();
                FirebaseAuth.instance.signOut();

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Logged Out'),
                ));

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => loginScreen()));
              }));
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: h * .05,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(FontAwesomeIcons.xmark))
                  ],
                ),
              ),

              SizedBox(
                height: h * .02,
              ),

              const UserInfoShow(),

              SizedBox(
                height: h * .008,
              ),

              SizedBox(
                width: horizontal ? w * .9 : h * .9,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditProfile()));
                  },
                  style: ButtonStyle(
                      elevation: const WidgetStatePropertyAll(8),
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.teal.shade50)),
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Madimi",
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: h * .02,
              ),

              Divider(
                thickness: 2,
              ),

              SizedBox(
                height: h * .02,
              ),

              Container(
                width: w * .9,
                height: h * .65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.teal.shade50,
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 20,
                          spreadRadius: -10,
                          offset: Offset(2, 5))
                    ]),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: SingleChildScrollView(
                    child: horizontal
                        ? Column(
                            children: [
                              const Text(
                                "Developers",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Madimi",
                                ),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                height: h * .02,
                              ),
                              const DeveloperInfo(
                                  name: "Md. Muntasir Hossain",
                                  linkedinURL:
                                      "https://www.linkedin.com/in/muntasir27/",
                                  githubURL: "https://github.com/MdMuntasir",
                                  portfolioURL:
                                      "https://muntasir.infinityfreeapp.com/",
                                  telegramURL: "https://t.me/muntasir27",
                                  imagePath: "assets/images/Muntasir1.jpg"),
                              SizedBox(
                                height: h * .02,
                              ),
                              const DeveloperInfo(
                                  name: "Imranul Islam Shihab",
                                  linkedinURL:
                                      "https://www.linkedin.com/in/imransihab0/",
                                  githubURL: "https://github.com/imransihab0",
                                  portfolioURL:
                                      "https://imransihab.wordpress.com",
                                  telegramURL: "https://t.me/imransihab0",
                                  imagePath: "assets/images/Shihab.jpeg"),
                            ],
                          )
                        : Column(
                            children: [
                              const Text(
                                "Developers",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Madimi",
                                ),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                height: h * .02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const DeveloperInfo(
                                      name: "Md. Muntasir Hossain",
                                      linkedinURL:
                                          "https://www.linkedin.com/in/muntasir27/",
                                      githubURL:
                                          "https://github.com/MdMuntasir",
                                      portfolioURL:
                                          "https://live-mdmuntasir.pantheonsite.io",
                                      telegramURL: "https://t.me/muntasir27",
                                      imagePath: "assets/images/muntasir.jpg"),
                                  SizedBox(
                                    width: w * .08,
                                  ),
                                  const DeveloperInfo(
                                      name: "Imranul Islam Shihab",
                                      linkedinURL:
                                          "https://www.linkedin.com/in/imransihab0/",
                                      githubURL:
                                          "https://github.com/imransihab0",
                                      portfolioURL:
                                          "https://imransihab.wordpress.com",
                                      telegramURL: "https://t.me/imransihab0",
                                      imagePath: "assets/images/Shihab.jpeg"),
                                ],
                              ),
                              SizedBox(
                                height: h * .02,
                              ),
                            ],
                          ),
                  ),
                ),
              ),

              SizedBox(
                height: h * .02,
              ),

              Divider(
                thickness: 2,
              ),

              SizedBox(
                height: h * .02,
              ),

              // Container(
              //   width: w*.9,
              //   height: h*.2,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.all(Radius.circular(20)),
              //       color: Colors.teal.shade50,
              //       boxShadow: const [BoxShadow(
              //           blurRadius: 20,
              //           spreadRadius: -10,
              //           offset: Offset(2,5)
              //       )]
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              //     child: SingleChildScrollView(
              //       child: Column(
              //         children: [
              //
              //           const Text(
              //             "Contact Info",
              //             style: TextStyle(
              //               color: Colors.black,
              //               fontSize: 25,
              //               fontWeight: FontWeight.bold,
              //               fontFamily: "Madimi",
              //             ),
              //             textAlign: TextAlign.start,
              //           ),
              //
              //           SizedBox(height: h*.02,),
              //
              //           const Text(
              //             "+8801994587266",
              //             style: TextStyle(
              //                 fontWeight: FontWeight.w400,
              //                 fontSize: 18,
              //                 fontFamily: "Madimi"
              //             ),
              //           ),
              //
              //           SizedBox(height: h*.02,),
              //
              //           const Text(
              //             "+8801994587266",
              //             style: TextStyle(
              //                 fontWeight: FontWeight.w400,
              //                 fontSize: 18,
              //                 fontFamily: "Madimi"
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              //
              //
              // SizedBox(height: h*.02,),
              //
              // Divider(thickness: 2,),
              //
              // SizedBox(height: h*.02,),

              SizedBox(
                width: horizontal ? w * .9 : h * .9,
                child: ElevatedButton(
                  onPressed: signOut,
                  style: ButtonStyle(
                      elevation: const WidgetStatePropertyAll(8),
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.teal.shade50)),
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Madimi",
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: h * .05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
