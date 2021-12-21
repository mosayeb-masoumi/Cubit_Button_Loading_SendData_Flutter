import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test6/cubit/senddata_cubit.dart';
import 'package:test6/libraries.dart';
import 'package:test6/repository/my_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
             "send data to server by cubit technology" ,
            style: TextStyle(color: Colors.blueAccent , fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,),

            const SizedBox(
              height: 50,
            ),
            Container(
              child: BlocProvider(
                create: (context) => SenddataCubit(SendDataRepository()),
                child: BlocConsumer<SenddataCubit , SenddataState>(

                  listener: (context, state) {
                    if (state is SenddataError) {
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text(state.message)));
                    }
                    else if (state is SenddataLoaded) {
                      Scaffold.of(context).showSnackBar(const SnackBar(content: Text("data sent to server")));
                    }
                  },
                  builder: (context, state) {
                    if (state is SenddataLoading) {
                      return buildLoading(state);
                    } else if (state is SenddataLoaded) {
                      return buildSentLoadedData(state.strResult , context);
                    } else {
                      // means StudentListInitial
                      return buildInitialUi(context);
                    }
                  },

                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  // Widget buildSentLoadedData(String strResult, BuildContext context) {
  //   return Center(
  //     child: RaisedButton(
  //       child: Text("press"),
  //       onPressed: (){
  //         widgetInitializeView(context);
  //       },
  //     ),
  //   );
  // }
  //
  // Widget buildLoading(var state) {
  //   return Center(
  //     child: CircularProgressIndicator(),
  //   );
  // }
  //
  // Widget buildInitialUi(BuildContext context) {
  //   return Center(
  //     child: RaisedButton(
  //       child: Text("press"),
  //       onPressed: (){
  //         widgetInitializeView(context);
  //       },
  //     ),
  //   );
  // }
  //
  // void widgetInitializeView(BuildContext context) {
  //   final senddataCubit = BlocProvider.of<SenddataCubit>(context);
  //   senddataCubit.sendData();
  // }



  Widget buildSentLoadedData(String strResult, BuildContext context) {
    return InkWell(
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.orange
        ),
        child: const Center(
          child: Text(
            "press",
          ),
        ),
      ),

      onTap: (){
        widgetInitializeView(context);
      },
    );
  }

  Widget buildLoading(var state) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.orange
      ),
      child: const Center(
        child:  CircularProgressIndicator(color: Colors.red,),
      ),
    );
  }

  Widget buildInitialUi(BuildContext context) {
    return InkWell(
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.orange
        ),
        child: const Center(
          child: Text(
            "press",
          ),
        ),
      ),

      onTap: (){
        widgetInitializeView(context);
      },
    );
  }

  void widgetInitializeView(BuildContext context) {
    final senddataCubit = BlocProvider.of<SenddataCubit>(context);
    senddataCubit.sendData();
  }

}




