import 'dart:io';

import 'package:drawer/data/response/status.dart';
import 'package:drawer/models/request/restuarant_request.dart';
import 'package:drawer/viewmodels/restaurant_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddRestaurant extends StatefulWidget {
  AddRestaurant({Key? key, this.data, this.isUpdate}) : super(key: key);
  dynamic data;
  bool? isUpdate;

  @override
  State<AddRestaurant> createState() => _AddRestaurantState();
}

class _AddRestaurantState extends State<AddRestaurant> {
  var imageFile;
  var restaurantViewModel = RestaurantViewModel();
  var imageId;
  var nameController = TextEditingController();
  var categoryController = TextEditingController();
  var discountController = TextEditingController();
  var deliveryFeeController = TextEditingController();
  var deliveryTimeControler = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isUpdate!) {
      nameController.text = widget.data.attributes.name;
      categoryController.text = widget.data.attributes.category;
      discountController.text = widget.data.attributes.discount.toString();
      deliveryFeeController.text =
          widget.data.attributes.deliveryFee.toString();
      deliveryTimeControler.text =
          widget.data.attributes.deliveryTime.toString();
      imageId = widget.data.attributes.picture.data.id;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // const SizedBox(
              //   height: 50,
              // ),
              ChangeNotifierProvider(
                create: (context) => restaurantViewModel,
                child: Consumer<RestaurantViewModel>(
                  builder: (context, viewModel, _) {
                    // if(imageFile != null){
                    //   print(("image url ${viewModel.image.data!.url}"));
                    // }
                    if (viewModel.image.status == Status.COMPLETE) {
                      print("image url${viewModel.image.data!.url}");
                      print("image id ${viewModel.image.data!.id}");
                      imageId = viewModel.image.data!.id;
                    } else if (viewModel.image.status == Status.LOADING) {
                      return const CircularProgressIndicator();
                    }

                    return InkWell(
                      onTap: () {
                        _getImageFromSourse();
                      },
                      child: imageFile == null
                          ? SizedBox(
                              width: 300,
                              height: 250,
                              child: widget.isUpdate!
                                  ? Image.network(
                                      'https://cms.istad.co${widget.data.attributes.picture.data.attributes.url}')
                                  : Image.network(
                                      'https://w7.pngwing.com/pngs/527/625/png-transparent-scalable-graphics-computer-icons-upload-uploading-cdr-angle-text-thumbnail.png'),
                            )
                          : Image.file(imageFile),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Name:",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: categoryController,
                decoration: const InputDecoration(
                  hintText: "Category:",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: discountController,
                decoration: const InputDecoration(
                  hintText: "Discount:",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: deliveryFeeController,
                decoration: const InputDecoration(
                  hintText: "Fee:",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: deliveryTimeControler,
                decoration: const InputDecoration(
                  hintText: "Time:",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              ChangeNotifierProvider(
                create: (context) => restaurantViewModel,
                child: Consumer<RestaurantViewModel>(
                  builder: (context, viewModel, _) {
                    if (viewModel.restaurants.status == Status.COMPLETE) {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Post Successed")));
                      });
                    }
                    return ElevatedButton(
                      onPressed: () {
                        postRestaurant(widget.isUpdate);
                      },
                      child: widget.isUpdate!
                          ? const Text("Update")
                          : const Text("Save"),
                    );
                  },
                ),
              ),
            ],
          ),
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

  void postRestaurant(isUpdate) {
    print('image id ::$imageId');
    var requestBody = Data(

      name: nameController.text,
      category: categoryController.text,
      discount: int.parse(discountController.text),
      deliveryFee: double.parse(deliveryFeeController.text),
      deliveryTime: int.parse(deliveryTimeControler.text),
      picture: imageId.toString(),
    );
    if (isUpdate) {
      restaurantViewModel.putRestaurant(requestBody,widget.data.id);
    } else {
      restaurantViewModel.postRestaurant(requestBody);
    }
  }
}
