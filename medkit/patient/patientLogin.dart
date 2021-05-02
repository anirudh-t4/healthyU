import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yoga_guru/main.dart';
import 'package:yoga_guru/medkit/animations/bottomAnimation.dart';
import 'package:yoga_guru/medkit/doctor/doctorLogin.dart';
import 'package:yoga_guru/medkit/otherWidgetsAndScreen/backBtnAndImage.dart';

class PatientLogin extends StatefulWidget {
  @override
  _PatientLoginState createState() => _PatientLoginState();
}

class _PatientLoginState extends State<PatientLogin> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn(BuildContext context) async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser userDetails = authResult.user;
    ProviderDoctorDetails providerInfo =
        new ProviderDoctorDetails(userDetails.providerId);

    List<ProviderDoctorDetails> providerData =
        new List<ProviderDoctorDetails>();
    providerData.add(providerInfo);

    PatientDetails details = new PatientDetails(
      userDetails.providerId,
      userDetails.displayName,
      userDetails.photoUrl,
      userDetails.email,
      providerData,
    );

    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => HomePage(
                  detailsUser: details,
                )));

    return userDetails;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ImageAvatar(
              assetImage: 'assets/app_logo.jpeg',
            ),
            Container(
              width: width,
              height: height,
              margin: EdgeInsets.fromLTRB(
                  width * 0.05, height * 0.1, width * 0.05, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Login",
                    style: GoogleFonts.abel(
                        fontSize: height * 0.045, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),

                  RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: height * 0.013),
                    color: Colors.white,
                    shape: StadiumBorder(),
                    onPressed: () {
                      _signIn(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        WidgetAnimator(
                          Image(
                            image: AssetImage('assets/google.png'),
                            height: height * 0.038,
                          ),
                        ),
                        SizedBox(width: width * 0.02),
                        Text(
                          'Login Using Gmail',
                          style: TextStyle(
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w600,
                              fontSize: height * 0.021),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PatientDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderDoctorDetails> providerData;

  PatientDetails(this.providerDetails, this.userName, this.photoUrl,
      this.userEmail, this.providerData);
}

class ProviderPatientDetails {
  ProviderPatientDetails(this.providerDetails);

  final String providerDetails;
}
