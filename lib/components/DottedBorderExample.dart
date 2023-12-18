import "dart:math";
import "package:flutter/material.dart";

class DottedBorder extends CustomPainter {
  final int numberOfStories;
  final int spaceLength;
  final int numberOfWatchedStories;
  double startOfArcInDegree = 0;

  DottedBorder(
      {required this.numberOfStories,
      required this.numberOfWatchedStories,
      this.spaceLength = 7});

  double inRads(double degree) {
    return (degree * pi) / 180;
  }

  @override
  bool shouldRepaint(DottedBorder oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double arcLength =
        (360 - (numberOfStories * spaceLength)) / numberOfStories;

    if (arcLength <= 0) {
      arcLength = 360 / spaceLength - 1;
    }

    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    for (int i = 0; i < numberOfStories; i++) {
      // Translate to the center of the canvas
      canvas.drawArc(
          rect,
          inRads(startOfArcInDegree),
          inRads(arcLength),
          false,
          Paint()
            ..color = i < numberOfWatchedStories ? Colors.grey : Colors.teal
            ..strokeWidth = 3.4
            ..style = PaintingStyle.stroke);
      startOfArcInDegree += arcLength + spaceLength;
    }
    canvas.rotate(-pi / 2);
  }
}

class DottedBorderExample extends StatelessWidget {
  final int numberOfStories;
  final int numberOfWatchedStories;
  const DottedBorderExample({
    super.key,
    required this.numberOfStories,
    required this.numberOfWatchedStories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 70,
            height: 70,
            child: Transform.rotate(
              angle: -pi / 2,
              child: CustomPaint(
                painter: DottedBorder(
                  numberOfStories: numberOfStories,
                  numberOfWatchedStories: numberOfWatchedStories,
                ),
              ),
            ),
          ),
          // Replace the Container with Image widget
          SizedBox(
            width: 60,
            height: 60,
            child: ClipOval(
              child: Image.asset(
                'assets/images/default_profile_image.jpg', // Replace with your image URL
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
