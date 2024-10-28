import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:date_format/date_format.dart';
import 'package:wrok_app_1/helpers/app_fonts.dart';
import 'package:wrok_app_1/helpers/asset_helper.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  @override
  Widget build(BuildContext context) {
    DatePickerController _controller = DatePickerController();
    String _selectedValue = formatDate(DateTime.now(), [d, '-', yyyy]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEBEBF5),
        toolbarHeight: 174,
        title: Column(
          children: [
            Text(
              '${formatDate(DateTime.now(), [M, '-', d, '-', yyyy])}',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              child: DatePicker(
                DateTime.now(),
                width: 60,
                height: 80,
                controller: _controller,
                initialSelectedDate: DateTime.now(),
                selectionColor: Colors.black,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  setState(() {
                    _selectedValue = formatDate(date, [d, '-', yyyy]);
                  });
                },
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFEBEBF5),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 16, bottom: 16, right: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Căn chỉnh các widget con ở đầu
                  children: [
                    Icon(
                      Icons.chevron_right,
                      size: 10,
                    ),
                    SizedBox(
                        width: 8), // Khoảng cách giữa icon và cột thời gian
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Căn chỉnh các text bên trái
                      children: [
                        Text(
                          '09:12 AM',
                          style:
                              TextStyle(fontSize: 12, fontFamily: AppFonts.sen),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          '10:00 AM',
                          style:
                              TextStyle(fontSize: 12, fontFamily: AppFonts.sen),
                        ),
                      ],
                    ),
                    SizedBox(
                        width: 10), // Khoảng cách giữa thời gian và divider
                    Divider(
                      color: Colors.black,
                      thickness: 10,
                    ), // Đường ngăn cách dọc
                    SizedBox(
                        width: 10), // Khoảng cách giữa divider và cột thông tin
                    Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Căn chỉnh các text bên trái
                      children: [
                        Text(
                          'MGT 101 - Organization\nManagement',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFC374)), // Kích thước chữ lớn
                          softWrap: true, // Tự động xuống dòng
                          overflow:
                              TextOverflow.visible, // Hiển thị toàn bộ nội dung
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Room 302',
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: 10,
                            ),
                            Container(
                              width: 16, // Đường kính của hình tròn
                              height: 16,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red, // Màu nền
                              ),
                              child: Center(
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                    color: Colors.white, // Màu chữ
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Missing\n assignment',
                              style: TextStyle(
                                  fontSize: 12, fontFamily: AppFonts.sen),
                            )
                          ],
                        ),
                      ],
                    ),
                    // Giúp đẩy "Now" sang bên trái
                    Align(
                      alignment:
                          Alignment.topLeft, // Đặt văn bản ở mép trên bên trái
                      child: Text(
                        'Now',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
