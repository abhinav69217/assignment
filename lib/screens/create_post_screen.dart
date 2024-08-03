import 'package:assignment/components/custom_button.dart';
import 'package:assignment/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:assignment/components/custom_text_field.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: 12,
            ),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(
                                username: "hi",
                              )));
                },
                icon: Image.asset(
                  'assets/arrow_back.png',
                  height: 24,
                  width: 24,
                )),
            SizedBox(
              width: 1,
            ),
            const Text(
              'Create Post',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.15),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: const Color(0xffEFF1F4),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Share your thoughts with the community',
                    style: TextStyle(
                        color: Color(0xFF55555A),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.1),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: TextEditingController(),
                    labelText: 'Title',
                    hintText: 'eg. Dive into the perfect',
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: TextEditingController(),
                    labelText: 'Description',
                    hintText: 'eg. Dive into the perfect',
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color(0xffE1ECFC),
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 18.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/clip.png',
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Upload Image',
                              style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 0.5,
                                color: const Color(0xff55555A),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            // Implement upload from gallery action
                          },
                          child: Text(
                            'upload',
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 0.5,
                              color: Color(0xff0461E5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CustomButton(text: 'Create Post', onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
