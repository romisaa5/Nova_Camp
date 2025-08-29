import 'package:api/api_services.dart';
import 'package:api/models/user.dart';
import 'package:api/screens/add_user_screen.dart';
import 'package:api/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final ApiServices apiServices = ApiServices();

List<User> users = [];

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  String? errorMassege;
  fetchData() async {
    try {
      final data = await apiServices.fetchData();
      users = data;
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
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Users', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AddUserScreen();
                  },
                ),
              );
            },
            icon: Icon(Icons.person_add_rounded, color: Colors.white),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return CustomCard(user: users[index]);
              },
            ),
    );
  }
}
