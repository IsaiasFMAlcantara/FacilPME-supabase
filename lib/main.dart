import 'package:facilpme/utils/app.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'control/credenciais.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: CredenciaisSupabase.url,
    anonKey: CredenciaisSupabase.key,
  );
  runApp(App());
}
