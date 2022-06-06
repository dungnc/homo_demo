import 'package:flutter/material.dart';
import 'package:ui_testing/utils/inner_shadow.dart';

// button's outline gradient
const _kOutlineGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [
    0.0,
    0.21,
    0.45,
    0.59,
    1.0,
  ],
  colors: [
    Color(0xff9A9BA6),
    Color(0xffFFFFFF),
    Color(0xffCDCDD3),
    Color(0xffEBEBEB),
    Color(0xffA7A8B0),
  ],
);

class SignUpButton extends StatefulWidget {
  final void Function() onTap;
  const SignUpButton({Key? key, required this.onTap}) : super(key: key);

  @override
  _SignUpButtonState createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  bool _beingTapped = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: _kOutlineGradient,
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: (details) {
          _beingTapped = true;
          setState(() {});
        },
        onTapUp: (details) {
          _beingTapped = false;
          setState(() {});
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 45.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: _beingTapped
                ? null
                : [
                    BoxShadow(
                      color: const Color(0xff000000).withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 8),
                    ),
                    BoxShadow(
                      color: const Color(0xff000000).withOpacity(0.4),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: _beingTapped ? [0.0, 0.08] : [0.08, 0.08],
              colors: const [Color(0xffFD6D00), Color(0xffFF872D)],
            ),
          ),
          child: InnerShadow(
            blur: 2.0,
            color: const Color(0xff000000).withOpacity(0.2),
            offset: const Offset(0.0, 1.0),
            child: Text(
              'SIGN UP',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w800,
                fontFamily: 'SFMonoBold',
                color: Colors.white,
                shadows: <Shadow>[
                  Shadow(
                    offset: const Offset(0, -2),
                    blurRadius: 2.0,
                    color: const Color(0xff000000).withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
