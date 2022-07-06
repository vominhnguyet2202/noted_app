import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:noted_app/styles/app_styles.dart';

Widget notedCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppStyle.cardColor[doc['color_id']],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doc['noted_title'],
              style: AppStyle.mainTitle,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              doc['creation_date'],
              style: AppStyle.dateTitle,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              doc['noted_content'],
              style: AppStyle.mainContent,
              overflow: TextOverflow.ellipsis,
            ),
            //
          ],
        ),
      ),
    ),
  );
}
