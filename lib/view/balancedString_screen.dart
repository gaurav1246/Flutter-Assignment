import 'package:fibonacci/utils/stringUtils.dart';
import 'package:fibonacci/view/constant/contant_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum RESPONSES {
  STRINGEMPTY,
  INVALIDCHARTERS,
  BALANCED,
  NOTBALANCED,
  ERROR,
}

extension ParseToString on RESPONSES {
  String toShortString() {
    return toString().split('.').last;
  }
}

class BalancedStringScreen extends StatefulWidget {
  const BalancedStringScreen({super.key});

  @override
  State<BalancedStringScreen> createState() => _BalancedStringScreenState();
}

class _BalancedStringScreenState extends State<BalancedStringScreen> {
  final myController = TextEditingController();
  final StringBuffer _result = StringBuffer();
  Map<int, int> counts = {};

  Future<void> _CheckString(String inputString) async {
    _result.clear();
    _result.write('Entered String is :$inputString');
    _result.write('\nRunning Algo...,please wait');
    setState(() {});
    //Step1: check for valid String
    //check for empty, charcters only a-z
    if (inputString.isEmpty) {
      debugPrint('String is empty');
      writelog(RESPONSES.STRINGEMPTY.toShortString());
      return;
    }
    if (!RegExp('[a-z]').hasMatch(inputString)) {
      //input validation fails
      debugPrint('input validation fails...');

      writelog(RESPONSES.INVALIDCHARTERS.toShortString());
      return;
    }
    /******************************************************/
    //Step2: check for the charcter count shoud be equal for the charctes of the String
    //For example, "aabbab" is balanced (both 'a' and 'b' occur three times) but "aabba" is not balanced ('a' occurs three times, 'b' occurs two times).
    //Step3: check if the String made up of 2 charcters only else return not balanced
    //The string "aabbcc" is also not balanced (it contains three different letters).
    if (await _isValidCount(inputString)) {
      writelog(RESPONSES.BALANCED.toShortString());
    } else {
      writelog(RESPONSES.NOTBALANCED.toShortString());
    }
    /******************************************************/
    //step4: create the substring
    //returns the list of the longest balanced substring of S.
    List<String> res = await _getBalancedSubstring(inputString);
    writelog('balanced list = ${res.toString()}');
    //setState(() {});
  }

  Future<bool> _isValidCount(String s) async {
    // count letters
    counts = <int, int>{};
    for (var c in s.codeUnits) {
      counts[c] = counts.putIfAbsent(c, () => 0) + 1;
    }

// print counts
    debugPrint(counts.toString());

    if (counts.length == 1 || counts.length > 2) {
      //writelog(RESPONSES.NOTBALANCED.toShortString());
      return false;
    } else if (counts.length == 2) {
      List<int> charCount = <int>[];
      for (var c in counts.keys) {
        charCount.add(counts[c]!);
      }
      debugPrint(
          '0th: ${charCount[0].toString()}, 1st: ${charCount[1].toString()} ');
      if (charCount[0] == charCount[1]) {
        //writelog(RESPONSES.BALANCED.toShortString());
        return true;
      } else {
        //writelog(RESPONSES.NOTBALANCED.toShortString());
        false;
      }
    } else {
      //writelog(RESPONSES.NOTBALANCED.toShortString());
      false;
    }

    return false;
  }

  writelog(String s) {
    _result.write('\n$s');
    setState(() {});
  }

  Future<List<String>> _getBalancedSubstring(String inputString) async {
    if (counts.length == 1) {
      return [];
    }
    List<String> list = [];
    int n = inputString.length;
    var tlist = [];
    for (int i = 0; i < n; i++) {
      if (tlist.isEmpty) {
        tlist.add(inputString.codeUnits[i]);
      } else {
        if (tlist.length == 1) {
          tlist.add(inputString.codeUnits[i]);
        } else {
          if (tlist.last == inputString.codeUnits[i] &&
              tlist[tlist.length - 2] == inputString.codeUnits[i]) {
            tlist.clear();
          } else if (tlist.last != inputString.codeUnits[i] &&
              tlist[tlist.length - 2] != inputString.codeUnits[i]) {
            //time to send list for checkup
            StringBuffer buf = StringBuffer();
            for (var ch in tlist) {
              buf.write(String.fromCharCode(ch));
            }
            if (await _isValidCount(buf.toString())) {
              list.add(buf.toString());
              tlist.clear();
            }
          } else {
            tlist.add(inputString.codeUnits[i]);
          }
        }
      }
    }
    return list;
  }

  bool check(String s, int i, int j) {
    int cnt = 0;
    for (int k = i; k <= j; ++k) {
      if (s.codeUnits[k] == '1') {
        ++cnt;
      } else if (cnt > 0) {
        return false;
      }
    }
    return cnt * 2 == j - i + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        surfaceTintColor: Colors.blue,
        title: Text(StringUtils.balancedString),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                StringUtils.enterTheStringForBalanceCheck,
              ),
              TextField(
                decoration: commonDecoration(context: context),
                controller: myController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[a-z]')),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                    onTap: () {
                      _CheckString(myController.text);
                    },
                    child: Container(
                        decoration: customButtonDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, right: 12, top: 4, bottom: 4),
                          child: Text(StringUtils.findResult),
                        ))),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(StringUtils.resultIs),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(_result.toString()),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
}
