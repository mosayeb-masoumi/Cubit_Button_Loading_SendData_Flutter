abstract class MyRepository {
  Future<String> sendData(String myData);
}

class SendDataRepository extends MyRepository {

  @override
  Future<String> sendData(myData) async{

    await Future.delayed(Duration(seconds: 3));
    String strResult = myData;
    return strResult == null ? "" : strResult;

  }
}