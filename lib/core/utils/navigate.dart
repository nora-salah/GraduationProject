import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void customNavigate(context, String path, {Object? extra}) {
  GoRouter.of(context).push(path, extra: extra);
}

void customNavigateReplacment(context, String path) {
  GoRouter.of(context).pushReplacementNamed(path);
}
