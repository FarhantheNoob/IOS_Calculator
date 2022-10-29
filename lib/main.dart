import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget calcBtn(String text, Color btnColor, Color txtColor) {
    return InkWell(
      borderRadius: BorderRadius.circular(50.0),
      onTap: () {
        calculation(text);
      },
      child: Ink(
        //padding: const EdgeInsets.all(20.0),
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: btnColor,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: txtColor,
              fontSize: 32,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '$text',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 100,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcBtn(
                  'AC',
                  Colors.grey,
                  Colors.black,
                ),
                calcBtn(
                  '+/-',
                  Colors.grey,
                  Colors.black,
                ),
                calcBtn(
                  '%',
                  Colors.grey,
                  Colors.black,
                ),
                calcBtn(
                  '/',
                  const Color(0xffFFA000),
                  Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcBtn(
                  '7',
                  const Color(0xff1E1E1E),
                  Colors.white,
                ),
                calcBtn(
                  '8',
                  const Color(0xff1E1E1E),
                  Colors.white,
                ),
                calcBtn(
                  '9',
                  const Color(0xff1E1E1E),
                  Colors.white,
                ),
                calcBtn(
                  'x',
                  const Color(0xffFFA000),
                  Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcBtn(
                  '4',
                  const Color(0xff1E1E1E),
                  Colors.white,
                ),
                calcBtn(
                  '5',
                  const Color(0xff1E1E1E),
                  Colors.white,
                ),
                calcBtn(
                  '6',
                  const Color(0xff1E1E1E),
                  Colors.white,
                ),
                calcBtn(
                  '-',
                  const Color(0xffFFA000),
                  Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcBtn(
                  '1',
                  const Color(0xff1E1E1E),
                  Colors.white,
                ),
                calcBtn(
                  '2',
                  const Color(0xff1E1E1E),
                  Colors.white,
                ),
                calcBtn(
                  '3',
                  const Color(0xff1E1E1E),
                  Colors.white,
                ),
                calcBtn(
                  '+',
                  const Color(0xffFFA000),
                  Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(50.0),
                  onTap: () {},
                  child: Ink(
                    width: 160,
                    height: 70,
                    padding: const EdgeInsets.only(left: 30,),
                    decoration: BoxDecoration(
                      color: const Color(0xff1E1E1E),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '0',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                    ),
                  ),
                ),
                calcBtn(
                  '.',
                  const Color(0xff1E1E1E),
                  Colors.white,
                ),
                calcBtn(
                  '=',
                  const Color(0xffFFA000),
                  Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //Calculator logic
  dynamic text ='0';

  double numOne = 0;

  double numTwo = 0;

  dynamic result = '';

  dynamic finalResult = '';

  dynamic opr = '';

  dynamic preOpr = '';

  void calculation(btnText) {


    if(btnText  == 'AC') {
      text ='0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';

    } else if( opr == '=' && btnText == '=') {

      if(preOpr == '+') {
        finalResult = add();
      } else if( preOpr == '-') {
        finalResult = sub();
      } else if( preOpr == 'x') {
        finalResult = mul();
      } else if( preOpr == '/') {
        finalResult = div();
      }

    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

      if(numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if(opr == '+') {
        finalResult = add();
      } else if( opr == '-') {
        finalResult = sub();
      } else if( opr == 'x') {
        finalResult = mul();
      } else if( opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    }
    else if(btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if(btnText == '.') {
      if(!result.toString().contains('.')) {
        result = result.toString()+'.';
      }
      finalResult = result;
    }

    else if(btnText == '+/-') {
      result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();
      finalResult = result;

    }

    else {
      result = result + btnText;
      finalResult = result;
    }


    setState(() {
      text = finalResult;
    });

  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {

    if(result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if(!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}
