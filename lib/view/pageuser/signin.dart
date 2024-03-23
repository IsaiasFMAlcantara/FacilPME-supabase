import 'package:facilpme/control/supabaseLogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  final _formkey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _formValido = false;

  TextEditingController _emailvalido = TextEditingController();
  TextEditingController _senhavalida = TextEditingController();

  String? _validarEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Fill in the email field';
    } else if (!email.contains('@') || !email.contains('.')) {
      return 'Email inválido';
    }
    return null;
  }

  String? _validarSenha(String? senha) {
    if (senha == null || senha.isEmpty) {
      return 'Fill in the password field';
    } else if (senha.length <= 7) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  void _validarCampos() {
    setState(() {
      _formValido = _formkey.currentState!.validate();
    });
  }

  @override
  void initState() {
    super.initState();
    _emailvalido.addListener(_validarCampos);
    _senhavalida.addListener(_validarCampos);
  }

  @override
  void dispose() {
    super.dispose();
    _emailvalido.removeListener(_validarCampos);
    _senhavalida.removeListener(_validarCampos);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            obscureText: false,
            autovalidateMode: AutovalidateMode.always,
            controller: _emailvalido,
            decoration: InputDecoration(
              labelText: "E-mail",
            ),
            onChanged: (_) {
              _validarCampos();
            },
            validator: _validarEmail,
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            autofocus: false,
            obscureText: _obscureText,
            autovalidateMode: AutovalidateMode.always,
            controller: _senhavalida,
            decoration: InputDecoration(
              labelText: "Password",
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
            onChanged: (_) {
              _validarCampos();
            },
            validator: _validarSenha,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.offNamed('/esqueci_senha');
                },
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: _formValido
                ? () {
                    if (_formkey.currentState!.validate()) {
                      UserSupabase()
                          .signIn(_emailvalido.text, _senhavalida.text);
                    }
                  }
                : null,
            child: Text('Sign In'),
          ),
        ],
      ),
    );
  }
}
