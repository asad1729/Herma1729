
import 'package:flutter/material.dart';

show_snack_bar(BuildContext context, String text)
{
  return ScaffoldMessenger.of(context).show_snack_bar(
    SnackBar(
    context:Text(text),
  ))
}