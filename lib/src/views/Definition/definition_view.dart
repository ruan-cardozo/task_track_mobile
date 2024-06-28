import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_track/src/config/api_config.dart';
import 'package:task_track/src/provider/theme_provider.dart';
import 'package:task_track/src/services/profile_service.dart';
import 'package:task_track/src/views/Home/home_view.dart';
import 'package:task_track/src/views/Login/login_view.dart';
import 'package:task_track/src/views/Profile/profile_view.dart';

class MyDefinitionPage extends StatefulWidget {
  const MyDefinitionPage({Key? key}) : super(key: key);

  @override
  _MyDefinitionPageState createState() => _MyDefinitionPageState();
}

class _MyDefinitionPageState extends State<MyDefinitionPage> {
  ProfileService profileService = ProfileService(baseUrl: BASE_URL);
  String userName = '';

  @override
  void initState() {
    super.initState();
    getUserInformation();
  }

  void getUserInformation() async {
    var databaseUser = await profileService.getUserProfile();
    var decodedBody = jsonDecode(databaseUser.body);
    setState(() {
      userName = decodedBody['name'];
    });
  }

  Widget buildDefinitionButtons() {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.edit),
          title: Text('Editar perfil'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyProfileView(),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Voltar para a página inicial'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyHomePage(),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Sair'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MyLoginPage(title: 'Login')));
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Minhas definições', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 70),
            const CircleAvatar(
              radius: 150,
              backgroundImage: AssetImage('lib/assets/images/dog_image.jpg'),
            ),
            const SizedBox(height: 15),
            Text(
              'Olá, $userName',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Dados da conta',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Consumer<ThemeNotifier>(
              builder: (context, themeNotifier, child) {
                return SwitchListTile(
                  title: Text('Dark Mode'),
                  value: themeNotifier.isDarkMode,
                  onChanged: (value) {
                    themeNotifier.toggleTheme(value);
                  },
                  secondary: Icon(themeNotifier.isDarkMode
                      ? Icons.dark_mode
                      : Icons.light_mode),
                );
              },
            ),
            buildDefinitionButtons(),
          ],
        ),
      ),
    );
  }
}
