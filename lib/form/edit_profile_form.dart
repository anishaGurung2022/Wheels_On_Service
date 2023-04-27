import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wheels_on_service/controller/details_controller.dart';
import 'package:wheels_on_service/model/customer_model.dart';
import 'package:wheels_on_service/utils/constants.dart';
import 'package:wheels_on_service/utils/shared_prefs.dart';
import 'package:wheels_on_service/views/components/my_button.dart';
import 'package:wheels_on_service/views/components/my_field.dart';

class EditProfileForm extends StatefulWidget {
  final Customer customer;
  const EditProfileForm({super.key, required this.customer});

  @override
  State<EditProfileForm> createState() => EditProfileFormState();
}

class EditProfileFormState extends State<EditProfileForm> {
  final ImagePicker _picker = ImagePicker();
  AuthService authService = AuthService();
  PickedFile? pickedFile;
  String? _imageUrl;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final CustomerController customerController = Get.put(CustomerController());
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    _idController.text = widget.customer.id;
    _nameController.text = widget.customer.name;
    _phoneController.text = widget.customer.phone;
    _usernameController.text = widget.customer.userName;
    _addressController.text = widget.customer.address;
    _imageUrl = widget.customer.image;
  }

  EditProfileFormState();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: backgroundColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            "Edit Profile",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                color: backgroundColor),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 20, bottom: 10, right: 20, top: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        //to make container clickable use INKWELL
                        InkWell(
                            //port where image selected
                            onTap: () async {
                              pickedFile = await _picker.getImage(
                                  source: ImageSource.gallery);
                              setState(() {});
                              if (pickedFile != null) {
                                //Get.back();
                              }
                            },
                            child: (pickedFile == null)
                                ? Container(
                                    width: 190,
                                    height: 170,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: const Icon(Icons.add_a_photo),
                                  )
                                : Container(
                                    width: 190,
                                    height: 170,
                                    decoration: BoxDecoration(
                                      //image from file
                                      image: DecorationImage(
                                          image: FileImage(
                                            File(pickedFile!.path),
                                          ),
                                          fit: BoxFit.cover),
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: const Icon(Icons.add_a_photo),
                                  )),
                        const SizedBox(height: 15),
                        SizedBox(
                            width: 365,
                            child: MyField(
                              labelText: "FullName",
                              controller: _nameController,
                              hintText: _nameController.text,
                              //prefixIcon: const Icon(Icons.car_repair_sharp),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 365,
                          child: MyField(
                            labelText: "Contact Number",
                            controller: _phoneController,
                            hintText: _phoneController.text,
                            //prefixIcon: const Icon(Icons.description),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 365,
                          child: MyField(
                            labelText: "User name",
                            controller: _usernameController,
                            hintText: _usernameController.text,
                            //prefixIcon: const Icon(Icons.person_add),
                          ),
                        ),
                        SizedBox(
                          width: 365,
                          child: MyField(
                            labelText: "Address",
                            controller: _addressController,
                            hintText: _addressController.text,
                            //prefixIcon:
                            // const Icon(Icons.location_history_sharp),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: 320,
                          height: 70,
                          child: MyButton(
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  var data = {
                                    "id": _idController.text,
                                    "name": _nameController.text,
                                    "phone": _phoneController.text,
                                    "userName": _usernameController.text,
                                    "address": _addressController.text,
                                  };
                                  print(data);
                                  customerController.updateProfile(
                                      data, pickedFile);
                                }
                              },
                              buttonName: 'Save'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
