import 'package:flutter/material.dart';
import 'package:reddit/home_screan.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: AboutUsPage(),
      ),
    );
  }
}

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);
  @override
  State<AboutUsPage> createState() => _AboutUsPage();
}

class _AboutUsPage extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          tooltip: 'Back to setting page',
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Feed()));
          },
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          '             About us',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: ListView(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                border: Border.all(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: 8,
                ),
              ),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              padding: const EdgeInsets.fromLTRB(50, 20, 50, 10),
              child: RichText(
                  text: const TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "AP final project, 1400-1401\nDr.Vahidi  \n ",
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(255, 0, 0, 0),
                    )),
              ])),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: 8,
                ),
              ),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: RichText(
                  softWrap: true,
                  textAlign: TextAlign.justify,
                  text: const TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "Dive Into Anything\n\n",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 151, 9, 9),
                        )),
                    TextSpan(
                        text:
                            "Reddit is home to thousands of communities, endless conversation, and authentic human connection. Whether you're into breaking news, sports, TV fan theories, or a never-ending stream of the internet's cutest animals, there's a community on Reddit for you.\n\n",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        )),
                    TextSpan(
                        text: "The Reddit Brand\n\n",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 151, 9, 9),
                        )),
                    TextSpan(
                        text:
                            "Our brand reflects how we want to be thought of and remembered. Consistent look and feel ensures a better awareness and connection to Reddit. Whenever using the Reddit brand, be sure to follow these key principles.\n\n",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ))
                  ])),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                border: Border.all(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: 8,
                ),
              ),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: RichText(
                  text: const TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "Contact us\n\n",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 151, 9, 9),
                    )),
                TextSpan(
                    text: "Mahdis Sepahvand: \n ",
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(255, 0, 0, 0),
                    )),
                TextSpan(
                    text: "    mahdissep18@gmail.com\n\n",
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(255, 0, 0, 0),
                    )),
                TextSpan(
                    text: "Maryam Paydar: \n ",
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(255, 0, 0, 0),
                    )),
                TextSpan(
                    text: "    maryampaydar812@gmail.com\n\n",
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(255, 0, 0, 0),
                    )),
              ])),
            ),
          ),
        ],
      ),
    );
  }
}
