import 'package:flutter/material.dart';
import 'package:minimal_diary/generated/l10n.dart';

extension ContextExtensions on BuildContext{
  S get localization => S.of(this);
}