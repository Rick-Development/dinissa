

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
                contentPadding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 14.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                        width: 1.0,
                        color: Theme.of(context).colorScheme.inversePrimary
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                        width: 1.0,
                        color: Theme.of(context).colorScheme.primary
                    )
                ),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                        width: 1.0,
                        color: Theme.of(context).colorScheme.error
                    )
                )
            ),
            onChanged: (value) => onTextChanged(value),
            validator: (value) => validator
        )
    );
  }

}