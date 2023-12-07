/*
 * Copyright (c) 2023. Patrick Schmidt.
 * All rights reserved.
 */

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

typedef ImageBuilder = Widget Function(BuildContext context, Widget image);

class WebRtc extends StatelessWidget {
  const WebRtc({
    Key? key,
    required this.camUri,
    required this.dio,
    this.headers = const {},
    this.rotation = 0,
    this.transform,
    this.stackContent = const [],
    this.imageBuilder,
  }) : super(key: key);
  final Uri camUri;
  final Map<String, String> headers;
  final int rotation;
  final Matrix4? transform;
  final List<Widget> stackContent;
  final ImageBuilder? imageBuilder;
  final Dio dio;

  @override
  Widget build(BuildContext context) => Placeholder();
}
