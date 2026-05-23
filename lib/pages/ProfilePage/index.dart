import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override State<ProfilePage> createState()=> ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('个人中心'),
        backgroundColor: Colors.transparent,
        centerTitle: true
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          SizedBox(
            height: 40,
            child: Row(
              children: [
                const Text('头像', style: TextStyle(fontSize: 16)),
                const Spacer(),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset('assets/images/avatar.png', width: 30, height: 30)
                    ),
                    const Icon(Icons.arrow_back_ios, size: 12)
                  ]
                )
              ]
            )
          ),
          const Row(
            children: [
              Text('昵称'),
              Spacer(),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(hintText: '请输入昵称', border: InputBorder.none),
                  textAlign: TextAlign.right,
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 12)
            ]
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 85, 145, 175),
                    minimumSize: const Size(100, 50),
                  ),
                  onPressed: () {},
                  child: const Text('保存', style: TextStyle(color: Colors.white, fontSize: 20)),
                )
              )
            ]
          )
        ]
      )
    );
  }
}