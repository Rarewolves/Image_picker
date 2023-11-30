import 'package:hive/hive.dart';
part 'image_model.g.dart';

@HiveType(typeId: 1)
class ImageModel {
  @HiveField(0)
  List<int> imageBytes;
  ImageModel({required this.imageBytes});
}
