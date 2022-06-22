import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../models/profession_model.dart';
import '../screens/screens.dart';
import '../models/models.dart';
import './text.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key? key, required this.text, required this.color})
      : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(color: Colors.black),
        ),
      ),
      onPressed: () {},
      child: SizedBox(
        width: 100,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
          textScaleFactor: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class ChipButton extends StatelessWidget {
  const ChipButton({
    Key? key,
    required this.color,
    required this.text,
    required this.onPressed,
    this.asyncPressed,
    this.textColor,
  }) : super(key: key);

  final Color? textColor;
  final Color color;
  final String text;
  final void Function() onPressed;
  final Future<void> Function()? asyncPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: Colors.black),
          ),
        ),
        onPressed: onPressed,
        child: SizedBox(
          width: 90,
          child: Text(
            text,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textScaleFactor: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class FadedChipButton extends StatelessWidget {
  const FadedChipButton({
    Key? key,
    required this.fade,
    required this.color,
    required this.text,
    required this.onPressed,
    this.asyncPressed,
    this.textColor,
  }) : super(key: key);

  final bool fade;
  final Color? textColor;
  final Color color;
  final String text;
  final void Function() onPressed;
  final Future<void> Function()? asyncPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: fade ?const Color.fromARGB(255, 199, 197, 197) : color,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side:  BorderSide(color: fade ?Colors.grey : Colors.black),
          ),
        ),
        onPressed: onPressed,
        child: SizedBox(
          width: 90,
          child: Text(
            text,
            style: TextStyle(
              color: textColor ?? Colors.black,
              fontWeight: FontWeight.w300,
            ),
            textScaleFactor: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Stack(
        children: [
          Positioned(
            right: 30,
            child: ChipButton(
              color: Colors.black,
              text: 'Save',
              onPressed: onPressed,
            ),
          )
        ],
      ),
    );
  }
}

class ResumeSlides extends StatelessWidget {
  const ResumeSlides({
    Key? key,
    required this.design,
    required this.bodyWidth,
    required this.bodyHeight,
  }) : super(key: key);

  final ResumeDesign design;
  final double bodyWidth;
  final double bodyHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: design.color,
      ),
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: (bodyWidth - 25) * .70,
            height: bodyHeight * .50,
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Center(
                        child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            design.path,
                          ),
                        ),
                      );
                    });
              },
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage(
                  design.path,
                ),
              ),
            ),
          ),
          SizedBox(
            width: (bodyWidth - 25) * .30,
            height: bodyHeight * .50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HeadingText(
                    text: design.name,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 5),
                  const Divider(
                    color: Colors.white,
                    indent: 10,
                    endIndent: 10,
                    height: 3,
                  ),
                  const Divider(
                    color: Colors.white,
                    indent: 10,
                    endIndent: 10,
                    height: 3,
                  ),
                  const SizedBox(height: 5),
                  Stars(count: design.stars ?? 0),
                  const SizedBox(height: 30),
                  ListPoints(
                    points: design.keyPoints,
                    color: Colors.white,
                  ),
                  ChipButton(
                    textColor: Colors.black,
                    color: Colors.white,
                    text: 'Choose \n Template',
                    onPressed: () {
                      Navigator.of(context).pushNamed(DisplayInfo.routeName);
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfessionButton extends StatelessWidget {
  const ProfessionButton({
    Key? key,
    required this.profession,
  }) : super(key: key);

  final Profession profession;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        elevation: 1,
        side: const BorderSide(
          style: BorderStyle.solid,
          color: Color.fromARGB(255, 201, 201, 201),
        ),
      ),
      onPressed: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            child: Image(
              image: Svg(profession.path),
              fit: BoxFit.cover,
            ),
          ),
          Text(
            profession.name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
