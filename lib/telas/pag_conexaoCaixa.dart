import 'package:flutter/material.dart';
import 'package:bluetooth_serial_android/bluetooth_serial_android.dart';

class PagConexaoCaixa extends StatefulWidget {
  const PagConexaoCaixa({super.key});

  // IDENTIDADE VISUAL -- PALETA DE CORES DO CAREBOX
  static const Color azulEscuro = Color(0xFF008C95);
  static const Color azulClaro = Color(0xFF00A4B3);
  static const Color azulSuave = Color(0xFF6FBEE3);
  static const Color verde = Color(0xFF7CC8A2);
  static const Color cinzaEscuro = Color(0xFF333333);

  @override
  State<PagConexaoCaixa> createState() => _PagConexaoCaixaState();
}

class _PagConexaoCaixaState extends State<PagConexaoCaixa> {
  String status = "Desconectado";

  Future<void> conectarEEnviar() async {
    try {
      setState(() {
        status = "Solicitando permissões...";
      });

    await FlutterBluetoothSerial.ensurePermissions();

    setState(() {
    status = "Conectando à caixa...";
    });

    await FlutterBluetoothSerial.connect(
    "00:21:13:02:17:9E",
    );

    setState(() {
    status = "Abrindo compartimento...";
    });

    await FlutterBluetoothSerial.write("1");

    setState(() {
    status = "Comando enviado!";
    });
    } catch (e) {
    setState(() {
    status = "Erro: $e";
    });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CareBox"),
      ),
      body: Center(
        child: Text(
          status,
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: conectarEEnviar,
        child: const Icon(Icons.bluetooth),
      ),
    );
  }
}
