import 'package:flutter/material.dart';

///Custom TextFormField widget
class CustomTextFormField extends StatelessWidget {
  final Key keyField;
  ///Name field
  final String fieldName;
  ///Controller field
  final TextEditingController textEditingController;
  ///Validator field
  final String? Function(String? value)? validator;
  ///Class constructor
  const CustomTextFormField({
    required this.keyField,
    required this.fieldName,
    required this.textEditingController,
    required this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
              color: const Color(0xffFFF5E9),
              borderRadius: BorderRadius.circular(30),
          ),
          child: const Icon(
            Icons.lock_open_outlined,
            size: 15,
            color: Color(0xffE5BE90),
          ),
        ),
        const SizedBox(width: 30),
        Expanded(
          child: TextFormField(
            key: keyField,
            controller: textEditingController,
            decoration: InputDecoration(
              labelText: fieldName,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w200,
                ),
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
