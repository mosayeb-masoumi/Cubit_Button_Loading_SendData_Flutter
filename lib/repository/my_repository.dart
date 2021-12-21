abstract class MyRepository {
  Future<String> sendData();
}

class SendDataRepository extends MyRepository {

  @override
  Future<String> sendData() async{

    await Future.delayed(Duration(seconds: 3));
    String strResult = "sent";
    return strResult == null ? "" : strResult;

  }
}