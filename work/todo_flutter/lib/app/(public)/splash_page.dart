import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:todo_flutter/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Routefly.navigate(routePaths.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.network(
                'https://cdn.discordapp.com/attachments/925420096200003637/1206813935009800242/lb-removebg-preview.png?ex=65dd600f&is=65caeb0f&hm=c3eeef9ffc2e0a44751b03bd3f6e57ed03760e9702b351f806f9e0acbafa205b&'),
          )
        ],
      ),
    );
  }
}
