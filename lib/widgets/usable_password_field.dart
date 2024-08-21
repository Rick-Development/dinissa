
import 'package:dinissa/util/app_constant.dart';
import 'package:dinissa/widgets/usable_clickable_widget.dart';
import 'package:flutter/material.dart';

class UsablePasswordField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String value) onTextChanged;
  final Function(bool isVisible) visibilityToggle;
  final TextInputAction action;
  final FocusNode? node;
  final String? hint;
  final String label;
  final String? validator;
  final bool visibleText;

  const UsablePasswordField({
    super.key,
    required this.label,
    required this.onTextChanged,
    required this.visibilityToggle,
    required this.action,
    required this.visibleText,
    this.controller,
    this.node,
    this.hint,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: formInputSpace),
        child: TextFormField(
            textInputAction: action,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                suffixIcon: UsableClickWidget(
                    child: Icon(visibleText ? Icons.visibility_off_rounded : Icons.visibility_rounded),
                    onClick: () => visibilityToggle(visibleText)
                ),
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
            validator: (value) => validator,
            obscureText: visibleText,
            focusNode: node
        )
    );
  }
  
}