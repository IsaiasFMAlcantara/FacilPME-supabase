import 'package:facilpme/control/supabaseLogin.dart';
import 'package:flutter/material.dart';

class RecuperarSenha extends StatefulWidget {
  const RecuperarSenha({super.key});

  @override
  State<RecuperarSenha> createState() => _RecuperarSenhaState();
}

class _RecuperarSenhaState extends State<RecuperarSenha> {
  final _formKey = GlobalKey<FormState>();
  bool _formValido = false;

  TextEditingController _emailResetarPassword = TextEditingController();

  void _validacaoFormulario() {
    setState(() {
      _formValido = _formKey.currentState!.validate();
    });
  }

  String? _validarEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Preencha o campo de e-mail';
    } else if (!email.contains('@') || !email.contains('.')) {
      return 'E-mail inválido';
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _emailResetarPassword.addListener(_validacaoFormulario);
  }

  @override
  void dispose() {
    super.dispose();
    _emailResetarPassword.removeListener(_validacaoFormulario);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            obscureText: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _emailResetarPassword,
            decoration: InputDecoration(
              labelText: "E-mail",
            ),
            onChanged: (_) {
              _validacaoFormulario();
            },
            validator: _validarEmail,
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: _formValido
                ? () {
                    if (_formKey.currentState!.validate()) {
                      UserSupabase().forgotPassword(_emailResetarPassword.text);
                    }
                  }
                : null,
            child: Text('Recover Password'),
          ),
        ],
      ),
    );
  }
}
