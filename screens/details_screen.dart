  
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yoga_guru/constants.dart';
import 'package:yoga_guru/screens/videoplayer.dart';


class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(

      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: kBlueLightColor,
              image: DecorationImage(
                image: AssetImage("assets/images/meditation_bg.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      "Meditation",
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(fontWeight: FontWeight.w900,fontSize: 40),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "3-10 MIN Course",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: size.width * .6, // it just take 60% of total width
                      child: Text(
                        "Live happier and healthier by learning the fundamentals of meditation and mindfulness",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      width: size.width * .5,
                      height: size.height/7,// it just take the 50% width

                    ),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: <Widget>[
                        SeassionCard(
                          seassionNum: 1,
                          isDone: true,
                          press: () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => med_vid(url: 'https://youtu.be/inpok4MKVLM',)),
                            );

                          },
                        ),
                        SeassionCard(
                          seassionNum: 2,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => med_vid(url: 'https://youtu.be/EkrCJb0I8Z0')),
                            );
                          },
                        ),
                        SeassionCard(
                          seassionNum: 3,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => med_vid(url: 'https://youtu.be/wruCWicGBA4')),
                            );
                          },
                        ),
                        SeassionCard(
                          seassionNum: 4,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => med_vid(url: 'https://youtu.be/ijfLsKg8jFY')),
                            );
                          },
                        ),
                        SeassionCard(
                          seassionNum: 5,
                          press: () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => med_vid(url: 'https://youtu.be/inpok4MKVLM')),
                            );
                          },
                        ),
                        SeassionCard(
                          seassionNum: 6,
                          press: () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => med_vid(url: 'https://youtu.be/4AKrtL9wBmU')),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SeassionCard extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  final Function press;
  const SeassionCard({
    Key key,
    this.seassionNum,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 -
              10, // constraint.maxWidth provide us the available with for this widget
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? kBlueColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : kBlueColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Session $seassionNum",
                      style: Theme.of(context).textTheme.subtitle,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}