import 'package:flutter/material.dart';

class HttpAppError {
  final String message;
  final int? code;
  final VoidCallback? callToAction;
  const HttpAppError({required this.message, this.code, this.callToAction});
}
