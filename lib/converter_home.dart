import 'package:flutter/material.dart';

class ConverterHome extends StatefulWidget {
  @override
  State<ConverterHome> createState() => _ConverterHomeState();
}

class _ConverterHomeState extends State<ConverterHome> {
  final List<String> _categories = [
    'Weight',
    'Length',
    'Temperature',
    'Volume',
    'Distance',
  ];
  String _selectedCategory = 'Weight';
  String _fromUnit = 'Kilograms';
  String _toUnit = 'Grams';
  double _inputValue = 0;
  double _result = 0;

  final TextEditingController _controller = TextEditingController();

  final Map<String, List<String>> _unitsMap = {
    'Weight': ['Kilograms', 'Grams'],
    'Length': ['Meters', 'Centimeters'],
    'Temperature': ['Celsius', 'Fahrenheit'],
    'Volume': ['Liters', 'Milliliters'],
    'Distance': ['Kilometers', 'Miles'],
  };

  void _convert() {
    setState(() {
      _inputValue = double.tryParse(_controller.text) ?? 0;

      if (_selectedCategory == 'Weight') {
        if (_fromUnit == 'Kilograms' && _toUnit == 'Grams') {
          _result = _inputValue * 1000;
        } else if (_fromUnit == 'Grams' && _toUnit == 'Kilograms') {
          _result = _inputValue / 1000;
        } else {
          _result = _inputValue;
        }
      } else if (_selectedCategory == 'Length') {
        if (_fromUnit == 'Meters' && _toUnit == 'Centimeters') {
          _result = _inputValue * 100;
        } else if (_fromUnit == 'Centimeters' && _toUnit == 'Meters') {
          _result = _inputValue / 100;
        } else {
          _result = _inputValue;
        }
      } else if (_selectedCategory == 'Temperature') {
        if (_fromUnit == 'Celsius' && _toUnit == 'Fahrenheit') {
          _result = (_inputValue * 9 / 5) + 32;
        } else if (_fromUnit == 'Fahrenheit' && _toUnit == 'Celsius') {
          _result = (_inputValue - 32) * 5 / 9;
        } else {
          _result = _inputValue;
        }
      } else if (_selectedCategory == 'Volume') {
        if (_fromUnit == 'Liters' && _toUnit == 'Milliliters') {
          _result = _inputValue * 1000;
        } else if (_fromUnit == 'Milliliters' && _toUnit == 'Liters') {
          _result = _inputValue / 1000;
        } else {
          _result = _inputValue;
        }
      } else if (_selectedCategory == 'Distance') {
        if (_fromUnit == 'Kilometers' && _toUnit == 'Miles') {
          _result = _inputValue * 0.621371;
        } else if (_fromUnit == 'Miles' && _toUnit == 'Kilometers') {
          _result = _inputValue / 0.621371;
        } else {
          _result = _inputValue;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Devnity Solutions Unit Converter')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(image: AssetImage('assets/images/unit.jpg'),)),
            SizedBox(height: 20,),
            Container(
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: DropdownButton<String>(
                  value: _selectedCategory,
                  onChanged: (val) {
                    setState(() {
                      _selectedCategory = val!;
                      _fromUnit = _unitsMap[_selectedCategory]!.first;
                      _toUnit = _unitsMap[_selectedCategory]!.last;
                    });
                  },
                  items:
                      _categories
                          .map(
                            (e) => DropdownMenuItem(child: Text(e), value: e),
                          )
                          .toList(),
                  underline: Container(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: DropdownButton<String>(
                      value: _fromUnit,
                      onChanged: (val) => setState(() => _fromUnit = val!),
                      items:
                          _unitsMap[_selectedCategory]!
                              .map(
                                (e) =>
                                    DropdownMenuItem(child: Text(e), value: e),
                              )
                              .toList(),
                      underline: Container(),
                    ),
                  ),
                ),
                const Icon(Icons.compare_arrows),
                Container(
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: DropdownButton<String>(
                      value: _toUnit,
                      onChanged: (val) => setState(() => _toUnit = val!),
                      items:
                          _unitsMap[_selectedCategory]!
                              .map(
                                (e) =>
                                    DropdownMenuItem(child: Text(e), value: e),
                              )
                              .toList(),
                      underline: Container(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter value',
                  contentPadding: EdgeInsets.only(left: 20),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convert,
              child: Text('Convert'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // Text color
                minimumSize: Size(
                  double.infinity,
                  50,
                ), // Full width and fixed height
              ),
            ),
            SizedBox(height: 20),
            Text('Result: $_result', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
