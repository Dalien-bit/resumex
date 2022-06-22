import 'package:flutter/material.dart';
import 'package:resumex/widgets/text.dart';

const String bullet = "\u2022";

const inputDecoration = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
    ),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  //hintText: 'John Dow',
);

class InputBox extends StatelessWidget {
  const InputBox({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.infoText,
    this.inputType,
    this.validation,
    this.onChanged,
    this.maxLines,
    this.obscureText,
    this.onTap,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String infoText;
  final String? Function(String?)? validation;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final TextInputType? inputType;
  final int? maxLines;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoText(
            title: infoText,
            color: Colors.black,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            obscureText: obscureText ?? false,
            maxLines: maxLines ?? 1,
            onChanged: onChanged,
            onTap: onTap,
            controller: controller,
            keyboardType: inputType,
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              hintText: hintText,
            ),
            validator: validation,
          ),
        ],
      ),
    );
  }
}
