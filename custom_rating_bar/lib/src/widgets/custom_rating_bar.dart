import 'package:flutter/material.dart';

enum RatingIconType { star, heart, emoji }

class CustomRatingBar extends StatefulWidget {
  final int itemCount;
  final double initialRating;
  final double size;
  final double spacing;
  final Duration animationDuration;
  final RatingIconType iconType;
  final ValueChanged<double> onRatingChanged;
  final Color activeColor;
  final Color inactiveColor;
  final bool allowHalfRating;

  const CustomRatingBar({
    super.key,
    this.itemCount = 5,
    this.initialRating = 0,
    this.size = 32,
    this.spacing = 2,
    this.animationDuration = const Duration(milliseconds: 300),
    this.iconType = RatingIconType.star,
    required this.onRatingChanged,
    this.activeColor = Colors.amber,
    this.inactiveColor = Colors.grey,
    this.allowHalfRating = true,
  });

  @override
  State<CustomRatingBar> createState() => _CustomRatingBarState();
}

class _CustomRatingBarState extends State<CustomRatingBar> {
  late double _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  // ---------- TAP ----------
  void _updateByTap(int index) {
    double newRating;

    if (!widget.allowHalfRating) {
      newRating = index + 1.0;
    } else {
      if (_rating == index + 0.5) {
        newRating = index + 1.0;
      } else {
        newRating = index + 0.5;
      }
    }

    _setRating(newRating);
  }

  // ---------- SWIPE ----------
  void _updateBySwipe(Offset localPosition) {
    final double itemWidth = widget.size + widget.spacing;
    int index = (localPosition.dx / itemWidth).round();

    index = index.clamp(0, widget.itemCount - 1);

    double newRating = widget.allowHalfRating
        ? index + 0.5
        : index + 1.0;

    _setRating(newRating);
  }

  void _setRating(double value) {
    if (value != _rating) {
      setState(() => _rating = value);
      widget.onRatingChanged(_rating);
    }
  }

  IconData _iconData() {
    switch (widget.iconType) {
      case RatingIconType.heart:
        return Icons.favorite;
      case RatingIconType.emoji:
        return Icons.emoji_emotions;
      case RatingIconType.star:
      default:
        return Icons.star;
    }
  }

  Widget _buildIcon(int index) {
    final iconPosition = index + 1;

    final bool isFull = _rating >= iconPosition;
    final bool isHalf =
        widget.allowHalfRating && _rating + 0.5 == iconPosition;

    return GestureDetector(
      onTap: () => _updateByTap(index),
      child: AnimatedContainer(
        duration: widget.animationDuration,
        margin: EdgeInsets.symmetric(horizontal: widget.spacing / 2),
        child: Stack(
          children: [
            Icon(
              _iconData(),
              size: widget.size,
              color: widget.inactiveColor,
            ),
            if (isFull)
              Icon(
                _iconData(),
                size: widget.size,
                color: widget.activeColor,
              ),
            if (isHalf)
              ClipRect(
                clipper: _HalfClipper(),
                child: Icon(
                  _iconData(),
                  size: widget.size,
                  color: widget.activeColor,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (d) =>
          _updateBySwipe(d.localPosition),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          widget.itemCount,
              (index) => _buildIcon(index),
        ),
      ),
    );
  }
}

class _HalfClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) =>
      Rect.fromLTRB(0, 0, size.width / 2, size.height);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
