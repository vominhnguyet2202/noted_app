import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:noted_app/styles/app_styles.dart';

class NotedEditorScreen extends StatefulWidget {
  const NotedEditorScreen({super.key});

  @override
  State<NotedEditorScreen> createState() => _NotedEditorScreenState();
}

class _NotedEditorScreenState extends State<NotedEditorScreen> {
  int color_id = Random().nextInt(AppStyle.cardColor.length);
  TextEditingController _titleContronler = TextEditingController();
  TextEditingController _mainContronler = TextEditingController();
  String date = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardColor[color_id],
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        title: const Text(
          "Add a new Note",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleContronler,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "None Title"),
              style: AppStyle.mainTitle,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              date,
              style: AppStyle.dateTitle,
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextField(
              controller: _mainContronler,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "None Content"),
              style: AppStyle.mainContent,
            ),
            const SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: () async {
          FirebaseFirestore.instance.collection('Notes').add({
            "noted_title": _titleContronler.text,
            "creation_date": date,
            "noted_content": _mainContronler.text,
            "color_id": color_id,
          }).then((value) {
            print(value.id);
            Navigator.pop(context);
          }).catchError((e) => print("Failed to add new Note due to $e"));
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
