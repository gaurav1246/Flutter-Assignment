import 'package:fibonacci/controller/fibonacciScreen_Controller.dart';
import 'package:fibonacci/utils/stringUtils.dart';
import 'package:fibonacci/view/constant/contant_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FibonacciScreen extends StatefulWidget {
  const FibonacciScreen({super.key});

  @override
  State<FibonacciScreen> createState() => _FibonacciScreenState();
}

class _FibonacciScreenState extends State<FibonacciScreen> {
  final _formKey = GlobalKey<FormState>();

  BigInt fibonacciSeries = BigInt.zero;
  bool isLoading = false;

  Map<BigInt, BigInt> storage = {
    BigInt.one: BigInt.one,
    BigInt.two: BigInt.one
  };

  TextEditingController numb = TextEditingController();

  void generateFibonacci() {
    try {
      setState(() {
        isLoading = true;
        BigInt _text = BigInt.parse(numb.value.text);
        fibonacciSeries = BigInt.parse("${recursiveFibwithMemory(_text)}");
      });

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("error :: ${e.toString()}");
      Get.snackbar(StringUtils.alert, "Error :: ${e.toString()}");
    }
  }

  BigInt recursiveFibwithMemory(BigInt n) {
    if (!storage.containsKey(n)) {
      storage[n] = recursiveFibwithMemory(n - BigInt.one) +
          recursiveFibwithMemory(n - BigInt.two);
    }
    return storage[n] as BigInt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        surfaceTintColor: Colors.blue,
        title: const Text(StringUtils.fibonacciSeries),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Enter Number".toUpperCase(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: commonDecoration(context: context),
                        controller: numb,
                        keyboardType: TextInputType.number,
                        validator: (value) =>
                            value!.isEmpty ? "Please Enter Value" : null,
                        readOnly: isLoading == true
                            ? true
                            : fibonacciSeries == BigInt.zero
                                ? false
                                : true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                if (fibonacciSeries != BigInt.zero) {
                                  setState(() {
                                    numb.clear();
                                    fibonacciSeries = BigInt.zero;
                                  });
                                } else {
                                  setState(() {
                                    fibonacciSeries = BigInt.zero;
                                    generateFibonacci();
                                  });
                                }
                              }
                            },
                            child: Container(
                                decoration: customButtonDecoration(),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 8.0, right: 8, top: 4, bottom: 4),
                                  child: fibonacciSeries == BigInt.zero
                                      ? Text(StringUtils.findResult)
                                      : Text(StringUtils.reset),
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          "${fibonacciSeries == BigInt.zero ? "" : fibonacciSeries.toString().length > 100 ? '\u221e \n\n Result is too large that reaches to infinity so showing infinity sign ' : fibonacciSeries}",
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
