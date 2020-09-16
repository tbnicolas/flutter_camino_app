import 'dart:async';
import 'package:flutter_camino_app/blocs/validators.dart';
import 'package:flutter_camino_app/providers/firebaseUser_providers.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators{

  final _emailController    = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final firebaseUserProvider = new FirebaseUserProvider();
  
  //Recuperar los datos del Stream
  Stream<String>get emailStream =>_emailController.stream.transform(validarEmail);
  Stream<String>get passwordStream =>_passwordController.stream.transform(validarPassword);

  //combinamos los dos Streams(email y password) para mandar un resultado
  Stream<bool> get formValidStream =>
      CombineLatestStream.combine2(emailStream, passwordStream, (e, p) => true);

  //Insertamos valores al Stream
  Function(String) get changeEmail =>_emailController.sink.add;
  Function(String) get changePassword =>_passwordController.sink.add;

//Obtener el ultimo valor agregado a los streams
  String get email => _emailController.value;
  String get password => _passwordController.value;

  //Obtener si está logueado
  Stream<String> get isSignedIn => firebaseUserProvider.authState;

  //Cerramos los Streams
  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }

}