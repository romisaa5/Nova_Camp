import 'package:api/api_services.dart';
import 'package:api/widgets/custom_button.dart';
import 'package:api/widgets/custom_text_form_field.dart';
import 'package:api/widgets/validation_methods.dart';
import 'package:flutter/material.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});
  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiServices apiServices = ApiServices();
  final TextEditingController avatarController = TextEditingController(
    text: "https://picsum.photos/800",
  );
  String? role;
  String? errorMassege;
  bool isLoading = false;
  createUser() async {
    setState(() {
      isLoading = true;
    });
    try {
      role = await apiServices.addUser(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        avatar: avatarController.text,
      );
      setState(() {
        isLoading = false;
      });
    } on Exception catch (e) {
      setState(() {
        isLoading = false;
        errorMassege = e.toString();
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    avatarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text('add User', style: TextStyle(color: Colors.white)),
      ),
      body: Form(
        key: formKey,
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
              AppTextFormField(
                controller: passwordController,
                validator: (value) => ValidationMethods.validatePassword(value),
                hintText: 'Password',
              ),
              AppTextFormField(
                controller: avatarController,
                hintText: 'Avatar',
              ),
              isLoading
                  ? CircularProgressIndicator()
                  : CustomButton(
                      text: 'Add User',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          createUser();
                        }
                      },
                    ),
              Text(role ?? errorMassege ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
