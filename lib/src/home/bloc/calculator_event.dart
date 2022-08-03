part of 'calculator_bloc.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();

  @override
  List<Object> get props => [];
}

class InputInserted extends CalculatorEvent {
  const InputInserted(this.input);

  final Input input;

  @override
  List<Object> get props => [input];
}

class EquationUpdated extends CalculatorEvent {
  const EquationUpdated(this.equation);

  final String equation;

  @override
  List<Object> get props => [equation];
}

class EquationCalculated extends CalculatorEvent {}

class AnswerDisplayed extends CalculatorEvent {}

class AnswerCleared extends CalculatorEvent {}

class BackspaceInserted extends CalculatorEvent {}

class AllCleared extends CalculatorEvent {}
