import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_study_1/Nasa_Module/Stores/apodStore.dart';
import 'package:flutter_study_1/Services/translateKey.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ApodView extends StatelessWidget {
  final Apodstore apodStore = Apodstore();

  ApodView() {
    apodStore.fetchApod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Flexible(
          child: Text(Translatekey.titleHome.translate(context), style: TextStyle(color: Colors.white),),
        ),
        backgroundColor: Color(0X120F17),
        actions: [
          IconButton(icon: const Icon(Icons.calendar_month, color: Colors.white,), onPressed: () {
            apodStore.selectDate(context);
          })
        ],
      ),
      backgroundColor: Color(0X120F17),
      body: SingleChildScrollView(
        child: Center (
          child: Observer(
          builder: (_) {
            if (apodStore.isLoading) {
              return CircularProgressIndicator();
            } else if (apodStore.apodModel != null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.only(left: 18, right: 18),
                    child: Text(
                    'Astronomy Picture of the Day',
                    style: TextStyle( color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30, bottom: 30),
                     child: Text(apodStore.apodModel?.date ?? "Loading...",
                     style: TextStyle( color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  Padding(padding: EdgeInsets.only(left: 100, right: 100),
                     child: Text(apodStore.apodModel?.title ?? "Loading...",
                      style: TextStyle( color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      ),
                  ),
                  Padding(padding: const EdgeInsets.all(15.0),
                      child: Text(apodStore.apodModel?.explanation ?? "Loading...",
                          style: TextStyle( color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal)
                          ),
                      ),
                  Padding(padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(apodStore.apodModel?.url ?? 'no URL FOUND'),
                  )
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 30), 
                      child: SizedBox(width: 169, height: 40,
                      child:ElevatedButton(
                        onPressed: () {
                           Fluttertoast.showToast(msg: "Photo saved!", gravity: ToastGravity.TOP, timeInSecForIosWeb: 4, backgroundColor: Colors.white, textColor: Colors.black);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 26, 19, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), 
                          ),
                        ),
                        child: Text("Save", style: TextStyle( color: Colors.white)),
                      ),
                      ) 
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 30), 
                      child: SizedBox(width: 169, height: 40,
                      child:ElevatedButton(
                        onPressed: () {
                          Fluttertoast.showToast(msg: "E ai gabs bichinha", gravity: ToastGravity.TOP, timeInSecForIosWeb: 4, backgroundColor: Colors.white, textColor: Colors.black);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 26, 19, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), 
                          ),
                        ),
                        child: Text("Share", style: TextStyle( color: Colors.white)),
                      ),
                      ) 
                    ),
                  ],
                ),    
                ],
              );
            } else {
              return Text("Fail to load APOD data");
            }
          },
      ))),
    );
  }
}
