import 'package:dung_dat_deo/states/SubjectState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../apis/subject_api.dart';

class SubjectBloc extends Cubit<SubjectState>{
  SubjectBloc(): super(SubjectStateInitial());
  init() async{
    final data = await getSubject();
    emit(SubjectStateSuccess(subjects: data));
  }
}