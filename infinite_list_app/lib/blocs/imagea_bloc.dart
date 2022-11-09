import 'package:bloc/bloc.dart';
import 'package:infinite_list_app/get_api.dart';
import '../states/ImageaState.dart';

// class ImageaBloc extends Bloc<ImageaEvent, ImageaState> {
//   final NUMBER_OF_IMAGES_PER_PAGE = 20;
//
//   ImageaBloc() : super(ImageaStateInitial());
//
//   @override
//   Stream<ImageaState> mapEventToState(ImageaBloc event) async* {
//     try{
//       final hasReachedEndOfPage = (state is ImageaStateSuccess &&
//           (state as ImageaStateSuccess).hasReachedEnd);
//       if (event is ImageaFetchedEvent && !hasReachedEndOfPage) {
//         if (state is ImageaStateSuccess) {
//           //1.loading page
//           //2. get images from api
//           //3. yield ImagesStateSuccess
//           final imageas = await fetchImage(0, NUMBER_OF_IMAGES_PER_PAGE);
//           yield ImageaStateSuccess(imageas: imageas, hasReachedEnd: false);
//         } else if (state is ImageaStateSuccess) {
//           int finalIndexOfCurrentPage =
//               (state as ImageaStateSuccess).imageas.length;
//           final imageas = await fetchImage(
//               finalIndexOfCurrentPage, NUMBER_OF_IMAGES_PER_PAGE);
//           final currentState = state as ImageaStateSuccess;
//           if (imageas.isEmpty) {
//             yield (state as ImageaStateSuccess)
//                 .cloneWith(imageas: imageas, hasReachedEnd: true);
//           } else {
//             yield ImageaStateSuccess(
//                 imageas: currentState.imageas + imageas, hasReachedEnd: false);
//           }
//         }
//       }
//     }catch(exception){
//       yield ImageaStateFailure();
//     }
//   }
// }

class ExampleBloc extends Cubit<ImageaState>{
  ExampleBloc(): super(ImageaStateInitial());

  init()async {
    final data = await fetchImage();
    emit(ImageaStateSuccess(imageas: data));
  }

}
