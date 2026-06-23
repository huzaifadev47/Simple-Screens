
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
    
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formkey,
          child: Column(
            spacing: 10,
            children: [
              SizedBox(height: 20,),
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),TextFormField(
                controller: phone,
                decoration: InputDecoration(
                  hintText: 'Phone',
                ),
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone';
                  }
                  if (value.length != 11) {
                    return ('Phone must be 11 characters');
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: password,
                obscureText: true,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 8) {
                    return 'Password must be 8 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: (
              ){
                if (formkey.currentState!.validate()) {
                print('Name : ${name.text}');
                print('Email : ${email.text}');
                print('Phone : ${phone.text}');
                print('Password : ${password.text}');
                  
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
              ),
               child: Text('Register'),),
            ],
          ),
        ),
      ),
    );
  }
}