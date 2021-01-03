import 'package:flutter/material.dart';

class InkWellWidget extends StatefulWidget {
  final Widget Function(bool isTapped) builder;
  final Color color;
  final BorderRadius borderRadius;
  final ShapeBorder customBorder;
  final VoidCallback onTap;

  const InkWellWidget({
    @required this.builder,
    @required this.onTap,
    this.color,
    this.borderRadius,
    this.customBorder,
    Key key,
  }) : super(key: key);

  @override
  _InkWellWidgetState createState() => _InkWellWidgetState();
}

class _InkWellWidgetState extends State<InkWellWidget> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    final color = this.widget.color ?? Colors.grey.withOpacity(0.2);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: color,
        highlightColor: color,
        borderRadius: widget.borderRadius,
        onTap: widget.onTap,
        child: widget.builder(isTapped),
        onHighlightChanged: (isTapped) =>
            setState(() => this.isTapped = isTapped),
        customBorder: widget.customBorder,
      ),
    );
  }
}

class CustomBorder extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  ShapeBorder scale(double t) => CustomBorder();

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) =>
      _buildPath(rect);

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) =>
      _buildPath(rect);

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    final path = _buildPath(rect);

    canvas.drawPath(path, Paint());
  }

  Path _buildPath(Rect rect) {
    final size = rect.size;
    final double width = 50;
    final double depth = 40;

    final path = Path()

      /// top
      ..lineTo(size.width / 2 - width / 2, 0)
      ..relativeQuadraticBezierTo(width / 2, depth, width, 0)
      ..lineTo(size.width, 0)

      /// right
      ..lineTo(size.width, size.height / 2 - width / 2)
      ..relativeQuadraticBezierTo(-depth, width / 2, 0, width)
      ..lineTo(size.width, size.height)

      /// bottom
      ..lineTo(size.width / 2 + width / 2, size.height)
      ..relativeQuadraticBezierTo(-width / 2, -depth, -width, 0)
      ..lineTo(0, size.height)

      /// left
      ..lineTo(0, size.height / 2 + width / 2)
      ..relativeQuadraticBezierTo(depth, -width / 2, 0, -width)
      ..lineTo(0, 0)
      ..close();

    return path;
  }
}
