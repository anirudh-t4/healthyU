
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:scratcher/widgets.dart';
import 'package:yoga_guru/bmi/input_page/input_page.dart';
import 'package:yoga_guru/cov_detect.dart';
import 'package:yoga_guru/medkit/otherWidgetsAndScreen/category.dart';
import 'package:yoga_guru/widgets/search_bar.dart';
import 'package:yoga_guru/widgets/category_card.dart';
import 'medkit/animations/fadeAnimation.dart';
import 'medkit/doctor/doctorLogin.dart';
import 'medkit/otherWidgetsAndScreen/aboutUs.dart';
import 'medkit/patient/patientLogin.dart';
import 'package:easter_egg_trigger/easter_egg_trigger.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    color: Colors.white,
    title: "Healthify",

    home: MedKitApp(),
  ));

}



class HomePage extends StatefulWidget {

  final PatientDetails detailsUser;

  HomePage({Key key, @required this.detailsUser}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  
  


  @override
  void initState() {


    super.initState();

  }

  Widget uicard(text, icon) {
    return Card(color: Colors.white,elevation: 2.0,
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(child: Image.asset(icon),height: 100,),
          SizedBox(height: 10,),
          Text(text,textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold,
              color:Colors.black,),),

        ],
      ),
    );
  }



  @override

  Widget build(BuildContext context) {
    EasterEggTrigger(
      action: () => print("Easter Egg !!!"),
      child: Image.network('https://picsum.photos/250?image=9'),
      codes: [
        EasterEggTriggers.SwipeLeft,
        EasterEggTriggers.SwipeUp,
        EasterEggTriggers.SwipeRight,
        EasterEggTriggers.SwipeDown,
      ],
    );

    var name=widget.detailsUser.userName;
    var pic=widget.detailsUser.photoUrl;
    
    
    
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return SafeArea(
      child: EasterEggTrigger(
        action: () => scratchCardDialog(context),
        codes: [
          EasterEggTriggers.SwipeLeft,
          EasterEggTriggers.SwipeUp,
          EasterEggTriggers.SwipeRight,
          EasterEggTriggers.SwipeDown,
        ],
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                // Here the height of the container is 45% of our total height
                height: size.height * .45,
                decoration: BoxDecoration(
                  color: Color(0xFFF5CEB8),
                  image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          alignment: Alignment.center,
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                            color: Color(0xFFF2BEA1),
                            shape: BoxShape.circle,
                          ),

                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(pic),
                          ),
                        ),
                      ),
                      Text(
                        "Welcome \n$name ",
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(fontWeight: FontWeight.w900,fontSize: 30),

                      ),
                      SearchBar(),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: .85,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          children: <Widget>[
                            CategoryCard(
                              title: "Covid Detector",
                              svgSrc: "assets/covid.jpeg",
                              press: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => detect()));
                              },
                            ),
                           /* CategoryCard(
                              title: "Yoga",
                              svgSrc: "assets/yoga.jpeg",
                              press: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()));
                              },
                            ),*/
                            CategoryCard(
                              title: "MedKit",
                              svgSrc: "assets/doc.jpeg",
                              press: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Category1(detailsUser: widget.detailsUser)));
                              },
                            ),
                            CategoryCard(
                              title: "BMI",
                              svgSrc: "assets/bmi.jpeg",
                              press: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => InputPage())
                                );
                              },
                            ),
                            /*CategoryCard(
                              title: "Meditation",
                              svgSrc: "assets/health-ar.jpg",
                              press: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailsScreen()));
                              },
                            ),
                            CategoryCard(
                              title: "Symptom Detector",
                              svgSrc:"assets/medkit.png",
                              press: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => sym())),
                            ),
                            CategoryCard(
                              title: "Medi-reminder",
                              svgSrc:"assets/medicine.png",
                              press: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  MedicineReminder()));
                              },
                            ),
                            CategoryCard(
                              title: "HelpLines",
                              svgSrc:"assets/helpline.png",
                              press: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  helpline()));
                              },
                            ),*/
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
    /*return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text('Categories',style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,),

          body:  Container(
            alignment: Alignment.center,
            child: GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
              CategoryCard(
                          title: "Covid Detector",
                          svgSrc: "assets/covid.jpeg",
                          press: () {
                          Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => detect()));
                          },
                        )
                GestureDetector(
                  child: uicard('Covid Detector', 'assets/covid.jpeg'),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => detect()));
                  },
                ),
                GestureDetector(
                  child: uicard('Yoga', 'assets/yoga.jpeg'),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Home()));
                  },
                ),

                GestureDetector(
                  child: uicard('BMI Calculator', 'assets/bmi.jpeg'),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InputPage()));
                  },
                ),
                *//*
                GestureDetector(
                  child: uicard('Donate', 'assets/logo.png'),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SplashScreena()));
                  },
                ),
                GestureDetector(
                  child: uicard('Symptom Detector', 'assets/symptom.jpg'),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => sym()));
                  },
                ),
                GestureDetector(
                  child: uicard('Medicine Reminder', 'assets/medicine.png'),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => mental()));
                  },
                ),
                GestureDetector(
                  child: uicard('Mental Health', 'assets/mental.png'),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => mental()));
                  },
                ),
                GestureDetector(
                  child: uicard('Helplines', 'assets/helpline.png'),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => helpline()));
                  },
                ),
                GestureDetector(
                  child: uicard('Health-AR', 'assets/health-ar.png'),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => heart()));
                  },
                ),*//*
              ],
            ),
          )
      ),
    );*/
  }



class MedKitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.black,
        primaryColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      routes: {
        '/DoctorLogin' : (context) => DoctorLogin(),
        '/PatientLogin' : (context) => PatientLogin(),
        '/AboutUs' : (context) => AboutUs()
      },
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  AnimationController _scaleController;
  AnimationController _scaleController2;
  AnimationController _widthController;
  AnimationController _positionController;

  Animation<double> _scaleAnimation;
  Animation<double> _scale2Animation;
  Animation<double> _widthAnimation;
  Animation<double> _positionAnimation;

  bool hideIcon = false;

  @override
  void initState() {
    super.initState();
    _scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _scaleAnimation =
    Tween<double>(begin: 1.0, end: 0.8).animate(_scaleController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _widthController.forward();
        }
      });

    _widthController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    _widthAnimation =
    Tween<double>(begin: 80.0, end: 300.0).animate(_widthController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _positionController.forward();
        }
      });

    _positionController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _positionAnimation =
    Tween<double>(begin: 0.0, end: 215.0).animate(_positionController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            hideIcon = true;
          });
          _scaleController2.forward();
        }
      });
    _scaleController2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _scale2Animation = Tween<double>(begin: 1.0, end: 32.0).animate(
        _scaleController2)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.push(context,
              PageTransition(type: PageTransitionType.fade, child: PatientLogin()));
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black, // navigation bar color
        statusBarColor: Colors.black.withOpacity(0.1)));
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: width,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: height * 0.05,
              left: width - 240,
              child: FadeAnimation(
                1,
                Container(
                  width: width,
                  child: Image(image: AssetImage('assets/hospital.png')),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                margin: EdgeInsets.fromLTRB(0, 0, 0, height * 0.01),
                height: height * 0.55,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                        1,
                        Text(
                          'HealthyU',
                          style: TextStyle(color: Colors.black, fontSize: height * 0.06),
                        )),
                    FadeAnimation(
                        1,
                        Text(
                          "Pharmacy in Your Hands!",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5), fontSize: height * 0.017),
                        )),
                    SizedBox(
                      height: height * 0.26,
                    ),
                    Column(
                      children: <Widget>[
                        FadeAnimation(
                            1.6,
                            AnimatedBuilder(
                              animation: _scaleController,
                              builder: (context, child) => Transform.scale(
                                scale: _scaleAnimation.value,
                                child: Center(
                                  child: AnimatedBuilder(
                                    animation: _widthController,
                                    builder: (context, child) => Container(
                                      width: _widthAnimation.value,
                                      height: 80,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.black.withOpacity(0.4),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          _scaleController.forward();
                                        },
                                        child: Stack(
                                          children: <Widget>[
                                            AnimatedBuilder(
                                              animation: _positionController,
                                              builder: (context, child) => Positioned(
                                                left: _positionAnimation.value,
                                                child: AnimatedBuilder(
                                                  animation: _scaleController2,
                                                  builder: (context, child) =>
                                                      Transform.scale(
                                                          scale: _scale2Animation
                                                              .value,
                                                          child: Container(
                                                              width: 60,
                                                              height: 60,
                                                              decoration:
                                                              BoxDecoration(
                                                                  color:
                                                                  Colors
                                                                      .black,
                                                                  shape: BoxShape
                                                                      .circle),
                                                              child: hideIcon == false
                                                                  ? Icon(
                                                                Icons
                                                                    .arrow_forward,
                                                                color: Colors
                                                                    .white,
                                                              )
                                                                  : Container())),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(height: height * 0.02,),
                        FadeAnimation(
                            1,
                            Text(
                              'Proceed!', textAlign: TextAlign.center,
                              style: GoogleFonts.openSans(fontSize: 20),
                            )),
                      ],
                    ),
                    SizedBox(height: height * 0.02,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


Future<void> scratchCardDialog(BuildContext context) {
  double _opacity = 0.0;
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'You\'ve won a scratch card',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
        content: StatefulBuilder(builder: (context, StateSetter setState) {

          return Scratcher(
            accuracy: ScratchAccuracy.low,
            threshold: 25,
            brushSize: 50,
            onThreshold: () {
              setState(() {
                _opacity = 1;
              });
            },
            image: Image.asset("assets/1mg2.jfif",width: 200,),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 250),
              opacity: _opacity,
              child: Container(
                height: 300,
                width: 300,
                alignment: Alignment.center,
                child: Text(
                  "30% OFF ON MEDICINES !!!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.blue),
                ),
              ),
            ),
          );
        }),
      );
    },
  );
}


