
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void customNavigate(context,String path){
  GoRouter.of(context).push(path);
}

//
void navigateReplacment({
  required BuildContext context,
  required String route,
  dynamic arg,
}) {
  Navigator.pushReplacementNamed(
    context,
    route,
    arguments: arg,
  );
}


