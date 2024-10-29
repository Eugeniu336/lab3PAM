import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Container(

        margin: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey),

        ),
        padding: EdgeInsets.symmetric(horizontal: 10) ,
        child: const Row(
          children: [
            Icon(Icons.search, color: Colors.grey),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                ),
              ),
            ),
            Text("|  ",style: TextStyle(fontSize: 20,color: Colors.grey),),
            Icon(Icons.mic, color: Colors.grey),

          ],
        ),
      ),

    );
  }
}



