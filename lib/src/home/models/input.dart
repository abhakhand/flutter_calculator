import 'package:equatable/equatable.dart';

class Input extends Equatable {
  const Input({
    this.value = '',
    this.isOperator = false,
  });

  final String value;
  final bool isOperator;

  static const empty = Input();

  @override
  List<Object> get props => [value, isOperator];
}
