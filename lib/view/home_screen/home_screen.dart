import 'package:flutter/material.dart';
import 'package:flutter_application_20/model/image_model.dart';
import 'package:flutter_application_20/view/gridview/gridview.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var box = Hive.box<ImageModel>('imageBox');
  List<ImageModel> multiimagelist = [];
  @override
  void initState() {
    multiimagelist = box.values.toList();
    super.initState();
  }

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
                        mainAxisSize: MainAxisSize.min,
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

                              for (var image in images) {
                                final bytes = await image.readAsBytes();
                                final imageModel =
                                    ImageModel(imageBytes: bytes);
                                box.add(imageModel);
                              }
                              setState(() {
                                multiimagelist = box.values.toList();
                              });

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
