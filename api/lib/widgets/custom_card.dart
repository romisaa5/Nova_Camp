import 'package:api/models/user.dart';
import 'package:api/screens/update_user_screen.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(30),
              child: Image.network(
                user.avatar!,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.person, size: 25);
                },
              ),
            ),
          ),
          title: Text(user.name ?? ''),
          subtitle: Text(user.email ?? ''),
          trailing: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return UpdateUserScreen(
                      id: user.id.toString(),
                      name: user.name ?? '',
                      email: user.email ?? '',
                    );
                  },
                ),
              );
            },
            icon: Icon(Icons.edit, size: 18),
          ),
        ),
      ),
    );
  }
}
