import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';

class Gridview extends StatelessWidget {
  const Gridview({super.key, required this.mylist});
  final List<XFile> mylist;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
        itemCount: mylist.length,
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(2),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(File(mylist[index].path))),
            ));
  }
}
