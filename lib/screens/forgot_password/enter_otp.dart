import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/numeric_pad.dart';

class EnterOTPScreen extends StatelessWidget {
  const EnterOTPScreen({Key key, this.otp, this.toVerify, this.numSelected}) : super(key: key);

  final Function toVerify;
  final Function(int) numSelected;
  final String otp;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double top = MediaQuery.of(context).padding.top;
    double heightFactor = height / 1000;
    return DefaultTextStyle(
      style: GoogleFonts.roboto().copyWith(color: C.primaryUnHighlightedColor),
      child: Stack(
        children: [
          ScreenBackground(elementId: 0),
          Container(
            margin: EdgeInsets.only(top: top),
            child: Column(
              children: [
                Expanded(
                  child: Text(
                    "Step 2/3",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  child: Icon(Icons.verified_user, color: Colors.white, size: 45),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Verify OTP",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: C.primaryHighlightedColor,
                        fontSize: heightFactor * 30,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "An otp has been sent to the registered user email",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [0, 1, 2, 3]
                        .map(
                          (e) => Container(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              otp[e],
                              style: TextStyle(fontSize: 23),
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: C.otpRings[e], width: 3.5),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
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
                          onPressed: () => toVerify(),
                          child: Container(
                            height: 50,
                            width: 110,
                            alignment: Alignment.center,
                            child: Text(
                              "Submit",
                              style: TextStyle(color: C.primaryUnHighlightedColor, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: NumericPad(onNumberSelected: numSelected),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
