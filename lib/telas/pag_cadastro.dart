import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PagCadastro extends StatefulWidget {
  const PagCadastro({super.key});

  @override
  State<PagCadastro> createState() => _PagCadastroState();
}

class _PagCadastroState extends State<PagCadastro> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  Future<void> cadastrar() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: senhaController.text.trim(),
      );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
    content: Text("Conta criada com sucesso!"),
    ),
    );

    Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
    content: Text(e.message ?? "Erro ao cadastrar"),
    ),
    );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: "Nome",
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Senha",
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: cadastrar,
              child: const Text("Criar conta"),
            ),
          ],
        ),
      ),
    );
  }
}
