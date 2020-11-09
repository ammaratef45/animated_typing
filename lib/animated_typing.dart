library animated_typing;

import 'package:animated_typing/string_tween.dart';
import 'package:flutter/material.dart';

/// [AnimatedTyping] widget will animate the showing of the passed [text].
/// You can pass [style] and [duration] as well.
class AnimatedTyping extends StatelessWidget {
  /// The [text] shown in the widget.
  final String text;

  /// The [style] of the shown text.
  final TextStyle style;

  /// [duration] of the animation.
  final Duration duration;

  /// Create a new widget passing [text], [style], and [duration]
  /// text can't be null.
  /// if [duration] is null a 3 seconds [duration] will be used
  const AnimatedTyping({
    Key key,
    @required this.text,
    this.style,
    this.duration,
  })  : assert(text != null),
        super(key: key);

  /// Build the widget
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<String>(
      tween: StringTween(
        begin: '',
        end: text,
      ),
      duration: duration ??
          Duration(
            seconds: 3,
          ),
      builder: (context, value, child) {
        return Text(
          value,
          style: style,
        );
      },
    );
  }
}
