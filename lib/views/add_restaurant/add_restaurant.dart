import 'dart:io';

import 'package:drawer/data/response/status.dart';
import 'package:drawer/viewmodels/restaurant_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddRestaurant extends StatefulWidget {
  const AddRestaurant({Key? key}) : super(key: key);

  @override
  State<AddRestaurant> createState() => _AddRestaurantState();
}

class _AddRestaurantState extends State<AddRestaurant> {
  var imageFile;
  var restaurantViewModel = RestaurantViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            ChangeNotifierProvider(
              create: (context) => restaurantViewModel,
              child: Consumer<RestaurantViewModel>(
                builder: (context, viewModel, _) {
                   // if(imageFile != null){
                   //   print(("image url ${viewModel.image.data!.url}"));
                   // }
                  if(viewModel.image.status ==  Status.COMPLETE){
                    print("image url${viewModel.image.data!.url}");
                  }else if(viewModel.image.status == Status.LOADING){
                     return const CircularProgressIndicator();
                  }

                  return InkWell(
                    onTap: () {
                      _getImageFromSourse();
                    },
                    child: imageFile == null
                        ? const Image(
                            image: NetworkImage(
                              "https://www.pngkey.com/png/detail/352-3525856_png-file-add-post-icon-png.png",
                            ),
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          )
                        : Image.file(imageFile),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _getImageFromSourse() async {
    var pickerFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1900,
    );
    if (pickerFile != null) {
      print("image PickerFile by User");
      setState(() {
        imageFile = File(pickerFile.path);
      });
      restaurantViewModel.uploadImage(pickerFile.path);
    }
  }
}
