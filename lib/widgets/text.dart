import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class HeadingText extends StatelessWidget {
  const HeadingText({Key? key, required this.color, required this.text})
      : super(key: key);
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w300,
        fontSize: 20,
        letterSpacing: 1,
      ),
    );
  }
}

class InfoText extends StatelessWidget {
  const InfoText({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        letterSpacing: 1.20,
        fontSize: 14,
        color: color,
      ),
    );
  }
}

class InfoText2 extends StatelessWidget {
  const InfoText2({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        letterSpacing: 1.20,
        fontSize: 18,
        color: color,
      ),
    );
  }
}

class ParaText extends StatelessWidget {
  const ParaText({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        letterSpacing: 1.20,
        fontSize: 14,
        color: color,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}

class PlaceHolder extends StatelessWidget {
  const PlaceHolder({
    Key? key,
    required this.path,
    required this.text,
  }) : super(key: key);

  final String path;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            height: 350,
            width: 350,
            image: Svg(path),
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: 350,
            child: InfoText(
              title: text,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}

void snackbar(BuildContext context, String text, [int? duration]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: Duration(
        milliseconds: duration ?? 250,
      ),
    ),
  );
}

class UrlText extends pw.StatelessWidget {
  UrlText({required this.text, required this.url});

  final String text;
  final String url;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(left: 5, right: 5),
      child: pw.UrlLink(
        destination: url,
        child: pw.Text(
          text,
          style: const pw.TextStyle(
            decoration: pw.TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}

class AppHeading extends StatelessWidget {
  const AppHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Resume-X',
      style: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey,
      ),
    );
  }
}

class ListPoints extends StatelessWidget {
  const ListPoints({
    Key? key,
    required this.points,
    required this.color,
  }) : super(key: key);
  final List<String> points;
  final Color color;
  List<Widget> makePoints(List<String> points) {
    List<Widget> list = [];
    for (var i = 0; i < points.length; i++) {
      list.add(
        InfoText(
          title: '${points[i]}\n',
          color: color,
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: makePoints(points),
    );
  }
}

class Stars extends StatelessWidget {
  const Stars({
    Key? key,
    required this.count,
  }) : super(key: key);
  final int count;
  List<Widget> makeStars(int count) {
    List<Widget> list = [];
    for (var i = 0; i < count; i++) {
      list.add(const Icon(
        Icons.star,
        color: Colors.white,
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: makeStars(count),
    );
  }
}
