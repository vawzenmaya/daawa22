import 'package:daawatok/authentication/registeration_screen.dart';
import 'package:daawatok/widgets/input_text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen>
{
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool showProgressBar = false;

  @override
  Widget build(BuildContext context)
  {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              const SizedBox(
                height: 100,
              ),



              Image.asset(
                "images/app logo.png",
                width: 200,
              ),

              Text(
                "WELCOME TO",
                style:GoogleFonts.acme(
                  fontSize: 34,
                  color: Colors.greenAccent,

                )
              ),

              Text(
                  "DAAWATOK",
                  style:GoogleFonts.acme(
                      fontSize: 34,
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold

                  ),
              ),
              const SizedBox(
                height: 30,
              ),
              //email input
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: InputTextWidget(
                  textEditingController: emailTextEditingController,
                  lableString: "Email",
                  iconData: Icons.email_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              //password input
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: InputTextWidget(
                  textEditingController: passwordTextEditingController,
                  lableString: "Password",
                  iconData: Icons.lock_outlined,
                  isObscure: true,
                ),
              ),

              const SizedBox(
                height:30,
              ),

              //login button
              //not have an account button ,signup now button
              showProgressBar == false ?
              Column(
                children:[
                  //login button
                  Container(
                    width: MediaQuery.of(context).size.width - 38,
                    height: 54,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),

                    ),
                    child: InkWell(
                      onTap:()
                      {
                        setState(() {
                          showProgressBar = true;
                        });

                        //login user now
                      },
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                        ),
                        ),
                      ),
                    ),
                  ),
                  //not have an account, signup now button

                  const SizedBox(
                    height:15,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      InkWell(
                        onTap: ()
                        {
                          //send user to signup screen
                          Get.to(RegisterationScreen());
                        },
                          child: const Text(
                            "SignUp Now",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                      ),
                    ],
                  ),
                ],
              ) :Container(
                //show animations
                child: SimpleCircularProgressBar(
                  progressColors: [
                    Colors.lightGreenAccent,
                    Colors.blueAccent,
                    Colors.red,
                    Colors.amber,
                    Colors.purpleAccent
                  ],
                  animationDuration: 2,
                  backColor: Colors.white38,
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}