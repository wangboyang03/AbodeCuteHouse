import 'package:flutter/material.dart';

class HouseItem extends StatefulWidget {
  const HouseItem({super.key, required this.data});
  final Map<String, dynamic> data;

  @override State<HouseItem> createState() => HouseItemState();
}

class HouseItemState extends State<HouseItem> {
  @override Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Row(children: [
              Expanded(child: Text(widget.data["point"] ?? "暂无小区")),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                decoration: BoxDecoration(color: const Color.fromARGB(50, 91, 177, 227), borderRadius: BorderRadius.circular(5)),
                child: const Text('已绑定', style: TextStyle(color: Color.fromARGB(255, 85, 145, 175)))
              )
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Text('房间号', style: TextStyle(color: Colors.grey)),
              Spacer(),
              Expanded(child: Text('${widget.data["building"]}${widget.data["room"]}', textAlign: TextAlign.right))
            ],
          ),
          SizedBox(height: 15), 
          Row(
            children: [
              Text('业主', style: TextStyle(color: Colors.grey)),
              Spacer(),
              Expanded(child: Text(widget.data["name"], textAlign: TextAlign.right))
            ],
          ),
        ],
      ),
    );
  }
}