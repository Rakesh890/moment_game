import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';

class HomeController extends GetxController
{
  //Init Random Number
  Random random = Random();
  var randomNumber = 0.obs;
  List bubbleList = [].obs;
  var selectedBubbleItem = [].obs;
  var score = 0.obs;
  Timer? countdownTimer;
  final seconds = 0.obs;
  late Duration myDuration = Duration(seconds: 1);

  @override
  void onInit() {
    // TODO: implement onInit
    initBubbles();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void initBubbles()
  {
    bubbleList.clear();
    selectedBubbleItem.clear();
    for(var i=0+1; i < 31; i++){
      bubbleList.add(i);
      selectedBubbleItem.add("0");
    }
    bubbleList.shuffle();
    //randomItem = (bubbleList.toList()..shuffle()).first;
    printInfo(info: "My Random Number is ${bubbleList}");
    strDigits(60);
  }

  clickOnBubble(int index,int value)async
  {
    // for(var i=1)
    // if(selectedBubbleItem[index] == value){
    selectedBubbleItem[index] = value;
    new Future.delayed(const Duration(seconds: 1), ()
    {
      if(selectedBubbleItem[index] == value){
        bubbleList.remove(value);
        print(bubbleList.length);
      }else if(bubbleList.length == 0){
        selectedBubbleItem.clear();
      }
    });
    score.value += 1;

  }



  strDigits(remainder) {
    seconds.value = myDuration.inSeconds.remainder(60);
  }


}