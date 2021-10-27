import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dialpad(),
    ),
  );
}

class Dialpad extends StatefulWidget {
  @override
  _DialpadState createState() => _DialpadState();
}

class _DialpadState extends State<Dialpad> {
  List<String> text = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'Clear',
    '0',
    '+'
  ];
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            height: 190,
            padding: EdgeInsets.only(top: 0, left: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(49)),
              color: Colors.yellow,
            ),
            child: Container(
              padding: EdgeInsets.only(top: 60, left: 40),
              child: TextField(
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                    color: Colors.blue),
                controller: _controller,
                cursorWidth: 420,
                cursorColor: Colors.yellow,
                maxLength: 13,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Dial a number'),
              ),
            ),
          ),
          Flexible(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.95,
                ),
                itemCount: 12,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.text = _controller.text + text[i];

                        print(text[i]);
                      });

                      if (i == 9) {
                        _controller.clear();
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        text[i],
                        style: TextStyle(
                          fontSize: 39,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(95)),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
