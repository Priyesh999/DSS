import 'package:dss_code/screen/splash/splash_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/appImages.dart';

class SplashView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return SplashViewSate();
  }

}

class SplashViewSate extends GetView<SplashController>{



  @override
  Widget build(BuildContext context) {
    controller.navigateToView();
    final size = MediaQuery.of(context).size;
    return

      Scaffold(
        resizeToAvoidBottomInset: false,
        // backgroundColor: const Color(0xFF21899C),
        backgroundColor: Color(0xff3274AD),
        body: SafeArea(
          child: Column(
            children: [
              //to give space card from top
              const Expanded(
                flex: 1,
                child: Center(),
              ),

              //page content
              Expanded(
                flex: 11,
                child: buildCard(size),
              ),
            ],
          ),
        ),
      );
  }

  Widget buildCard(Size size) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //build minimize icon
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 35,
                height: 4.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            SizedBox(
              height: size.height * 0.01,
            ),
            //logo section
            Center(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // logo(140, 240)
                    Image.asset(
                      AppImages.logo,
                      height: size.height / 7,
                    ),
                    SizedBox(width: 12),
                    // Image.asset("assets/images/dsslogo.jpg",
                    //     height: size.height / 7)
                  ]),
            ),

            SizedBox(
              height: size.height * 0.10,
            ),

            Center(
                child: SizedBox(
                    height: 50,
                    width: 50,
                    child:
                    CircularProgressIndicator(color: Color(0xffe88131)))),

            SizedBox(
              height: size.height * 0.20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(child: Divider()),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  'We can Connect with',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: const Color(0xFF969AA8),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  width: 16,
                ),
                const Expanded(child: Divider()),
              ],
            ),
            buildFooter(size),
            SizedBox(
              height: size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }

  Widget logo(double height_, double width_) {
    return Image.asset(
      AppImages.logo,
      height: height_,
      width: width_,
      fit: BoxFit.contain,
    );
  }

  Widget buildFooter(Size size) {
    return Center(
        child: Column(children: <Widget>[
          //social logo: facebook, google & apple here
          SizedBox(
            height: size.height * 0.01,
          ),
          SizedBox(
              width: size.width * 0.6,
              height: 60.0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //facebook logo here
                    Container(
                      alignment: Alignment.center,
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: const Color.fromRGBO(246, 246, 246, 1)),
                      child: Image.asset(
                        AppImages.logo,
                        width: 45,
                        height: 45,
                      ),
                    ),
                    const SizedBox(width: 16),

                    //google logo here
                    Container(
                      alignment: Alignment.center,
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: const Color.fromRGBO(246, 246, 246, 1)),
                      child: Image.asset(
                        AppImages.help,
                        width: 45,
                        height: 45,
                      ),
                    ),
                    const SizedBox(width: 16),

                    //apple logo here
                    Container(
                        alignment: Alignment.center,
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: const Color.fromRGBO(246, 246, 246, 1)),
                        child: Image.asset(AppImages.web, width: 45, height: 45))
                  ]))
        ]));
  }
}


