import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nft_call/core/constants/theme/theme_manager.dart';

class ChoiceChipWidget extends StatefulWidget {
  final void Function(String) callback;
  int _value;
  ChoiceChipWidget({Key? key,required int index, required this.callback}) : _value = index, super(key: key);

  @override
  State<ChoiceChipWidget> createState() => _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  List<String> options = ["Today", "Ongoing", "Upcoming", "Popular"];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          children: List<Widget>.generate(
            options.length,
            (int idx) {
              return Padding(
                padding: const EdgeInsets.only(left: 16),
                child: InkWell(
                  child: ChoiceChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        side: const BorderSide(width: 1, color: Colors.white),
                      ),
                      label: Text(
                        options[idx],
                        style: TextStyle(
                            fontSize: 12,
                            color: ThemeManager.instance?.getCurrentTheme
                                .colorTheme.textColor),
                      ),
                      selected: widget._value == idx,
                      selectedColor: const Color(0xff264d64),
                      onSelected: (bool selected) {
                        setState(() {
                          setValue(idx);
                          widget.callback(options[widget._value]);
                        });
                      }),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
  void setValue(int tag){
    setState(() {
      widget._value = tag;
    });
  }
}
