import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unicalm_v2/core/models/user_model.dart';

class AuthController extends GetxController { 
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  Future<Map<String, dynamic>> registerUser({
    required String email,
    required String senha,
    required Map<String, dynamic> userData,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );

      userData.update(
        'id',
        (value) => userCredential.user!.uid,
        ifAbsent: () => userCredential.user!.uid,
      );

      await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(userCredential.user!.uid)
          .set(userData);

      return {'success': true, 'message': 'Cadastro com sucesso!'};
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return {'success': false, 'message': 'E-mail já está em uso.'};
      }
      return {'success': false, 'message': 'Falha ao cadastrar!'};
    } catch (e) {
      return {'success': false, 'message': 'Falha ao cadastrar!'};
    }
  }

  Future<Map<String, dynamic>> loginUser({
    required String email,
    required String senha,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("userID", userCredential.user!.uid);
        await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(
              userCredential.user!.uid,
            )
            .get()
            .then((doc) {
          var usuario = UserModel.fromMap(
            doc.data() as Map<String, dynamic>,
          );
        });
      
      return {'success': true};
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return {
          'success': false,
          'message': 'Usuário ou senha inválidos!',
        };
      } else if (e.code == 'wrong-password') {
        return {
          'success': false,
          'message': 'Usuário ou senha inválidos!',
        };
      }

      return {
        'success': false,
        'message': 'Usuário ou senha inválidos!',
      };
    }
  }
}