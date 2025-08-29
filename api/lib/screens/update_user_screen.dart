import 'package:api/api_services.dart';
import 'package:api/widgets/custom_button.dart';
import 'package:api/widgets/custom_text_form_field.dart';
import 'package:api/widgets/validation_methods.dart';
import 'package:flutter/material.dart';

class UpdateUserScreen extends StatefulWidget {
  const UpdateUserScreen({
    super.key,
    required this.id,
    required this.email,
    required this.name,
  });
  final String id;
  final String email;
  final String name;
  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

final ApiServices apiServices = ApiServices();
String? name;
bool isLoading = false;
String? errorMassege;

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    emailController = TextEditingController(text: widget.email);
  }

  updateUser() async {
    setState(() {
      isLoading = true;
    });
    try {
      final name = await apiServices.updateUser(
        name: nameController.text,
        email: emailController.text,
        id: widget.id,
      );
      setState(() {
        isLoading = false;
      });
    } on Exception catch (e) {
      setState(() {
        isLoading = true;
        errorMassege = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text('Update User', style: TextStyle(color: Colors.white)),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 20,
            children: [
              AppTextFormField(
                controller: nameController,
                validator: (value) => ValidationMethods.validateUsername(value),
                hintText: 'Name',
              ),
              AppTextFormField(
                controller: emailController,
                validator: (value) => ValidationMethods.validateEmail(value),
                hintText: 'Email',
              ),
              isLoading
                  ? CircularProgressIndicator()
                  : CustomButton(
                      text: 'Update User',
                      onTap: () => updateUser(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
