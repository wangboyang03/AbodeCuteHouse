import 'package:flutter/material.dart';

import 'components/HouseItem.dart';

class HouseList extends StatefulWidget {
  const HouseList({super.key});
  @override
  State<HouseList> createState() => HouseListState();
}

class HouseListState extends State<HouseList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的房屋'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 241, 238, 238),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80, left: 10, right: 10),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return const HouseItem();
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(height: 10, color: const Color.fromARGB(255, 241, 238, 238));
              },
              itemCount: 5,
            ),
          ),
          Positioned(bottom: 0, left: 0, right: 0, child: Container(
            padding: const EdgeInsets.all(10),
            color: Colors.transparent,
            child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: const Column(
                        children: [
                          SizedBox(height: 5),
                          Icon(Icons.add),
                          Text('添加房屋'),
                          SizedBox(height: 5),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
          )

          )
        ],
      ),
    );
  }
}
