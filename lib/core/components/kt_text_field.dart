import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nft_call/core/constants/dt_text.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:nft_call/core/constants/vertical_space.dart';

class KTTextField extends StatefulWidget {
  final TextEditingController textController;
  final String title;

  const KTTextField({
    Key? key,
    required this.textController,
    required this.title,
  }) : super(key: key);

  @override
  State<KTTextField> createState() => _KTTextFieldState();
}

class _KTTextFieldState extends State<KTTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DTText(
          label: widget.title,
          style: context.semiBold14,
          color: Colors.white,
        ),
        const VerticalSpace(
          spaceAmount: 2,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: const Color(0xff3a5979),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60.0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
                obscureText: widget.title == "Email" ? false : true,
                autocorrect: false,
                enableSuggestions: false,
                decoration: InputDecoration(
                    prefixIcon: widget.title == "Email"
                        ? const Icon(
                            Icons.email,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.key,
                            color: Colors.white,
                          ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: context.textColor),
                    hintText: "Type in your text",
                    fillColor: Colors.transparent.withOpacity(0.1)),
                controller: widget.textController),
          ),
        ),
      ],
    );
  }

  void changeObsecure(bool isSelected) {}
}
