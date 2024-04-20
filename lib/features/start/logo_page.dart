import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Learny words",
                style: TextStyle(
                    fontSize: 48,
                    color: Theme.of(context).colorScheme.primaryContainer),
              ),
              const SizedBox(height: 50),
              SpinKitRotatingPlain(
                color: Theme.of(context).colorScheme.primaryContainer,
                size: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
