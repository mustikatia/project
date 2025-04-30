import 'package:flutter/material.dart';
import 'package:tugastia2/widget/custom_textfield.dart';
import 'package:tugastia2/widget/custom_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Color backgroundColor = Colors.white;

  void _changeBackgroundColor() {
    setState(() {
      backgroundColor =
          backgroundColor == Colors.white
              ? const Color(0xFFE0F7FA) // biru muda
              : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 118, 234, 168),
        title: const Text('Profil Saya'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
            const SizedBox(height: 10),
            const CustomText(
              text: 'Tia Mustika Yani',
              size: 18,
              weight: FontWeight.bold,
            ),
            const CustomText(
              text: 'tiamustika@gmail.com',
              size: 14,
              color: Colors.grey,
            ),
            const Divider(height: 40),
            profileTile(Icons.person, 'Nama Lengkap', 'Tia Mustika Yani'),
            profileTile(Icons.email, 'Email', 'tiamustika@gmail.com'),
            profileTile(Icons.phone, 'Nomor Telepon', '0899-0987-5432'),
            const SizedBox(height: 30),
            CustomButton(
              label: 'Ubah warna',
              color: const Color.fromARGB(255, 230, 173, 87),
              onPressed: _changeBackgroundColor,
            ),
            const SizedBox(height: 10),
            CustomButton(
              label: 'Logout',
              color: Colors.red,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget profileTile(IconData icon, String title, String subtitle) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 104, 230, 150),
          child: Icon(icon, color: Colors.white),
        ),
        title: CustomText(
          text: title,
          weight: FontWeight.w600,
          color: Colors.grey[800]!,
        ),
        subtitle: CustomText(text: subtitle),
      ),
    );
  }
}
