import 'package:calculadora_imc/app/src/calculadora/widgets/informacoes_widget.dart';
import 'package:calculadora_imc/app/src/calculadora/widgets/input_widget.dart';
import 'package:flutter/material.dart';

class CalculadoraImc extends StatefulWidget {
  const CalculadoraImc({Key? key}) : super(key: key);

  @override
  State<CalculadoraImc> createState() => _CalculadoraImcState();
}

class _CalculadoraImcState extends State<CalculadoraImc> {
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();
  String resultado = 'Resultado a ser exibido:';
  String classificacao = 'Classificação:';
  String grauObsedidade = 'Grau de obesidade:';
  GlobalKey<FormState> keyValue = GlobalKey<FormState>();
  void limparTela() {
    peso.text = '';
    altura.text = '';
    resultado = '';
    classificacao = '';
    grauObsedidade = '';
    keyValue = GlobalKey<FormState>();
  }

  void calcularImc() {
    setState(() {
      double valorPeso = double.parse(peso.text);
      double valorAltura = double.parse(altura.text) / 100;
      double imc = valorPeso / (valorAltura * valorAltura);

      // Lógica do IMC
      if (imc < 18.5) {
        resultado = 'Resultado é: ${imc.toStringAsPrecision(4)}';
        classificacao = 'Sua classificação é de: MAGREZA';
        grauObsedidade = 'Grau de obesidade é de: 0';
      }else if( imc >= 18.5 && imc <= 24.9 ){
        resultado = 'Resultado é: ${imc.toStringAsPrecision(4)}';
        classificacao = 'Sua classificação é de: NORMAL';
        grauObsedidade = 'Grau de obesidade é de: 0';
      }else if(imc >= 25.0 && imc <= 29.9){
        resultado = 'Resultado é: ${imc.toStringAsPrecision(4)}';
        classificacao = 'Sua classificação é de: SOBREPESO';
        grauObsedidade = 'Grau de obesidade é de: I';
      }else if(imc >= 30.0 && imc <= 39.9){
        resultado = 'Resultado é: ${imc.toStringAsPrecision(4)}';
        classificacao = 'Sua classificação é de: OBESIDADE';
        grauObsedidade = 'Grau de obesidade é de: II';
      }
      else if(imc >= 40.0){
        resultado = 'Resultado é: ${imc.toStringAsPrecision(4)}';
        classificacao = 'Sua classificação é de: OBESIDADE GRAVE';
        grauObsedidade = 'Grau de obesidade é de: III';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: limparTela)
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.person_outlined,
                size: 120.0,
              ),
              InputWidget(
                keyValue:keyValue,
                controllerPeso: peso,
                textoPeso: 'Peso em KG',
                controllerAltura: altura,
                textoAltura: 'Altura em CM',
                
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child:  SizedBox(
                    height: 100.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if(keyValue.currentState!.validate()){
                          calcularImc();
                        }
                      },
                      child: const Text('Calcular',
                          style:  TextStyle(fontSize: 25.0)),
                    )),
              ),
              InformacoesWidget(
                resultado: resultado,
                classificacao: classificacao,
                grauObesidade: grauObsedidade,

              )
            ],
          ),
        ),
      ),
    );
  }
}
