import 'package:supabase_flutter/supabase_flutter.dart';

class UserSupabase {
  final supabase = Supabase.instance.client;

  // Função de realizar login
  Future<void> signIn(String email, String password) async {
    try {
      final response = await supabase.auth
          .signInWithPassword(email: email, password: password);
    } on AuthException catch (e) {
      print('>>> ERROR: ${e}');
    }
  }

  // Função de cadastrar usuário
  Future<void> signUp(String email, String password, String nome) async {
    try {
      final response = await supabase.auth
          .signUp(email: email, password: password, data: {'username': nome});
    } on AuthException catch (e) {
      print('>>> ERROR: ${e}');
    }
  }

  // Função de recuperar senha
  Future<void> forgotPassword(String email) async {
    try {
      final response = await supabase.auth.resetPasswordForEmail(email);
    } on AuthException catch (e) {
      print('>>> ERROR: ${e}');
    }
  }

  // Função de deslogar
  Future<void> signOut() async {
    try {
      final response = await supabase.auth.signOut();
    } on AuthException catch (e) {
      print('>>> ERROR: ${e}');
    }
  }

  // Função de atualizar informações do usuário
  Future<void> updateInforUser(
    String email,
    String nome,
    String password,
  ) async {
    try {
      final UserResponse response = await supabase.auth.updateUser(
          UserAttributes(
              email: email, password: password, data: {'username': nome}));
    } on AuthException catch (e) {
      print('>>> ERROR: ${e}');
    }
  }
}
