import 'package:diu_student/core/constants&variables/variables.dart';
import 'package:diu_student/core/controller/boolean_controller.dart';
import 'package:diu_student/core/resources/information_repository.dart';
import 'package:diu_student/features/routine/presentation/pages/blank_routine.dart';
import 'package:diu_student/features/routine/presentation/pages/manual_routine.dart';
import 'package:diu_student/features/routine/presentation/pages/student_routine.dart';
import 'package:diu_student/features/routine/presentation/pages/teacher_routine.dart';
import 'package:diu_student/features/routine/presentation/widgets/custom_button.dart';
import 'package:diu_student/features/routine/presentation/widgets/department_chooser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../navbar/presentation/pages/NavBar.dart';
import '../widgets/card_button.dart';

class RoutinePage extends StatefulWidget {
  const RoutinePage({super.key});

  @override
  State<RoutinePage> createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {
  BooleanController studentController = BooleanController();
  BooleanController teacherController = BooleanController();
  BooleanController emptyController   = BooleanController();
  BooleanController manualController  = BooleanController();



  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;


    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: (){
                    PersistentNavBarNavigator.pushNewScreen(
                        context,
                        withNavBar: false,
                        screen: NavBar());
                  },
                  color: Colors.black87,
                  icon: Icon(FontAwesomeIcons.barsStaggered)),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              "Search Routine",
            style: Theme.of(context).textTheme.displayLarge
          ),

          SizedBox(height: h*.04, width: w,),

          ChooseDepartment(func: (){
            studentController.setValue(hasFunction);
            teacherController.setValue(hasFunction);
            emptyController.setValue(hasFunction);
            manualController.setValue(hasFunction);
            setState(() {});
          },),

          SizedBox(height: h*.05, width: w,),

          // Container(
          //   child: Wrap(
          //     spacing: w*.07,
          //     runSpacing: w*.07,
          //     children: [
          //     HeroCard(function: (){
          //       Navigator.push(context, MaterialPageRoute(builder: (context)=> StudentRoutine()));
          //     },
          //       tag: "Student",
          //       text: "Student",
          //       icon: FontAwesomeIcons.user,
          //       controller: studentController,),
          //
          //     // SizedBox(height: h*.05, width: w,),
          //
          //     HeroCard(function: (){
          //       Navigator.push(context, MaterialPageRoute(builder: (context)=> TeacherRoutine()));
          //     },
          //       tag: "Teacher",
          //       text: "Teacher",
          //       icon: FontAwesomeIcons.userTie,
          //       controller: teacherController,),
          //
          //     // SizedBox(height: h*.05, width: w,),
          //
          //     HeroCard(function: (){
          //       Navigator.push(context, MaterialPageRoute(builder: (context)=> EmptySlots()));
          //     },
          //       tag: "Empty Slots",
          //       text: "Empty Slots",
          //       icon: FontAwesomeIcons.file,
          //       controller: emptyController,),
          //
          //     // SizedBox(height: h*.05, width: w,),
          //
          //     HeroCard(function: (){
          //       Navigator.push(context, MaterialPageRoute(builder: (context)=> ManualRoutine()));
          //     },
          //       tag: "Manual",
          //       text: "Manual",
          //       icon: FontAwesomeIcons.sliders,
          //       controller: manualController,),
          //   ],),
          // ),


          HeroButton(function: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> StudentRoutine()));
          },
            tag: "Student",
            text: "Student",
            icon: FontAwesomeIcons.user,
            controller: studentController,),

          SizedBox(height: h*.05, width: w,),

          HeroButton(function: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> TeacherRoutine()));
          },
            tag: "Teacher",
            text: "Teacher",
            icon: FontAwesomeIcons.userTie,
            controller: teacherController,),

          SizedBox(height: h*.05, width: w,),

          HeroButton(function: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> EmptySlots()));
          },
            tag: "Empty Slots",
            text: "Empty Slots",
            icon: FontAwesomeIcons.file,
            controller: emptyController,),

          SizedBox(height: h*.05, width: w,),

          HeroButton(function: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ManualRoutine()));
          },
            tag: "Manual",
            text: "Manual",
            icon: FontAwesomeIcons.sliders,
            controller: manualController,),

        ],
      ),
    );
  }
}
