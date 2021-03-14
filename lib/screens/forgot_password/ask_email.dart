import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/widgets/email_field.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AskEmailScreen extends StatelessWidget {
  AskEmailScreen({Key key, this.onSubmit, this.emailController}) : super(key: key);

  final Function onSubmit;
  final TextEditingController emailController;
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    double top = MediaQuery.of(context).viewInsets.top + 56;
    double heightFactor = height / 1000;
    if (scrollController.hasClients) {
      if (bottom > height * 0.25) {
        scrollController.animateTo(
          bottom - height * 0.25,
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      } else {
        scrollController.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.ease);
      }
    }
    return DefaultTextStyle(
      style: GoogleFonts.roboto().copyWith(color: C.primaryUnHighlightedColor),
      child: Stack(
        children: [
          ScreenBackground(elementId: 1),
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            controller: scrollController,
            child: Container(
              height: height * 1.25,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.only(top: top),
                        alignment: Alignment.center,
                        child: Text(
                          "Step 1/3",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                      )),
                  Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        // Logo
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: D.horizontalPadding + 1),
                          child: Image.asset(
                            S.assetEcellLogoWhite,
                            width: width * 0.25 * heightFactor,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: D.horizontalPadding, top: 20),
                          child: Text(
                            "Welcome",
                            style:
                                TextStyle(fontSize: 35 * heightFactor, fontWeight: FontWeight.w600),
                          ),
                        ),
                        //Text Greeting
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: D.horizontalPadding, top: 5),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Forgot your ",
                                    style: TextStyle(
                                        color: C.primaryUnHighlightedColor,
                                        fontWeight: FontWeight.w300)),
                                TextSpan(
                                  text: "Password ",
                                  style: TextStyle(color: C.primaryHighlightedColor),
                                ),
                                TextSpan(
                                    text: "? \n",
                                    style: TextStyle(
                                        color: C.primaryUnHighlightedColor,
                                        fontWeight: FontWeight.w300)),
                                TextSpan(
                                    text:
                                        "We got you covered.\nJust enter your registered email address.",
                                    style: TextStyle(
                                        color: C.primaryUnHighlightedColor,
                                        fontWeight: FontWeight.w300)),
                              ],
                              style: TextStyle(fontSize: 25 * heightFactor),
                            ),
                          ),
                        ),
                        SizedBox(height: 23 * heightFactor),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: D.horizontalPadding),
                          child: EmailField(emailController),
                        ),
                      ],
                    ),
                  ),
                  //LoginButton
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: D.horizontalPadding),
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          boxShadow: [
                            BoxShadow(
                              color: C.authButtonColor.withOpacity(0.2),
                              blurRadius: 10,
                              spreadRadius: 3,
                              offset: Offset(0, 12),
                            )
                          ],
                        ),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          color: C.authButtonColor,
                          onPressed: () => onSubmit(),
                          child: Container(
                            height: 60,
                            width: 120,
                            alignment: Alignment.center,
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: C.primaryUnHighlightedColor, fontSize: 20 * heightFactor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //To flex background
                  Expanded(flex: 9, child: Container()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
