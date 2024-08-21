

import 'package:dinissa/util/app_constant.dart';
import 'package:flutter/material.dart';

class UsableTextInputField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String value) onTextChanged;
  final TextInputAction? action;
  final TextInputType? inputType;
  final FocusNode? node;
  final String? hint;
  final String label;
  final String? validator;

  const UsableTextInputField({
    super.key,
    required this.onTextChanged,
    required this.label,
    this.controller,
    this.hint,
    this.validator,
    this.action,
    this.inputType,
    this.node
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: formInputSpace),
        child: TextFormField(
            controller: controller,
            focusNode: node,
            textInputAction: action,
            keyboardType: inputType,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
                label: Text(
                  label,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal
                  ),
                ),
                hintText: hint,
                filled: true,
                fillColor: const Color(0XFFF9FAFC),
                contentPadding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 14.0),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                        width: 0.0,
                        color: Color(0XFFF9FAFC)
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                        width: 0.8,
                        color: Color(0XFF6E717C)
                    )
                ),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                        width: 1.0,
                        color: Theme.of(context).colorScheme.error
                    )
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always
            ),
            onChanged: (value) => onTextChanged(value),
            validator: (value) => validator
        )
    );
  }

}

class CustomDropTextInputField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String value) onTextChanged;
  final Function onTouched;
  final FocusNode? node;
  final String? hint;
  final String label;
  final String? validator;

  const CustomDropTextInputField({
    super.key,
    required this.onTextChanged,
    required this.onTouched,
    required this.label,
    this.controller,
    this.hint,
    this.validator,
    this.node
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: formInputSpace),
        child: TextFormField(
            controller: controller,
            focusNode: node,
            onTap: () => onTouched(),
            keyboardType: TextInputType.none,
            cursorColor: Colors.transparent,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
                label: Text(
                  label,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal
                  ),
                ),
                hintText: hint,
                filled: true,
                fillColor: const Color(0XFFF9FAFC),
                suffixIcon: const Icon(Icons.arrow_drop_down),
                contentPadding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 14.0),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                        width: 0.0,
                        color: Color(0XFFF9FAFC)
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                        width: 0.8,
                        color: Color(0XFF6E717C)
                    )
                ),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                        width: 1.0,
                        color: Theme.of(context).colorScheme.error
                    )
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always
            ),
            onChanged: (value) => onTextChanged(value),
            validator: (value) => validator
        )
    );
  }

}