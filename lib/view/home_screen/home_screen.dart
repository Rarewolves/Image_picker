import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_20/view/gridview/gridview.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<XFile> multiimagelist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Gridview(mylist: multiimagelist),
      floatingActionButton: FloatingActionButton(
          child: Image.asset(
            "assets/icons/camera.png",
            scale: 14,
          ),
          backgroundColor: Colors.pink,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select Image",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () async {
                              final ImagePicker picker = ImagePicker();
                              List<XFile> images =
                                  await picker.pickMultiImage();

                              multiimagelist.addAll(images);
                              setState(() {});
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("From gallery"),
                                Image.asset(
                                  "assets/icons/picture.png",
                                  scale: 15,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () async {
                              final ImagePicker picker = ImagePicker();
                              final XFile? photo = await picker.pickImage(
                                  source: ImageSource.camera);
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("From camera"),
                                Image.asset(
                                  "assets/icons/camera (1).png",
                                  scale: 15,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ));
          }),
    );
  }
}
