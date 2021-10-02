import 'package:flutter/foundation.dart';

import 'lo_status.dart';
import 'types.dart';

class LoFieldState<T> {
  LoFieldState({
    required this.name,
    required this.onChanged,
    required this.validate,
    this.initialValue,
  })  : touched = false,
        value = initialValue,
        error = null;

  /// {@template LoFieldState.name}
  /// Unique name for this across the form.
  /// {@endtemplate}
  final String name;

  /// Function that should be called with every change
  /// to update the state accordingly.
  final ValueChanged<T> onChanged;

  /// {@template LoFieldState.validate}
  /// Function that validates new values and returns an error message
  /// if invalid they are invalid, or null otherwise.
  /// {@endtemplate}
  final FieldValidateFunc<T>? validate;

  /// {@template LoFieldState.initialValue}
  /// The initial value that makes [status] pure.
  /// {@endtemplate}
  final T? initialValue;

  /// An indicator whether the field has been focused or not.
  bool touched;

  /// The current value, initialized as [initialValue].
  T? value;

  /// The current error message.
  String? error;

  /// The current field status:
  ///
  /// * [LoStatus.pure], if the [value] equals [initialValue].
  /// * [LoStatus.valid], if the [error] is null.
  /// * [LoStatus.invalid], if the [error] is not null.
  LoStatus get status {
    if (error != null) {
      return LoStatus.invalid;
    } else if (value == initialValue) {
      return LoStatus.pure;
    } else {
      return LoStatus.valid;
    }
  }
}