// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final Shader headerGradient = LinearGradient(colors: <Color>[
    Color.fromARGB(255, 0, 242, 255),
    Color.fromARGB(255, 33, 170, 97)
  ]).createShader(Rect.fromLTWH(0, 0, 200.0, 70.0));

  final Shader highlightGradient = LinearGradient(colors: <Color>[
    Color.fromARGB(255, 43, 255, 1),
    Color.fromARGB(255, 255, 225, 0)
  ]).createShader(Rect.fromLTWH(0, 0, 200.0, 70.0));

  final Shader OverallTextGradient = LinearGradient(
    colors: <Color>[
      Color(0xff1f005c),
      Color(0xff5b0060),
      Color(0xff870160),
      Color(0xffac255e),
      Color(0xffca485c),
      Color(0xffe16b5c),
      Color(0xfff39060),
      Color.fromARGB(255, 255, 89, 0),
    ],
  ).createShader(Rect.fromLTWH(0, 0, 200.0, 70.0));

  mySkills(num, type) {
    return Row(
      children: [
        Text(
          num,
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              foreground: Paint()..shader = OverallTextGradient),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(type),
        )
      ],
    );
  }

  mySpecialization(icon, text) {
    return Container(
      width: 105,
      height: 115,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Color.fromARGB(255, 30, 31, 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              icon,
              color: Color.fromARGB(255, 206, 206, 206),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(
                  foreground: Paint()..shader = highlightGradient,
                  fontSize: 16),
            )
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: PopupMenuButton(
          icon: Icon(Icons.menu),
          color: Colors.black,
          itemBuilder: (context) => [
            PopupMenuItem(
              child: TextButton(
                child: Text('Projects', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.pushNamed(context, 'projects');
                },
              ),
              value: 1,
            ),
            PopupMenuItem(
              child: TextButton(
                  child:
                      Text('About Me', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.pushNamed(context, 'about');
                  }),
              value: 2,
            )
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 19, 16, 16),
              Color.fromARGB(255, 0, 0, 0),
            ],
          ),
        ),
        child: SlidingSheet(
          elevation: 8,
          cornerRadius: 16,
          snapSpec: const SnapSpec(
            // Enable snapping. This is true by default.
            snap: true,
            // Set custom snapping points.
            snappings: [0.4, 0.7, 1.0],
            // Define to what the snappings relate to. In this case,
            // the total available space that the sheet can expand to.
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
          // The body widget will be displayed under the SlidingSheet
          // and a parallax effect can be applied to it.
          body: Container(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(40),
                  child: ShaderMask(
                    shaderCallback: (bound) {
                      return LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black, Colors.transparent])
                          .createShader(
                              Rect.fromLTRB(0, 0, bound.width, bound.height));
                    },
                    blendMode: BlendMode.dstIn,
                    child: Image.asset(
                      'img.png',
                      height: 400,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.49),
                  child: Column(children: [
                    Text(
                      'Amogh Saxena',
                      style: TextStyle(
                          foreground: Paint()..shader = headerGradient,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'GFG Mentor',
                      style: TextStyle(
                          foreground: Paint()..shader = highlightGradient,
                          fontSize: 20,
                          ),
                    ),
                  ]),
                )
              ],
            ),
          ),
          builder: (context, state) {
            // This is the content of the sheet that will get
            // scrolled, if the content is bigger than the available
            // height of the sheet.
            return Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 30),
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      mySkills('40+', 'Projects'),
                      mySkills('11k', 'Students'),
                      mySkills('155', 'Sessions'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Specialized In',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mySpecialization(FontAwesomeIcons.android, 'Android'),
                          mySpecialization(FontAwesomeIcons.github, 'Github'),
                          mySpecialization(FontAwesomeIcons.python, 'Python'),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mySpecialization(FontAwesomeIcons.js, 'JavaScript'),
                          mySpecialization(FontAwesomeIcons.html5, 'HTML'),
                          mySpecialization(FontAwesomeIcons.css3, 'CSS'),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mySpecialization(FontAwesomeIcons.database, 'SQL'),
                          mySpecialization(FontAwesomeIcons.react, 'React'),
                          mySpecialization(FontAwesomeIcons.nodeJs, 'NodeJs'),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
