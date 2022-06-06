import 'package:flutter/material.dart';
import 'package:ui_testing/utils/inner_shadow.dart';
import 'package:ui_testing/utils/image_paths.dart';
import 'package:ui_testing/widgets/sign_up_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        _buildBackground(context),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 35.0),
            _buildTitle(context),
            _buildInputTextField(context,
                controller: _nameController, hintText: 'Enter your name…'),
            const SizedBox(height: 12.0),
            _buildInputTextField(context,
                controller: _emailController, hintText: 'Enter your email…'),
            const SizedBox(height: 24.0),
            SignUpButton(
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBackground(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Image.asset(
            ImagePaths.settingsIcon,
            height: 98,
            width: 145,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Image.asset(
              ImagePaths.dialogBackground,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(flex: 1, child: SizedBox.shrink()),
          Expanded(
            flex: 8,
            child: InnerShadow(
              blur: 2.0,
              color: Colors.black.withOpacity(0.7),
              offset: const Offset(0.0, 1.0),
              child: const Text(
                'Sign up for \nour newsletter',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'SFCompactRoundedHeavy',
                  color: Color(0xff868686),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  ImagePaths.closeButton,
                  height: 14.0,
                  width: 14.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputTextField(
    BuildContext context, {
    TextEditingController? controller,
    String? hintText,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagePaths.textfieldBorder),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: TextField(
        controller: controller,
        cursorColor: const Color(0xffFD6D00),
        cursorWidth: 5.0,
        cursorHeight: 24.0,
        cursorRadius: const Radius.circular(2.0),
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'SFMonoBold',
          color: Color(0xffCAFFDD),
        ),
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          hintStyle: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            fontFamily: 'SFMonoBold',
            color: Color(0xffCAFFDD),
          ),
        ),
      ),
    );
  }
}
