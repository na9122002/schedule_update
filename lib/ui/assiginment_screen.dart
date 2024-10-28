import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:wrok_app_1/helpers/app_fonts.dart';
import 'package:wrok_app_1/helpers/database_helper.dart';
import 'package:wrok_app_1/note_item.dart';
import 'package:wrok_app_1/ui/home_page.dart';

class AssiginmentScreen extends StatefulWidget {
  const AssiginmentScreen({super.key});

  @override
  State<AssiginmentScreen> createState() => _AssiginmentScreenState();
}

class _AssiginmentScreenState extends State<AssiginmentScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Note> _notes = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  String? _selectedItem; // Biến để lưu mục đã chọn
  final List<String> _items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  bool _isChecked = false;
  bool _isSwitched = false;
  void _loadNotes() async {
    _notes = await _dbHelper.getNotes();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEBEBF5),
        toolbarHeight: 94,
        title: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Giãn cách 1 đầu 1 cuối
          children: [
            Container(
                child: Text(
              'Cancel',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: AppFonts.sen,
                  color: Color(0xFF80B3FF)),
            )), // Thay 'cancle' thành 'Cancel'
            TextButton(
              onPressed: () {
                // Hiển thị AlertDialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Bo tròn góc
                      ),
                      title: Text(
                        'You have created an assignment',
                      ),
                      // content: Text('B'), // Nếu bạn muốn thêm nội dung
                      actions: [
                        TextButton(
                          onPressed: () {
                            final newNote = Note(
                  title: _titleController.text,
                  content: _contentController.text,
                );
                _dbHelper.insertNote(newNote);
                _titleController.clear();
                _contentController.clear();
                _loadNotes();
                            Navigator.of(context).pop(); // Đóng hộp thoại
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                'Save',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF80B3FF)),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'New assignment',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Title',
            style: TextStyle(fontSize: 14, fontFamily: AppFonts.sen),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              textDirection: TextDirection.ltr, // Xác định hướng văn bản
              decoration: InputDecoration(
                hintText: 'Eg. Read Book', // Thêm text gợi ý
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Color(0xFF21283F)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          // Text('Class name',
          //     style: TextStyle(fontSize: 14, fontFamily: AppFonts.sen)),
          // SizedBox(
          //   height: 10,
          // ),
          // Center(
          //   child: DropdownButtonFormField<String>(
          //     hint: Text(
          //       'MGT 101 - Organization Management',
          //       style: TextStyle(color: Colors.black),
          //     ),

          //     value: _selectedItem,
          //     onChanged: (String? newValue) {
          //       setState(() {
          //         _selectedItem = newValue;
          //       });
          //     },
          //     items: _items.map<DropdownMenuItem<String>>((String value) {
          //       return DropdownMenuItem<String>(
          //         value: value,
          //         child: Text(value),
          //       );
          //     }).toList(),
          //     // Đoạn này tạo ô nhập liệu
          //     dropdownColor: Colors.white,
          //     isExpanded: true,
          //     decoration: InputDecoration(
          //       // suffixIcon: Icon(Icons.arrow_drop_down),
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(16),
          //         borderSide: BorderSide(color: Color(0xFF21283F)),
          //       ),
          //       contentPadding:
          //           EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          Text('Details'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _contentController,
              textDirection: TextDirection.ltr, // Xác định hướng văn bản
              maxLines: null, // Cho phép nhiều dòng
              minLines: 5, // Số dòng tối thiểu
              decoration: InputDecoration(
                hintText: 'Eg. Read from page 100 to 150', // Thêm text gợi ý
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Color(0xFF21283F)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: _isChecked,
                onChanged: (bool? newValue) {
                  setState(() {
                    _isChecked = newValue ?? false;
                  });
                },
                activeColor: Colors.blue, // Màu khi checkbox được chọn
                checkColor: Colors.white, // Màu của dấu kiểm
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Set as priority',
                style: TextStyle(fontSize: 14, fontFamily: AppFonts.sen),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'All day',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Monday, 18th Oct',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xFF80B3FF)),
                  )
                ],
              ),
              Switch.adaptive(
                  value: _isSwitched, // Giá trị hiện tại
                  activeColor: Color(0xFF4AD2C9),
                  onChanged: (bool newValue) {
                    setState(() {
                      _isSwitched = newValue; // Cập nhật trạng thái
                    });
                  })
            ],
          )
        ],
      ),
    );
  }
}
