import 'package:flutter/material.dart';

class BackgroundWave extends StatelessWidget {
  final double height;

  const BackgroundWave({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          ClipPath(
            clipper: BackgroundWaveClipper(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: height,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Theme.of(context).primaryColor.withValues(alpha: 1),
                    Theme.of(context).primaryColor.withValues(alpha: 0.5),
                  ],
                  radius: 1.8,
                ),
              ),
            ),
          ),
          height >= 200
              ? ClipPath(
                  clipper: BackgroundWaveClipperInner(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: height,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          Theme.of(context).primaryColor.withValues(alpha: 1),
                          Theme.of(context).primaryColor.withValues(alpha: 0.8),
                        ],
                        radius: 1.8,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class BackgroundWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double minSize = 100.0;
    // when h = max = 280
    // h = 280, p1 = 210, p1Diff = 70
    // when h = min = 140
    // h = 140, p1 = 140, p1Diff = 0
    final p1Diff = ((minSize - size.height) * 0.5).truncate().abs();
    path.lineTo(0.0, size.height - p1Diff);

    final controlPoint = Offset(size.width * 0.4, size.height);
    final endPoint = Offset(size.width, minSize);

    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(BackgroundWaveClipper oldClipper) => oldClipper != this;
}

class BackgroundWaveClipperInner extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double minSize = 80.0;
    if (size.height == 100.0) minSize = size.height;

    final p1Diff = ((minSize - size.height) * 0.5).truncate().abs();
    path.lineTo(0.0, size.height - p1Diff);

    final controlPoint = Offset(size.width * 0.4, size.height);
    final endPoint = Offset(size.width, minSize);

    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(BackgroundWaveClipperInner oldClipper) =>
      oldClipper != this;
}
