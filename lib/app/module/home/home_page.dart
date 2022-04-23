import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:moment_game/app/module/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Obx(() {
            return Column(
              children: [
                Container(
                  height: 60,
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Text("Timer : ${controller.myDuration}",style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,fontWeight: FontWeight.w500
                      ),),
                      Spacer(),
                      Text("Count : ${controller.score.value}",style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,fontWeight: FontWeight.w500
                      ),),
                      SizedBox(width: 10,),
                    ],
                  ),
                ),
                Expanded(
                  child: MasonryGridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    padding: EdgeInsets.all(10),
                    itemCount: controller.bubbleList.length,
                    itemBuilder: (context, index) {
                      return _buildBubbleView(index, controller.bubbleList[index]);
                    },
                  ),
                ),
              ],
            );
          })),
    );
  }

  Widget _buildBubbleView(index, bubbleList) {
    return Obx(() {
      if(controller.selectedBubbleItem[index] != bubbleList){
        return GestureDetector(
          onTap: () => controller.clickOnBubble(index, bubbleList),
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: Container(
              width: 80, height: 80,
              decoration: BoxDecoration(
                  image:
                  const DecorationImage(
                      image: AssetImage("assets/images/blue_bubble.png"))
              ),
              child: Center(child: Text(bubbleList.toString(), style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 18
              ),)),
            ),
          ),
        );
      }else{
        return ClipOval(
          child: Image.asset("assets/images/animation_popped.gif",
            width: 80,height: 80,fit: BoxFit.cover,
          ),
        );
      }

    });
  }
}