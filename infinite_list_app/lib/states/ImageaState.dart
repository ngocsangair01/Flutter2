import 'package:equatable/equatable.dart';
import '../models/images.dart';

abstract class ImageaState extends Equatable {
  const ImageaState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ImageaStateInitial extends ImageaState {}

class ImageaStateFailure extends ImageaState {}

class ImageaStateSuccess extends ImageaState {
  final List<Imagea> imageas;

  const ImageaStateSuccess({required this.imageas});

  ImageaStateSuccess cloneWith(
      {required List<Imagea> imageas, required bool hasReachedEnd}) {
    return ImageaStateSuccess(
      imageas: imageas ?? this.imageas,
    );
  }
}
