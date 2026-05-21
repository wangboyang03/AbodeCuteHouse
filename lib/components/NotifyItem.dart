import 'package:flutter/material.dart';

class NotifyItem extends StatefulWidget {
  const NotifyItem({Key? key, required this.item}) : super(key: key);
  final Map item;
  @override
  _NotifyItemState createState() => _NotifyItemState();
}

class _NotifyItemState extends State<NotifyItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.item["title"],
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.item["content"],
              textAlign: TextAlign.left,
              style: const TextStyle(
                  color: Color.fromARGB(255, 103, 101, 101), fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.item["createAt"],
              textAlign: TextAlign.left,
              style: const TextStyle(
                  color: Color.fromARGB(255, 202, 200, 200), fontSize: 14),
            )
          ],
        ));
    ;
  }
}
