import 'package:equatable/equatable.dart';
import '../models/Subject.dart';

abstract class SubjectState extends Equatable {
  const SubjectState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SubjectStateInitial extends SubjectState {}

class SubjectStateFailure extends SubjectState {}

class SubjectStateSuccess extends SubjectState {
  final List<Subject> subjects;

  SubjectStateSuccess({required this.subjects});

  SubjectStateSuccess copyWith({required List<Subject> subjects}) {
    return SubjectStateSuccess(subjects: subjects ?? this.subjects);
  }
}
