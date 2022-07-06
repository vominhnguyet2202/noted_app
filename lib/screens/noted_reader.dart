import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noted_app/styles/app_styles.dart';

class NotedReaderScreen extends StatefulWidget {
  NotedReaderScreen(this.doc, {super.key});
  QueryDocumentSnapshot doc;

  @override
  State<NotedReaderScreen> createState() => _NotedReaderScreenState();
}

class _NotedReaderScreenState extends State<NotedReaderScreen> {
  int color_id = Random().nextInt(AppStyle.cardColor.length);
  TextEditingController _titleContronler = TextEditingController();
  TextEditingController _mainContronler = TextEditingController();
  bool _isDelete = false;
  String date = DateTime.now().toString();
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.cardColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardColor[color_id],
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit_outlined,
                color: Colors.black,
                size: 30,
              )),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.delete_forever_outlined,
                color: Colors.black,
                size: 30,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc['noted_title'],
              style: AppStyle.mainTitle,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.doc['creation_date'],
              style: AppStyle.dateTitle,
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              widget.doc['noted_content'],
              style: AppStyle.mainContent,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
