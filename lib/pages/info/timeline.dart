import 'package:flutter/material.dart';
import 'package:pixels/widgets/blur_filter.dart';
import 'package:pixels/widgets/dices.dart';

class InfoTimeline extends StatefulWidget {
  @override
  _InfoTimelineState createState() => _InfoTimelineState();
}

class _InfoTimelineState extends State<InfoTimeline> {
  int cStep = 0;

  List titles = ['We Learn', 'We Make', 'We Share'];
  List contents = [
    'Providing you the best courses\nLearning from posts everyday\nDevelop in electronics, mechanics, programming, electricity and energy',
    'Providing workshops\nMaking projects at every course\nJoining committees to make by your own',
    'Sharing the knowlegde\nSharing new technology at courses\nSpreading our missions to all community',
  ];
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light().copyWith(splashColor: Colors.pink[800]),
      child: Stepper(
        physics: NeverScrollableScrollPhysics(),
        currentStep: cStep,
        onStepContinue: () {
          if (cStep < 2) {
            setState(() {
              ++cStep;
              makeDiscs();
            });
          }
        },
        onStepCancel: () {
          if (cStep > 0) {
            setState(() {
              --cStep;
              makeDiscs();
            });
          }
        },
        onStepTapped: (value) {
          setState(() {
            cStep = value;
          });
        },
        controlsBuilder: (context, {onStepCancel, onStepContinue}) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconBtn(icon: Icons.arrow_upward_rounded, onClick: onStepCancel),
            iconBtn(
                icon: Icons.arrow_downward_rounded, onClick: onStepContinue),
          ],
        ),
        steps: List.generate(
            3,
            (index) => infoStep(context,
                title: titles[index], content: contents[index])),
      ),
    );
  }

  Step infoStep(context, {title, content}) {
    return Step(
      isActive: false,
      title: BlurFilter(
        sigma: 8,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            border: Border.all(color: Colors.pink[700], width: 1.5),
          ),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      content: BlurFilter(
        sigma: 8,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              bottomLeft: Radius.circular(40),
            ),
          ),
          child: Text(
            content,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.5,
            ),
          ),
        ),
      ),
    );
  }

  iconBtn({Function onClick, IconData icon}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: BlurFilter(
        sigma: 8,
        borderRadius: BorderRadius.circular(100),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.1),
            border: Border.all(color: Colors.pink[700], width: 1.5),
          ),
          child: IconButton(
            icon: Icon(icon),
            color: Colors.white,
            onPressed: onClick,
          ),
        ),
      ),
    );
  }
}
