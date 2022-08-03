part of 'calculator_bloc.dart';

enum Status { initial, inProgress, complete }

class CalculatorState extends Equatable {
  const CalculatorState({
    this.inputStatus = Status.initial,
    this.input = Input.empty,
    this.equation = '',
    this.answer = '',
    this.backspaceStatus = Status.initial,
    this.allClearStatus = Status.initial,
    this.answerStatus = Status.initial,
  });

  final Status inputStatus;
  final Input input;
  final String equation;
  final String answer;
  final Status backspaceStatus;
  final Status allClearStatus;
  final Status answerStatus;

  @override
  List<Object> get props => [
        inputStatus,
        input,
        equation,
        answer,
        backspaceStatus,
        allClearStatus,
        answerStatus,
      ];

  CalculatorState copyWith({
    Status? inputStatus,
    Input? input,
    String? equation,
    String? answer,
    Status? backspaceStatus,
    Status? allClearStatus,
    Status? answerStatus,
  }) {
    return CalculatorState(
      inputStatus: inputStatus ?? this.inputStatus,
      input: input ?? this.input,
      equation: equation ?? this.equation,
      answer: answer ?? this.answer,
      backspaceStatus: backspaceStatus ?? this.backspaceStatus,
      allClearStatus: allClearStatus ?? this.allClearStatus,
      answerStatus: answerStatus ?? this.answerStatus,
    );
  }
}
