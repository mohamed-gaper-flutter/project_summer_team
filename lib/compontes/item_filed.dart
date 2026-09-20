import 'package:flutter/material.dart';

class ItemField extends StatelessWidget {
  final String lable;
  final String customText;
  final Icon icon;
  final TextInputType keyboardType;
  final TextEditingController textEditingController;
  const ItemField({
    super.key,
    required this.lable,
    required this.icon,
    required this.customText,
    required this.keyboardType,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$customText : ', style: TextStyle(fontSize: 22)),
        TextField(
          controller: textEditingController,
          textAlign: TextAlign.right,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xffF3F4F6),
            hintText: lable,
            suffixIcon: icon,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}
