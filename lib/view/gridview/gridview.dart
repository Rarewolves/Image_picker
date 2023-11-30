import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_20/model/image_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Gridview extends StatelessWidget {
  Gridview({super.key, required this.mylist});
  final List mylist;
  var box = Hive.box<ImageModel>('imageBox');
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
        itemCount: mylist.length,
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(2),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.memory(
                    Uint8List.fromList(mylist[index].imageBytes),
                    fit: BoxFit.cover,
                  )));
        });
  }
}
