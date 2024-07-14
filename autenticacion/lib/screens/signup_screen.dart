import 'package:autenticacion/screens/signin_screen.dart';
import 'package:autenticacion/screens/welcome_screen.dart';
import 'package:autenticacion/widgets/custom_scaffold.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _claveFormularioRegistro = GlobalKey<FormState>();
  bool aceptarDatosPersonales = true;
  bool _ocultarContrasenia = true;
  bool _ocultarConfirmacionContrasenia = true;
  late TextEditingController _controladorNombre;
  late TextEditingController _controladorApellido;
  late TextEditingController _controladorCorreo;
  late TextEditingController _controladorContrasenia;
  late TextEditingController _controladorConfirmarContrasenia;


  @override
  void initState() {
    super.initState();
    _controladorNombre = TextEditingController();
    _controladorApellido = TextEditingController();
    _controladorCorreo = TextEditingController();
    _controladorContrasenia = TextEditingController();
    _controladorConfirmarContrasenia = TextEditingController();
  }

  @override
  void dispose() {
    _controladorNombre.dispose();
    _controladorApellido.dispose();
    _controladorCorreo.dispose();
    _controladorContrasenia.dispose();
    _controladorConfirmarContrasenia.dispose();
    super.dispose();
  }

  void _register() {
    if (_claveFormularioRegistro.currentState!.validate() &&
        aceptarDatosPersonales &&
        _controladorContrasenia.text.trim() == _controladorConfirmarContrasenia.text.trim()) {

      // Imprimir los datos ingresados en la consola
      
      if (kDebugMode) {
        print('Nombre: ${_controladorNombre.text.trim()}');
      }
      if (kDebugMode) {
        print('Apellido: ${_controladorApellido.text.trim()}');
      }
      if (kDebugMode) {
        print('Correo o Email: ${_controladorCorreo.text.trim()}');
      }
      if (kDebugMode) {
        print('Contraseña: ${_controladorContrasenia.text}');
      }
      if (kDebugMode) {
        print('Confirmación de Contraseña: ${_controladorConfirmarContrasenia.text}');
      }
      // Se pueden añadir mas si fuese necesario

      // Muestra el dialogo de registro exitoso
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Registro exitoso'),
            content: const Text('¡Gracias por registrarte!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Cerrar dialogo
                  Navigator.pushReplacement( // Reemplazar la pantalla actual por welcome_screen.dart
                    context,
                    MaterialPageRoute(builder: (context) => const WelcomeScreen()), // Se asume que el nombre de la clase es WelcomeScreen
                  );
                },
                child: const Text('Cerrar'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _claveFormularioRegistro,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Todo listo, Comencemos',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 33, 171, 167),
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        controller: _controladorNombre,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Por favor, ingrese su nombre';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Nombre'),
                          hintText: 'Ingresar nombre',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: _controladorApellido,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Por favor, ingrese su apellido';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Apellido'),
                          hintText: 'Ingresar apellido',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: _controladorCorreo,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Por favor, ingrese su Correo o Email';
                          }
                          final emailRegExp =
                              RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                          if (!emailRegExp.hasMatch(value.trim())) { //Validacion de correo
                            return 'Por favor, ingrese un correo electrónico válido';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Email'),
                          hintText: 'Ingresar Email',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: _controladorContrasenia,
                        obscureText: _ocultarContrasenia,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingrese su contraseña';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Contraseña'),
                          hintText: 'Ingresar contraseña',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _ocultarContrasenia
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _ocultarContrasenia = !_ocultarContrasenia;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: _controladorConfirmarContrasenia,
                        obscureText: _ocultarConfirmacionContrasenia,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingrese su contraseña';
                          } else if (value.trim() != _controladorContrasenia.text.trim()) {
                            return 'Las contraseñas deben de coincidir';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Confirme su contraseña'),
                          hintText: 'Ingresar contraseña',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _ocultarConfirmacionContrasenia
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _ocultarConfirmacionContrasenia =
                                    !_ocultarConfirmacionContrasenia;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: aceptarDatosPersonales,
                            onChanged: (bool? value) {
                              setState(() {
                                aceptarDatosPersonales = value!;
                              });
                            },
                            activeColor:
                                const Color.fromARGB(255, 33, 54, 171),
                          ),
                          const Text(
                            'Acepto los ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          const Text(
                            'Términos y condiciones',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 33, 54, 171),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _register,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 33, 54, 171),
                          ),
                          child: const Text('Registrarse'),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
                              'Registrarse con',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Logo(Logos.facebook_f),
                          Logo(Logos.twitter),
                          Logo(Logos.google),
                          Logo(Logos.apple),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Ya tienes una cuenta? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const SignInScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Iniciar sesión',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 33, 54, 171),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}