import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/material.dart';

class AppsFlyerHome extends StatefulWidget {
  const AppsFlyerHome({Key? key}) : super(key: key);

  @override
  _AppsFlyerHomeState createState() => _AppsFlyerHomeState();
}

class _AppsFlyerHomeState extends State<AppsFlyerHome> {
  late AppsflyerSdk appsflyerSdk;

  String afDevKey = "mLcR4KbC2VASobWmALGrGQ";
  String appId = "com.tps.appsflyerdemo";

  @override
  void initState() {
    setupAppFlyer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Press Button to initialte event"),
                  onPressed: () {
                    appsflyerSdk.logEvent(
                        "JD Test", {"JD Pressed Key": "JD Pressed Value"});
                    // appsflyerSdk.onDeepLinking(callback)
                    appsflyerSdk.setPushNotification(true);
                  })
            ],
          ),
        ));
  }

  //method
  void setupAppFlyer() {
    try {
      Map appsFlyerOptions = {
        "afDevKey": afDevKey,
        "afAppId": appId,
        "isDebug": true
      };

      appsflyerSdk = AppsflyerSdk(appsFlyerOptions);
      appsflyerSdk.initSdk(
          registerConversionDataCallback: true,
          registerOnAppOpenAttributionCallback: true,
          registerOnDeepLinkingCallback: true);
    } catch (e) {
      print(e);
    }
  }
}
//function
// void setupAppFlyer() {}