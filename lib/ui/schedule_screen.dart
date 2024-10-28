import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:wrok_app_1/api/bloc/blocs.dart';

import '../api/models/item_api_model.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  final bloc = Blocs();

  Widget build(BuildContext context) {
    bloc.fetchAll();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Danh sách các bài viết giả lập'),
      ),
      body: StreamBuilder(
        stream: bloc.all,
        builder: (context, AsyncSnapshot<List<ItemModel>> snapshot) {
          if (snapshot.hasData) {
            final listItem = snapshot.data ?? [];
            return ListView.builder(
              padding: EdgeInsets.all(15),
              itemCount: listItem.length,
              itemBuilder: (context, index) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Title: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                          children: [
                            TextSpan(
                              text: listItem[index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                          text: TextSpan(
                              text: 'Body: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                              children: [
                            TextSpan(
                              text: listItem[index].body,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                          ]))
                    ]);
              },
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
