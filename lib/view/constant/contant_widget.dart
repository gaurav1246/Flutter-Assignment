import 'package:flutter/material.dart';

InputDecoration commonDecoration(
    {String? label, required BuildContext context}) {
  return InputDecoration(
    // hintText: "${"enter".tr} $label",
    // labelText: "$label",
    focusColor: Colors.white,
    hoverColor: Colors.white,
    fillColor: Colors.white, // Theme.of(context).colorScheme.background,
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).dividerColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).dividerColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).dividerColor),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).dividerColor,
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
      ),
    ),
    errorStyle: const TextStyle(color: Colors.red),
  );
}

customButtonDecoration() {
  return BoxDecoration(
      color: Colors.blue.shade100, borderRadius: BorderRadius.circular(5));
}
