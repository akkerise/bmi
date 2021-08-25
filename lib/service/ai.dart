import 'dart:math';

class AI {
  double _bmi = 0.0;

  AI({required this.weight, required this.height});

  final int weight;
  final int height;

  String predict() {
    double _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String result() {
    if(_bmi > 25){
      return 'Overweight';
    }else if (_bmi > 18.5 ) {
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }
}