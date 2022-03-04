// ignore_for_file: non_constant_identifier_names

import 'dart:math';


class RandomLib{
  static int RandomVal(int min, int max){
    int num=0;
    Random random = Random();
    num= min+random.nextInt(max-min);
    return num;
  }
}