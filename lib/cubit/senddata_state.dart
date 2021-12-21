part of 'senddata_cubit.dart';

@immutable
abstract class SenddataState {
  const SenddataState();
}

class SenddataInitial extends SenddataState {
 const SenddataInitial();
}

// loading
class SenddataLoading extends SenddataState {
  const SenddataLoading();
}


//loaded
class SenddataLoaded extends SenddataState {
  final String strResult;
  const SenddataLoaded(this.strResult);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SenddataLoaded &&
          runtimeType == other.runtimeType &&
          strResult == other.strResult;

  @override
  int get hashCode => strResult.hashCode;
}



//error
class SenddataError extends SenddataState {
  final String message;
  const SenddataError(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SenddataError &&
              runtimeType == other.runtimeType &&
              message == other.message;

  @override
  int get hashCode => message.hashCode;
}
