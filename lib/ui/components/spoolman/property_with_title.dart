/*
 * Copyright (c) 2024. Patrick Schmidt.
 * All rights reserved.
 */

import 'package:flutter/material.dart';

class PropertyWithTitle extends StatelessWidget {
  const PropertyWithTitle({super.key, required this.title, required this.property});

  factory PropertyWithTitle.text({required String title, required String property}) {
    return PropertyWithTitle(title: title, property: Text(property));
  }

  final String title;
  final Widget property;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var subtitleTheme = textTheme.bodyMedium?.copyWith(fontSize: 13, color: textTheme.bodySmall?.color);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, textAlign: TextAlign.left),
        const SizedBox(height: 2),
        // Set default style for all properties widgets of kind text
        DefaultTextStyle(
          style: subtitleTheme!,
          textAlign: TextAlign.left,
          child: property,
        ),
      ],
    );
  }
}
