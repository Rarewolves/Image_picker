import 'dart:io';
import 'dart:typed_data';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_20/model/image_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Gridview extends StatefulWidget {
  Gridview({super.key, required this.mylist});
  final List mylist;

  @override
  State<Gridview> createState() => _GridviewState();
}

class _GridviewState extends State<Gridview> {
  var box = Hive.box<ImageModel>('imageBox');

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
        itemCount: widget.mylist.length,
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(5),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  onChanged: (value) {
                    setState(() {});
                  },
                  customButton: Container(
                    height: 240,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: MemoryImage(
                              Uint8List.fromList(
                                widget.mylist[index].imageBytes,
                              ),
                            ),
                            fit: BoxFit.cover)),
                  ),
                  openWithLongPress: true,
                  items: [
                    DropdownMenuItem(
                        child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.share),
                              Text("share"),
                            ],
                          ),
                          DropdownMenuItem(
                              child: InkWell(
                            onTap: () {
                              box.deleteAt(index);
                              setState(() {
                                widget.mylist.removeAt(index);
                              });
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.delete),
                                Text("delete"),
                              ],
                            ),
                          ))
                        ],
                      ),
                    )),
                  ],
                ),
              ));
        });
  }
}
