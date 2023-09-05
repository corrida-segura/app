import 'dart:io';
import 'package:corridasegura/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../constants/texts.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedImage;

  Future<void> _pickImage() async {
    try {
      await Permission.photos.request();
      _pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
      setState(() {});
    } catch (e) {
      const AlertDialog(
        content: Text(tImageError),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.grey, 
        //Set background image using a image from the assets folder
        backgroundImage: const AssetImage(tAvatar),
        foregroundImage: _pickedImage != null ? FileImage(File(_pickedImage!.path)) : null,
      ),
    );
  }
}
