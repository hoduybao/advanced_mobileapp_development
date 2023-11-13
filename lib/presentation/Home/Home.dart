import 'package:advanced_mobileapp_development/model/tutor-dto.dart';
import 'package:advanced_mobileapp_development/presentation/Courses/Courses.dart';
import 'package:advanced_mobileapp_development/presentation/History/History.dart';
import 'package:advanced_mobileapp_development/presentation/Home/searchTutor.dart';
import 'package:advanced_mobileapp_development/presentation/Schedule/Schedule.dart';
import 'package:advanced_mobileapp_development/presentation/VideoCall/VideoCallPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../model/rate-dto.dart';
import 'listTutors.dart';

typedef FilterCallback = void Function(String filter);
typedef FilterNationCallback = void Function(List<String> name);

class Home extends StatefulWidget {
  const Home(this.loginCallback,{super.key});
  final LoginCallback loginCallback;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TutorDTO> tutorsFilter = [];
  List<TutorDTO> tutors=[];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
    filterCallback("All");
    });
  }
  void filterCallback(String filter) {
    if (filter == "All") {
      setState(() {
        tutorsFilter = tutors;
      });
    } else {
      setState(() {
        tutorsFilter = tutors
            .where((tutor) => tutor.specialities.contains(filter))
            .toList();
      });
    }
  }
  void findNationCallback(List<String> nation) {
    List<TutorDTO> temp=[];
    if(!nation.isEmpty)
      {
        nation.forEach((element) {
          if (element=="Foreign Tutor") {

            temp =temp+ tutors
                .where((tutor) => !tutor.country.contains("US")&&!tutor.country.contains("England")&&!tutor.country.contains("Vietnam"))
                .toList();

          } else if(element=="Vietnamese Tutor"){
            temp =temp+tutors
                .where((tutor) => tutor.country.contains("Vietnam"))
                .toList();
          }
          else if(element=="Native English Tutor")
          {

            temp = temp+tutors
                .where((tutor) => tutor.country.contains("US")||tutor.country.contains("England"))
                .toList();

          }
        });
        setState(() {
          tutorsFilter=temp;
        });
      }
  }
    void findNameCallback(String name) {

        setState(() {
          tutorsFilter = tutors
              .where((tutor) => tutor.name.toLowerCase().contains(name.toLowerCase()))
              .toList();
        });

    }
  @override
  Widget build(BuildContext context) {
    tutors = context.watch<List<TutorDTO>>();


    return Scaffold(
      endDrawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 125,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue, border: null),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Icon(
                            Icons.close_outlined,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Text(
                          "Menu",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.people_alt,
                color: Colors.blue.shade700,
                size: 30,
              ),
              title: const Text(
                'Tutors',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home(widget.loginCallback)),
                );
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.school,
                color: Colors.blue.shade700,
                size: 30,
              ),
              title: const Text(
                'Courses',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Courses(widget.loginCallback)),
                );
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.calendar_month,
                color: Colors.blue.shade700,
                size: 30,
              ),
              title: const Text(
                'Schedule',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Schedule(widget.loginCallback)),
                );
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.history,
                color: Colors.blue.shade700,
                size: 30,
              ),
              title: const Text(
                'History',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => History(widget.loginCallback)),
                );
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.blue.shade700,
                size: 30,
              ),
              title: const Text('Logout',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
              onTap: () {
                widget.loginCallback(0);
              },
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(50.0), // Define the height of the AppBar
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withOpacity(0.2), // Color and opacity of the shadow
                spreadRadius: 5, // Spread radius of the shadow
                blurRadius: 7, // Blur radius of the shadow
                offset: const Offset(0, 3), // Offset of the shadow
              ),
            ],
          ),
          child: AppBar(
              automaticallyImplyLeading: false,
              systemOverlayStyle: const SystemUiOverlayStyle(
                // Status bar color
                statusBarColor: Colors.black,
                // Status bar brightness (optional)
                statusBarIconBrightness:
                    Brightness.light, // For Android (dark icons)
              ),
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.school,
                        size: 45,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(width: 7),
                      Text(
                        "LetTutor",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
              child: Column(children: [
        UpcomingLesson(),
        SearchTutor(filterCallback,findNameCallback,findNationCallback),
        Divider(
          // Add a horizontal line
          color: Colors.grey, // Line color
          height: 10, // Line height
          thickness: 0.5, // Line thickness
          indent: 20, // Line indent on the left
          endIndent: 10, // Line indent on the right
        ),
        ListTutors(tutorsFilter),
      ]))),
    );
  }
}

class UpcomingLesson extends StatelessWidget {
  const UpcomingLesson({super.key});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color.fromARGB(255, 12, 61, 223);

    return Container(
      width: double.infinity,
      color: backgroundColor,
      padding: EdgeInsets.only(top: 40, bottom: 30),
      child: Column(
        children: [
          Text(
            "Upcoming lesson",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      "Thu, 26 Oct 23",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      "03:30 - 03:55",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      "(start in 100:02:43)",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.yellow),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20), // Đặt góc bo tròn
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VideoCallPage()),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.slow_motion_video,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Enter lesson room",
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 14),
                        )
                      ],
                    )),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Total lesson time is 507 hours 55 minutes",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
