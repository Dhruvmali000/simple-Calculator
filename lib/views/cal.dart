import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x = 0;
  int y = 0;
  num z = 0;
  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();

    _listener = AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onResume: _onResume,
      onDetach: _onDetach,
      onInactive: _onInactive,
      onPause: _onPause,
      onRestart: _onRestart,
      onStateChange: _onStateChange,
      // onExitRequested: _onExitRequested,
    );
  }

  void _onShow() => print("onShow called");
  void _onHide() => print("onHide called");
  void _onResume() => print("onResume called");
  void _onDetach() => print("onDetach called");
  void _onPause() => print("onPause called");
  void _onInactive() => print("onInactive called");
  void _onRestart() => print("onRestart called");
  void _onStateChange(AppLifecycleState state) {
    print("onStateChanged called with state:$state");
  }

  @override
  void dispose() {
    displayOneController.dispose();
    displayTwoController.dispose();
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(23.0),
      child: Column(
        children: [
          CalDisplay(
              key: const Key("display One"),
              hint: "Enter First Number",
              controller: displayOneController),
          const SizedBox(
            height: 20,
          ),
          CalDisplay(
              key: const Key("display Two"),
              hint: "Enter Second Number",
              controller: displayTwoController),
          const SizedBox(
            height: 20,
          ),
          Text(
            key: const Key('Result'),
            z.toString(),
            style: const TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! +
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! -
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! *
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! /
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.divide),
              ),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  setState(() {
                    x = 0;
                    y = 0;
                    z = 0;
                    displayOneController.clear();
                    displayTwoController.clear();
                  });
                },
                label: const Text("Clear"),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class CalDisplay extends StatelessWidget {
  const CalDisplay(
      {super.key, this.hint = "Enter a number", required this.controller});

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      keyboardAppearance: Brightness.dark,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2.5,
              color: Colors.cyanAccent,
            ),
            borderRadius: BorderRadius.circular(100)),
        border: const OutlineInputBorder(
            borderSide: BorderSide(
          width: 2.5,
          color: Colors.cyanAccent,
        )),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.cyan,
        ),
      ),
    );
  }
}
