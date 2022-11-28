import 'package:amazon_clone_me/common/widgets/bottom_bar.dart';
import 'package:amazon_clone_me/constants/global_var.dart';
import 'package:amazon_clone_me/feauters/auth/screens/auth_screen.dart';
import 'package:amazon_clone_me/feauters/auth/services/auth_service.dart';
import 'package:amazon_clone_me/feauters/home/home_screen.dart';
import 'package:amazon_clone_me/models/user.dart';
import 'package:amazon_clone_me/providers/user_provider.dart';
import 'package:amazon_clone_me/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Amazon clone',
        theme: ThemeData(
            scaffoldBackgroundColor: GlobalVariables.backgroundColor,
            colorScheme: const ColorScheme.light(
                primary: GlobalVariables.secondaryColor),
            appBarTheme: const AppBarTheme(
                elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
        onGenerateRoute: ((settings) => generateRoute(settings)),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? const BottomBar()
            : const AuthScreen());
  }
}
