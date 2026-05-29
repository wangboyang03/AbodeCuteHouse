import 'package:flutter/material.dart';

class HouseItem extends StatefulWidget {
  const HouseItem({super.key, required this.data});
  final Map<String, dynamic> data;

  @override State<HouseItem> createState() => HouseItemState();
}

class HouseItemState extends State<HouseItem> {
  // 返回枚举房屋状态
  String getStatusText(int val) {
    switch (val) {
      case 1:
        return "审核中";
      case 2:
        return "审核成功";
      case 3:
        return "审核失败";
      default:
    }
    return "未知状态";
  }

  // 返回背景色和前景色
  List<Color> getStatusColor(int val) {
    switch (val) {
      case 1:
        return [
          const Color.fromARGB(255, 150, 198, 237),
          const Color.fromARGB(255, 5, 130, 233)
        ];
      case 2:
        return [
          const Color.fromARGB(255, 190, 240, 186),
          const Color.fromARGB(255, 42, 239, 11)
        ];
      case 3:
        return [
          const Color.fromARGB(255, 239, 223, 195),
          const Color.fromARGB(255, 239, 145, 5)
        ];
      default:
    }
    return [];
  }

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
                decoration: BoxDecoration(color: getStatusColor(widget.data["status"])[0], borderRadius: BorderRadius.circular(5)),
                child: Text(getStatusText(widget.data["status"]), style: TextStyle(color: getStatusColor(widget.data["status"])[1]))
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