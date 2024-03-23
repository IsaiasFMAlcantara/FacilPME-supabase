import 'package:facilpme/control/supabaseLogin.dart';
import 'package:flutter/material.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obscureText2 = true;
  bool _formValido = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _confirmarSenhaController = TextEditingController();
  TextEditingController _nomeController = TextEditingController();

  String? _validarCampo(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Preencha o campo $fieldName';
    }
    return null;
  }

  String? _validarEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Preencha o campo e-mail';
    } else if (!email.contains('@') || !email.contains('.')) {
      return 'E-mail inválido';
    }
    return null;
  }

  String? _validarSenha(String? senha) {
    if (senha == null || senha.isEmpty) {
      return 'Preencha o campo senha';
    } else if (senha.length <= 7) {
      return 'A senha deve ter no mínimo 8 caracteres';
    }
    return null;
  }

  String? _validarConfirmarSenha(String? senha) {
    if (senha != _senhaController.text) {
      return 'As senhas não conferem';
    }
    return null;
  }

  void _validarCampos() {
    setState(() {
      _formValido = _formKey.currentState!.validate();
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validarCampos);
    _senhaController.addListener(_validarCampos);
    _confirmarSenhaController.addListener(_validarCampos);
    _nomeController.addListener(_validarCampos);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _confirmarSenhaController.dispose();
    _nomeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'E-mail',
            ),
            onChanged: (_) {
              _validarCampos();
            },
            validator: _validarEmail,
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _nomeController,
            decoration: InputDecoration(
              labelText: 'Nome',
            ),
            onChanged: (_) {
              _validarCampos();
            },
            validator: (value) => _validarCampo(value, 'nome'),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _senhaController,
            obscureText: _obscureText,
            decoration: InputDecoration(
              labelText: 'Senha',
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
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
          SizedBox(height: 20),
          TextFormField(
            controller: _confirmarSenhaController,
            obscureText: _obscureText2,
            decoration: InputDecoration(
              labelText: 'Confirmar senha',
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText2 ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText2 = !_obscureText2;
                  });
                },
              ),
            ),
            onChanged: (_) {
              _validarCampos();
            },
            validator: _validarConfirmarSenha,
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: _formValido
                ? () {
                    if (_formKey.currentState!.validate()) {
                      UserSupabase().signUp(_emailController.text,
                          _senhaController.text, _nomeController.text);
                    }
                  }
                : null,
            child: Text('register'),
          ),
        ],
      ),
    );
  }
}
