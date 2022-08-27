import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  List<String> write = [''];
  String counter = '';
  String temporaryValue = '';

  onEnter(String symbol) {
    counter = counter + symbol;

    if (symbol != "x" &&
        symbol != "%" &&
        symbol != "/" &&
        symbol != "*" &&
        symbol != "-" &&
        symbol != "+") {
      temporaryValue = temporaryValue + symbol;
    }
    addToWrite(symbol);
    setState(() {});
    print(write);
  }

  calculate() {
    write.add(temporaryValue);

    for (int i = 0; i < write.length; i++) {
      if (i == 0) {
        counter = write[0];
      } else {
        if (write[i - 1] == "+") {
          double a = double.parse(counter);
          double b = double.parse(write[i]);
          double c = a + b;
          counter = c.toString();
        }
      }
    }
    //temporaryValue = '';
    write = [];

    setState(() {});
  }

  addToWrite(String item) {
    if (item == "+") {
      write.add(temporaryValue);
      temporaryValue = '';
      write.add('+');
    }
    if (item == "/") {
      write.add(temporaryValue);
      temporaryValue = '';
      write.add('/');
    }
    if (item == "*") {
      write.add(temporaryValue);
      temporaryValue = '';
      write.add('*');
    }
    if (item == "-") {
      write.add(temporaryValue);
      temporaryValue = '';
      write.add('-');
    }
    if (item == "x") {
      write.add(temporaryValue);
      temporaryValue = '';
      write.add('x');
    }
    if (item == "C") {
      counter = "";
      write = [];
      temporaryValue = "";
    }
    setState(() {});
  }

  button(String nameButton) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10.00),
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(-1.0, -1.0),
                blurRadius: 4.00),
          ],
        ),
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.1,
        child: ElevatedButton(
          onPressed: () {
            onEnter(nameButton);
          },
          child: Text(nameButton, style: TextStyle(color: Colors.white)),
        ));
  }

  bigButton(String nameButton) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10.00),
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(-1.0, -1.0),
                blurRadius: 4.00),
          ],
        ),
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.1 * 2 +
            MediaQuery.of(context).size.height * 0.015,
        child: ElevatedButton(
          onPressed: () {
            calculate();
          },
          child: Text(nameButton, style: TextStyle(color: Colors.white)),
        ));
  }

  spase() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.015,
    );
  }

  @override
  Widget build(BuildContext context) {
    print(counter);
    print(temporaryValue);
    return (Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 229),
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Text(
              '$counter',
              style: const TextStyle(fontSize: 72.00),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.00),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 4.00),
              ],
            ),
          ),
          spase(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button(
                "x",
              ),
              button(
                "%",
              ),
              button(
                "/",
              ),
              button(
                "*",
              )
            ],
          ),
          spase(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button(
                "7",
              ),
              button(
                "8",
              ),
              button(
                "9",
              ),
              button(
                "-",
              )
            ],
          ),
          spase(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button(
                "4",
              ),
              button(
                "5",
              ),
              button(
                "6",
              ),
              button(
                "+",
              )
            ],
          ),
          spase(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button(
                    "1",
                  ),
                  spase(),
                  button(
                    "C",
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button(
                    "2",
                  ),
                  spase(),
                  button(
                    "0",
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button(
                    "3",
                  ),
                  spase(),
                  button(
                    ".",
                  )
                ],
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.00),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(-1.0, -1.0),
                          blurRadius: 4.00),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.1 * 2 +
                      MediaQuery.of(context).size.height * 0.015,
                  child: ElevatedButton(
                    onPressed: () {
                      calculate();
                    },
                    child: Text('=', style: TextStyle(color: Colors.white)),
                  ))
            ],
          ),
        ],
      ),
    ));
  }
}
