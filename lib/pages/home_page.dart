import 'package:chat_app_task/colors/color.dart';
import 'package:chat_app_task/pages/user_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isVisibility = false;
  bool isObsicure = false;

  bool isClick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: whiteClr,
                    boxShadow: [
                      BoxShadow(
                        color: greyClr.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: greenClr,
                    size: 22,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.15,
                ),
                Column(
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Sign in to your account',
                          style: myStyle(20, FontWeight.bold, blackClr),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(color: blackClr),
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: redClr),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Email or Phone Number',
                          fillColor: waterClr,
                          filled: true,
                          hintStyle: TextStyle(color: greyClr),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(color: blackClr),
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: redClr),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      obscureText:
                          isVisibility == true ? isObsicure : !isObsicure,
                      decoration: InputDecoration(
                          hintText: '***************',
                          fillColor: waterClr,
                          filled: true,
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isVisibility = !isVisibility;
                                });
                              },
                              icon: isVisibility == true
                                  ? Icon(
                                      Icons.visibility,
                                      color: greyClr,
                                    )
                                  : Icon(
                                      Icons.visibility_off,
                                      color: greyClr,
                                    )),
                          hintStyle: TextStyle(color: greyClr),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                isClick = !isClick;
                              });
                            },
                            icon: isClick == true
                                ? Icon(
                                    Icons.check_box,
                                    color: greenClr,
                                  )
                                : Icon(Icons.check_box_outline_blank_outlined)),
                        Text(
                          'Remember me',
                          style: TextStyle(color: greyClr),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage(),));
                      },
                      height: 50,
                      minWidth: double.maxFinite,
                      color: greenClr,
                      child: Text(
                        'Sign in',
                        style: myStyle(16, FontWeight.bold, whiteClr),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot the password?',
                          style: myStyle(16, FontWeight.normal, greenClr),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: myStyle(16, FontWeight.normal, blackClr),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Sign Up',
                              style: myStyle(16, FontWeight.w600, greenClr),
                            )),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

myStyle(double size, FontWeight weight, Color clr) {
  return TextStyle(fontSize: size, fontWeight: weight, color: clr);
}
