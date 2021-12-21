
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../repository/my_repository.dart';

part 'senddata_state.dart';

class SenddataCubit extends Cubit<SenddataState> {


  final MyRepository _myRepository;

  SenddataCubit(this._myRepository) : super(SenddataInitial());


  Future<void> sendData() async{
    try{
      emit(SenddataLoading());
      final strResult = await _myRepository.sendData();
      emit(SenddataLoaded(strResult));
    } on Exception {
      emit(SenddataError("couldent send data to server"));
    }
  }
}
