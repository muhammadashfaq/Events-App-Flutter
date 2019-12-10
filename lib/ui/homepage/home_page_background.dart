import 'package:flutter/material.dart';



class HomePageBackground extends StatelessWidget {

  final screenHeight;
  HomePageBackground({@required this.screenHeight });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return ClipPath(
      clipper: BottomShapeClipper(),
      child: Container(
        height: screenHeight * 0.5,
        color: themeData.primaryColor,
      ),
    );

  }
}


class BottomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curvedStartPoint = Offset(0,size.height * 0.85);
    Offset curvedEndPoint = Offset(size.width,size.height * 0.85);
    path.lineTo(curvedStartPoint.dx, curvedEndPoint.dy);
    path.quadraticBezierTo(size.width/2, size.height, curvedEndPoint.dx, curvedEndPoint.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}
