import 'package:amazon_clone_me/common/widgets/custom_btn.dart';
import 'package:amazon_clone_me/common/widgets/custom_textfield.dart';
import 'package:amazon_clone_me/constants/global_var.dart';
import 'package:amazon_clone_me/feauters/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final AuthService authService = AuthService();

  void signUpUser() {
    authService.signUpUser(
        context: context,
        name: _name.text,
        email: _email.text,
        password: _password.text);
  }

  void signInUser() {
    authService.signInUser(
        context: context, email: _email.text, password: _password.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signup,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    }),
                title: const Text(
                  'Create account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _name,
                            hintText: 'Name',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            controller: _email,
                            hintText: 'Email',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            controller: _password,
                            hintText: 'Password',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                              text: 'Signup',
                              onPress: () {
                                if (_signUpFormKey.currentState!.validate()) {
                                  signUpUser();
                                }
                              })
                        ],
                      )),
                ),
              ListTile(
                tileColor: _auth == Auth.signin
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signin,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    }),
                title: const Text(
                  'Sing in',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                      key: _signInFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _email,
                            hintText: 'Email',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            controller: _password,
                            hintText: 'Password',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                              text: 'Signin',
                              onPress: () {
                                if (_signInFormKey.currentState!.validate()) {
                                  signInUser();
                                }
                              })
                        ],
                      )),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
