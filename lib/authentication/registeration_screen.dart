import "package:daawatok/authentication/authentication_controller.dart";
import "package:daawatok/authentication/login_screen.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:get/get_core/src/get_main.dart";
import "package:google_fonts/google_fonts.dart";
import "package:simple_circular_progress_bar/simple_circular_progress_bar.dart";

import "../global.dart";
import "../widgets/input_text_widgets.dart";
class RegisterationScreen extends StatefulWidget {

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();


  var authenticationController = AuthenticationController.instanceAuth;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              const SizedBox(
                height: 100,
              ),


              Text(
                  "Create Account",
                  style:GoogleFonts.acme(
                    fontSize: 34,
                    color: Colors.greenAccent,

                  )
              ),

              Text(
                "to get Started NOW!",
                style:GoogleFonts.acme(
                    fontSize: 34,
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold

                ),

              ),

              const SizedBox(
                height: 16,
              ),

              //profile avatar
              GestureDetector(
                onTap: ()
                {
                  //allow user to choose image
                  authenticationController.chooseImageFromGallery();

                },
                child: const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(
                    "images/profile icon.jpg"
                  ),
                  backgroundColor: Colors.black,
              )
              ),
              const SizedBox(
                height: 30,
              ),

              //user name input
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: InputTextWidget(
                  textEditingController: userNameTextEditingController,
                  lableString: "Username",
                  iconData: Icons.person_outline,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 25,
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

              //create account for user button

              //not have an account button ,signup now button
              showProgressBar == false ?
              Column(
                children:[
                  //signup button
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
                        if(authenticationController.profileImage != null
                            && userNameTextEditingController.text.isNotEmpty
                            && emailTextEditingController.text.isNotEmpty
                            && passwordTextEditingController.text.isNotEmpty)
                          {
                            setState(() {
                              showProgressBar = true;
                            });
                            authenticationController.createAccountForNewUser(
                              authenticationController.profileImage!,
                              userNameTextEditingController.text,
                              emailTextEditingController.text,
                              passwordTextEditingController.text,
                            );
                          }

                        //login user now

                      },
                      child: const Center(
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //already have an account

                  const SizedBox(
                    height:15,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      InkWell(
                        onTap: ()
                        {
                          //send user to signup screen
                          Get.to(LoginScreen());
                        },
                        child: const Text(
                          " Login NOW!",
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
                  animationDuration: 1,
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

