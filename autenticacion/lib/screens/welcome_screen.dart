import 'package:autenticacion/screens/signin_screen.dart';
import 'package:autenticacion/screens/signup_screen.dart';
import 'package:autenticacion/theme/theme.dart';
import 'package:autenticacion/widgets/custom_scaffold.dart';
import 'package:autenticacion/widgets/welcome_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 40.0,
                ),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: '¡Bienvenido de nuevo!\n',
                            style: TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                            )),
                        TextSpan(
                            text:
                                '\nIngrese datos personales a su cuenta de empleado',
                            style: TextStyle(
                              fontSize: 20,
                                  color: Colors.white
                              // height: 0,
                            ))
                      ],
                    ),
                  ),
                ),
              )),
          Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  const Expanded(
                    child: WelcomeButton(
                      buttonText: 'Iniciar sesión',
                      onTap: SignInScreen(),
                      //Sign in, accion
                      color: Colors.transparent,
                      textColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Registrarse',
                      onTap:  const SignUpScreen(),
                      //Sign up, accion
                      color: Colors.white,
                      textColor:  lightColorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
