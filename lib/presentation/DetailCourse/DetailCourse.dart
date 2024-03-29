import 'package:advanced_mobileapp_development/presentation/Courses/course.dart';
import 'package:advanced_mobileapp_development/presentation/DetailCourse/overView.dart';
import 'package:advanced_mobileapp_development/presentation/DetailTutor/infoDetail.dart';
import 'package:advanced_mobileapp_development/presentation/DetailTutor/listReview.dart';
import 'package:advanced_mobileapp_development/presentation/DetailTutor/videoIntro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:expandable_text/expandable_text.dart';

class DetailCourse extends StatefulWidget {
  const DetailCourse({super.key});

  @override
  State<DetailCourse> createState() => _DetailCourseState();
}

class _DetailCourseState extends State<DetailCourse> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
              const Size.fromHeight(50.0), // Define the height of the AppBar
          child: Container(
            decoration: BoxDecoration(color: Colors.blueAccent, boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withOpacity(0.1), // Color and opacity of the shadow
                spreadRadius: 1, // Spread radius of the shadow
                blurRadius: 8, // Blur radius of the shadow
                offset: const Offset(0, 0), // Offset of the shadow
              )
            ]),

            child: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                // Status bar color
                statusBarColor: Colors.black,
                // Status bar brightness (optional)
                statusBarIconBrightness:
                    Brightness.light, // For Android (dark icons)
              ),
              title: Text("Course Details",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: Colors.blueAccent,
                ),
              ),
              centerTitle: true,
            ),

            // Replace 'assets/icon.png' with your image path
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 10),
                child: Column(
                  children: [
                    Course(type: "DetailCourse",image: "images/AvatarCourse.png",title: "Life in the Internet Age",description: "Let's discuss how technology is changing the way we live",level: "",numberLesson: "",),
                    SizedBox(height: 30,),
                    OverView()
                  ],
                ))));
  }
}
