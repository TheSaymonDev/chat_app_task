import 'dart:convert';

import 'package:chat_app_task/colors/color.dart';
import 'package:chat_app_task/model/user_model.dart';
import 'package:chat_app_task/pages/home_page.dart';
import 'package:chat_app_task/widgets/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AllChats extends StatefulWidget {
  const AllChats({Key? key}) : super(key: key);

  @override
  State<AllChats> createState() => _AllChatsState();
}

class _AllChatsState extends State<AllChats> {
  List<Map> extra = [
    {
      'lastMessage': 'Yes I am good',
      'activeStatus': 'true',
      'lastSeen': '10:17'
    },
    {'lastMessage': 'Ok, thanks', 'activeStatus': 'false', 'lastSeen': '08:22'},
    {'lastMessage': 'How are you', 'activeStatus': 'true', 'lastSeen': '09:00'},
    {
      'lastMessage': 'See you later',
      'activeStatus': 'false',
      'lastSeen': '12:20'
    },
    {
      'lastMessage': 'Please change the topic',
      'activeStatus': 'false',
      'lastSeen': '03:45'
    },
    {'lastMessage': 'Hi, Saymon', 'activeStatus': 'false', 'lastSeen': '07:00'},
  ];
  int current = 0;

  bool isSelected = false;

  List<User> user = [];
  User? _user;
  fetchData() async {
    try {
      var link = 'https://reqres.in/api/users';
      isSelected = true;
      var response = await http.get(Uri.parse(link));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        for (var i in data['data']) {
          _user = User(
            id: i['id'],
            email: i['email'],
            firstName: i['first_name'],
            lastName: i['last_name'],
            avatar: i['avatar'],
          );
          setState(() {
            user.add(_user!);
          });
          isSelected = false;
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: isSelected == true,
        blur: 0.3,
        opacity: 0.5,
        progressIndicator: spinkit,
        child: ListView.separated(
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    current = index;
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          NetworkImage('${user[index].avatar}'),
                                      fit: BoxFit.cover)),
                            ),
                            Positioned(
                                bottom: 2,
                                right: 2,
                                child: CircleAvatar(
                                  backgroundColor:
                                      extra[index]['activeStatus'] == 'true'
                                          ? greenClr
                                          : whiteClr,
                                  radius: 6,
                                ))
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${user[index].firstName} ${user[index].lastName}",
                              style: myStyle(16, FontWeight.bold, blackClr),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${extra[index]['lastMessage']}',
                              style: myStyle(
                                  14,
                                  FontWeight.normal,
                                  extra[index]['activeStatus'] == 'true'
                                      ? greenClr
                                      : greyClr),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${extra[index]['lastSeen']}',
                              style: myStyle(14, FontWeight.normal, blackClr),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: extra[index]['activeStatus'] == 'true'
                                      ? greenClr.withOpacity(0.3)
                                      : null),
                              child: Text(
                                '${extra[index]['activeStatus'] == 'true' ? 2 : ''}',
                                style: myStyle(12, FontWeight.normal, greenClr),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
            separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
            itemCount: user.length));
  }
}
