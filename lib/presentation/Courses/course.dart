import 'package:advanced_mobileapp_development/presentation/DetailCourse/DetailCourse.dart';
import 'package:advanced_mobileapp_development/presentation/DetailLesson/DetailLesson.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Course extends StatefulWidget {
  final String type;
  final String image;
  final String title;
  final String description;
  final String level;
  final String numberLesson;





  const Course({super.key,required this.type, required this.image, required this.title, required this.description, required this.level, required this.numberLesson});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(widget.type=="Course")
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailCourse()),
            );
          }
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey,width: 0.5),// Màu nền của container
          borderRadius: BorderRadius.circular(10), // Độ bo tròn góc của container
          boxShadow: [
            BoxShadow(
              color: Colors.grey, // Màu của đổ bóng
              offset: Offset(
                  0, 3), // Độ dịch chuyển đổ bóng theo chiều ngang và chiều dọc
              blurRadius: 1, // Độ mờ của đổ bóng
              spreadRadius: 0, // Độ rộng lan trải của đổ bóng
            ),
          ],
        ),
            child: Column(
              children: [
                Container(
                    height: 190,
                    width: double.infinity,
                    child:FittedBox(
                      fit: BoxFit.fill, // You can change the BoxFit property as needed
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(widget.image))), // Replace with your image
                    ),
                SizedBox(height: 5,),
                Container(

                  padding: EdgeInsets.only(left: 20,top: 20,right: 20,bottom:0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(widget.title,style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20
                      ),),
                      SizedBox(height: 5,),
                      Text(widget.description,style: TextStyle(
                        color: Colors.grey
                      ),),
                      SizedBox(height: 15,),
                      widget.type=="DetailCourse"? Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blueAccent.shade700,

                        ),

                        child: TextButton(onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DetailLesson()),
                          );
                        }, child: Text(
                          "Discover",style: TextStyle(
                          color: Colors.white
                        ),
                        )),
                      ) :
                      Row(
                        children: [
                          Text(widget.level),
                          Visibility(
                              visible: widget.type=="Course",
                              child: Text(" - " + widget.numberLesson+ " Lessons"))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
      ),
    );
  }
}
