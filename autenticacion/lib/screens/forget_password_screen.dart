import 'package:flutter/material.dart';

class ForgetpasswordScreen extends StatefulWidget{
  const ForgetpasswordScreen ({super.key});
  
  @override
  State<ForgetpasswordScreen> createState() => _ForgetPasswordScreenState();

}

class _ForgetPasswordScreenState extends State<ForgetpasswordScreen>{
  @override
  Widget build(BuildContext context){
    return const Text("Olvidaste tu contraseña");
  }
}