import 'dart:math';


class RandomLib{
  static int RandomVal(int min, int max){
    int num=0;
    Random random = new Random();
    num= min+random.nextInt(max-min);
    return num;
  }
}