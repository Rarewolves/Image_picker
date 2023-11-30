import 'package:flutter/material.dart';
import 'package:flutter_application_20/model/image_model.dart';
import 'package:flutter_application_20/view/home_screen/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ImageModelAdapter());
  var box = await Hive.openBox<ImageModel>('imageBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
