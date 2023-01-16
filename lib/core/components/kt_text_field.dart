import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nft_call/core/constants/dt_text.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:nft_call/core/constants/vertical_space.dart';

class KTTextField extends StatefulWidget {
  const KTTextField({Key? key}) : super(key: key);

  @override
  State<KTTextField> createState() => _KTTextFieldState();
}

class _KTTextFieldState extends State<KTTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DTText(label: "Email", style: context.regular8),
        const VerticalSpace(),
        Container(
          alignment: Alignment.centerLeft,
          height: 50.0,
          child: const TextField(
            keyboardType: TextInputType.emailAddress,
            style:  TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
            ),
          ),
        ),
      ],
    );
  }
}
