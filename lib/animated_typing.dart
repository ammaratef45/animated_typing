library animated_typing;

import 'package:animated_typing/string_tween.dart';
import 'package:flutter/material.dart';

/// [AnimatedTyping] widget will animate the showing of the passed [text].
/// You can pass [style] and [duration] as well.
class AnimatedTyping extends StatefulWidget {
  /// The [text] shown in the widget.
  final String text;

  /// The [style] of the shown text.
  final TextStyle? style;

  /// [duration] of the animation.
  final Duration? duration;

  /// [loop] the animation (write and delete text forever)
  final bool loop;

  /// Create a new widget passing [text], [style], and [duration]
  /// text can't be null.
  /// if [duration] is null a 3 seconds [duration] will be used
  const AnimatedTyping({
    Key? key,
    required this.text,
    this.style,
    this.duration,
    this.loop = false,
  }) : super(key: key);

  @override
  State<AnimatedTyping> createState() => _AnimatedTypingState();
}

class _AnimatedTypingState extends State<AnimatedTyping> {
  String begin = '';

  /// Build the widget
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<String>(
      tween: StringTween(
        begin: begin,
        end: begin.isEmpty ? widget.text : '',
      ),
      duration: widget.duration ??
          Duration(
            seconds: 3,
          ),
      onEnd: () {
        if (widget.loop)
          setState(() {
            begin = begin.isEmpty ? widget.text : '';
          });
      },
      builder: (context, value, child) {
        return Text(
          value,
          style: widget.style,
        );
      },
    );
  }
}
