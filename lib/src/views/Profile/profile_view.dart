import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_track/src/config/api_config.dart';
import 'package:task_track/src/services/auth_service.dart';
import 'package:task_track/src/services/profile_service.dart';
import 'package:task_track/src/views/Home/home_view.dart';
import 'package:task_track/src/widget/BottomNavigator/bottom_navigation_bar.dart';
import 'package:task_track/src/widget/CustomButton/custom_button.dart';
import 'package:task_track/src/widget/CustomTextField/custom_text_field.dart';

class MyProfileView extends StatefulWidget {
  const MyProfileView({Key? key}) : super(key: key);

  @override
  _MyProfileViewState createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  UserService userService = UserService(baseUrl: BASE_URL);
  ProfileService profileService = ProfileService(baseUrl: BASE_URL);
  bool isEditing = false;
  String userName = '';
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    getUserInformation();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (_selectedIndex == 1) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MyHomePage()));
      }
    });
  }

  void getUserInformation() async {
    var databaseUser = await profileService.getUserProfile();
    var decodedBody = jsonDecode(databaseUser.body);
    var name = decodedBody['name'];
    var email = decodedBody['email'];
    var password = decodedBody['password'];
    userName = name;

    setState(() {
      nameController.text = name ?? '';
      emailController.text = email ?? '';
      passwordController.text = password ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            const CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(AVATAR_IMAGE),
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
            Expanded(
              child: _buildProfileForm(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomNavigationBar(
                selectedIndex: _selectedIndex,
                onItemTapped: _onItemTapped,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileForm() {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        IgnorePointer(
          ignoring: !isEditing,
          child: CustomTextField(
            controller: nameController,
            hintText: 'Digite seu nome',
            labelText: 'Nome',
          ),
        ),
        const SizedBox(height: 16),
        IgnorePointer(
          ignoring: !isEditing,
          child: CustomTextField(
            controller: emailController,
            hintText: 'Digite seu email',
            labelText: 'Email',
          ),
        ),
        const SizedBox(height: 50),
        CustomButton(
          text: 'Editar',
          textStyle: TextStyle(
            fontSize: 30,
            color: Colors.brown[200],
          ),
          onPressed: () {
            setState(() {
              isEditing = !isEditing;
            });
          },
        ),
        CustomButton(
          text: 'Salvar',
          textStyle: TextStyle(
            fontSize: 30,
            color: Colors.brown[200],
          ),
          onPressed: () async {
            if (isEditing) {
              final response = await profileService.editUserProfile(
                  nameController.text, emailController.text);
              if ([200, 201].contains(response.statusCode) &&
                  response.body.isNotEmpty) {
                setState(() {
                  isEditing = false;
                  userName = nameController.text;
                });
                Fluttertoast.showToast(
                    msg: "Perfil salvo com sucesso.",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 3,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
              } else {
                Fluttertoast.showToast(
                    msg: "Houve um erro ao salver o perfil.",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 3,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            }
          },
        ),
      ],
    );
  }
}
