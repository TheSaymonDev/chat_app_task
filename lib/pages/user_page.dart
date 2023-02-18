import 'package:chat_app_task/colors/color.dart';
import 'package:chat_app_task/pages/home_page.dart';
import 'package:chat_app_task/widgets/all_chats.dart';
import 'package:chat_app_task/widgets/favourite.dart';
import 'package:chat_app_task/widgets/group.dart';
import 'package:chat_app_task/widgets/spam.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  List myList1 = ['All Chats', 'Favourite', 'Group', 'Spam'];
  List myList2 = [AllChats(), Favourite(), Group(), Spam()];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          color: whiteClr,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: greenClr,
                      )),
                  Text(
                    'Message',
                    style: myStyle(18, FontWeight.bold, blackClr),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('images/saymon.jpg'),
                            fit: BoxFit.cover)),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          fillColor: whiteClr,
                          filled: true,
                          hintStyle: TextStyle(color: greyClr),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: waterClr,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: waterClr,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 50,
                    color: greenClr,
                    child: Row(
                      children: [
                        Text(
                          'Filter',
                          style: myStyle(16, FontWeight.normal, whiteClr),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.filter_list_sharp,
                          color: whiteClr,
                        )
                      ],
                    ),
                  )
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                height: 50,
                width: double.infinity,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 8,),
                  itemCount: myList1.length,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        current = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 3),
                      alignment: Alignment.center,
                      height: 50,
                      width: MediaQuery.of(context).size.width*.21,
                      decoration: BoxDecoration(
                        color: current==index? greenClr:null,
                        border: current==index?  null : Border.all(width: 1.5, color: greenClr)
                      ),
                      child: Text(myList1[index], style: myStyle(15, FontWeight.w600, current==index?whiteClr:greyClr),),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                  child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                    child: myList2[current],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
