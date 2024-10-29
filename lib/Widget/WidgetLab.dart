import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(top: 35,left: 20,right: 20),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(

                  child:  Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 110),
                          child: const Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.grey),
                              Text("Donnerville Drive"),
                              Icon(Icons.arrow_drop_down, color: Colors.grey),
                            ],
                          )
                      ),
                      const Row(
                        children: [
                          Text("4 Donnerville Hall, Donnerville Drive, Admaston...",style: TextStyle(fontSize: 11,color: Colors.grey),)
                        ],
                      )
                    ],
                  ),

                )


              ],
            ),
            Stack(
              children: [

                Container(
                  decoration: BoxDecoration(
                      border:Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(18)
                  )
                  ,
                  child: IconButton(onPressed:() {}, icon: Icon(Icons.notifications_none,size: 35,)) ,
                ),



                Container(


                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  constraints: const BoxConstraints(
                    minWidth: 10,
                    minHeight: 10,
                  ),
                  child:const Text("12",style:TextStyle(color: Colors.white) ,),
                ),


              ],
            ),


          ],

        ),

      ),

    );
  }
}



