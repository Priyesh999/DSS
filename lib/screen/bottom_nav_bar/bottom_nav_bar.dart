import 'package:dss_code/screen/dash_board/dash_board_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app_route/app_pages.dart';
import '../../cbt_helper/dailog/custom_alert_dialog.dart';
import '../../cbt_helper/widgets/styles/text_style.dart';
import '../../db/preference_handler.dart';
import '../../utils/app_color.dart';
import '../about_user/about_user_view.dart';
import '../com_emp/com_emp_view.dart';
import '../dash_board/dash_board_controller.dart';
import '../video_data/video_data_view.dart';
import 'home_drawer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> homeHolderScfKey = GlobalKey<ScaffoldState>();
  RxBool isChanged = false.obs;

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.put(DashboardController());
    return WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Obx(() => isChanged.value
            ? Scaffold(
                drawerEnableOpenDragGesture: false,
                key: homeHolderScfKey,
                appBar: AppBar(
                    centerTitle: false,
                    flexibleSpace: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[AppColor.primary, AppColor.primaryColorP]))),
                    leading: InkWell(
                        onTap: () {
                          homeHolderScfKey.currentState!.openDrawer();
                        },
                        child: Icon(Icons.menu, color: Colors.white)),
                    actions: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Icon(Icons.notifications_none, color: Colors.white))
                    ],
                    backgroundColor: AppColor.primaryColor),
                drawer: HomeDrawer(),
                // body: _tabs()[dashboardController.currentPageIndex.value],
                body: PageView(
                  clipBehavior: Clip.none,
                  onPageChanged: (index) {
                    isChanged.value = true;
                    // dashboardController.currentPageIndex.value = index;
                    dashboardController.pageController.value.animateToPage(dashboardController.currentPageIndex.value,
                        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
                    isChanged.value = false;
                  },
                  controller: dashboardController.pageController.value,
                  children: _tabs(),
                ),
                bottomNavigationBar: CurvedNavigationBar(
                    backgroundColor: AppColor.primaryExtraSoft,
                    buttonBackgroundColor: AppColor.primary,
                    color: AppColor.primaryColor,
                    index: dashboardController.currentPageIndex.value,
                    height: 60,
                    items: const <Widget>[
                      Padding(padding: EdgeInsets.all(7), child: Icon(Icons.home_outlined, color: Colors.white)),
                      Padding(padding: EdgeInsets.all(7), child: Icon(Icons.group_add_outlined, color: Colors.white)),
                      Padding(
                          padding: EdgeInsets.all(7), child: Icon(Icons.library_books_outlined, color: Colors.white)),
                      Padding(
                          padding: EdgeInsets.all(7), child: Icon(Icons.manage_accounts_outlined, color: Colors.white))
                    ],
                    onTap: (index) {
                      isChanged.value = false;
                      dashboardController.currentPageIndex.value = index;
                      dashboardController.pageController.value
                          .animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
                      isChanged.value = true;
                    }))
            : Scaffold(
                drawerEnableOpenDragGesture: false,
                key: homeHolderScfKey,
                appBar: AppBar(
                    centerTitle: false,
                    flexibleSpace: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[AppColor.primary, AppColor.primaryColorP]))),
                    leading: InkWell(
                        onTap: () {
                          homeHolderScfKey.currentState!.openDrawer();
                        },
                        child: Icon(Icons.menu, color: Colors.white)),
                    actions: [
                      PopupMenuButton<int>(
                          position: PopupMenuPosition.over,
                          itemBuilder: (context) => [
                                PopupMenuItem(
                                    height: 25,
                                    value: 1,
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                      Obx(() => Text("Ankita Kumari",
                                          style:
                                              TStyle.f10_R.styleWith(color: Colors.white, fontWeight: FontWeight.bold)))
                                    ])),
                                PopupMenuItem(
                                    value: 3,
                                    child: Row(children: [
                                      const Icon(Icons.logout, size: 20, color: Colors.white),
                                      const SizedBox(width: 10),
                                      Text("Logout".tr, style: TStyle.f10_R.styleWith(color: Colors.white))
                                    ]))
                              ],
                          offset: const Offset(0, 50),
                          color: AppColor.primaryColor,
                          elevation: 2,
                          onSelected: (value) {
                            if (value == 1) {
                            } else if (value == 2) {
                              // Get.toNamed();
                            } else if (value == 3) {
                              // Logout selected
                              CustomAlertDialog.showPresenceAlertL(
                                title: "Logout Confirmation?",
                                message: "Logout of your account?",
                                confirmText: "LOGOUT",
                                cancelText: "CANCEL",
                                onCancel: () => Get.back(),
                                onConfirm: () async {
                                  try {
                                    final prefs = await SharedPreferences.getInstance();
                                    prefHandler.setLogIn(false);
                                    Get.offAllNamed(Routes.LOGIN);
                                  } catch (e) {
                                    final prefs = await SharedPreferences.getInstance();
                                    prefHandler.setLogIn(false);
                                    // Get.offAllNamed(Routes.LOGIN);
                                  }
                                },
                              );
                            }
                          },
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 18,
                              backgroundImage: NetworkImage(
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/1200px-Default_pfp.svg.png"))),
                      SizedBox(width: 16)
                    ],
                    backgroundColor: AppColor.primaryColor),
                drawer: HomeDrawer(),
                // body: _tabs()[dashboardController.currentPageIndex.value],
                body: PageView(
                    clipBehavior: Clip.none,
                    onPageChanged: (index) {
                      isChanged.value = true;
                      dashboardController.currentPageIndex.value = index;
                      dashboardController.pageController.value
                          .animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
                      isChanged.value = false;
                    },
                    controller: dashboardController.pageController.value,
                    children: _tabs()),
                bottomNavigationBar: CurvedNavigationBar(
                    backgroundColor: AppColor.primaryExtraSoft,
                    buttonBackgroundColor: AppColor.primary,
                    color: AppColor.primaryColor,
                    height: 60,
                    index: dashboardController.currentPageIndex.value,
                    items: const <Widget>[
                      Padding(
                        padding: EdgeInsets.all(7),
                        child: Icon(
                          Icons.home_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(7), child: Icon(Icons.group_add_outlined, color: Colors.white)),
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Icon(
                            Icons.library_books_outlined,
                            color: Colors.white,
                          )),
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Icon(
                            Icons.manage_accounts_outlined,
                            color: Colors.white,
                          )),
                    ],
                    onTap: (index) {
                      isChanged.value = false;
                      // currentPageIndex.value = index;
                      dashboardController.currentPageIndex.value = index;
                      dashboardController.pageController.value
                          .animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
                      isChanged.value = true;
                    }))));
  }

  Future<void> launchUrlWeb(String url) async {
    // if (!await launchUrl(Uri.parse(url))) {
    //   throw Exception('Could not launch $url');
    // }
  }

  void showPopupMenu(BuildContext context) async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 80, 0, 100),
      constraints: BoxConstraints(minWidth: 50, maxWidth: Get.width * 0.5),
      items: [
        PopupMenuItem(
          onTap: () async {
            String url = "";
          },
          value: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/bottom_img/ic_account.png",
                height: 20,
                // color: AppColor.primaryColorlight,
              ),
              const SizedBox(
                width: 4,
              ),
              Text("My Account"),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          onTap: () {
            CustomAlertDialog.showPresenceAlertL(
              title: "Logout Confirmation?",
              message: "Logout of your account?",
              confirmText: "LOGOUT",
              cancelText: "CANCEL",
              onCancel: () => Get.back(),
              onConfirm: () async {
                try {
                  final prefs = await SharedPreferences.getInstance();
                  prefHandler.setLogIn(false);
                  Get.offAllNamed(Routes.LOGIN);
                } catch (e) {
                  final prefs = await SharedPreferences.getInstance();
                  prefHandler.setLogIn(false);
                  Get.offAllNamed(Routes.LOGIN);
                }

                // Navigator.pushAndRemoveUntil<void>(
                //   context,
                //   MaterialPageRoute<void>(
                //       builder: (BuildContext context) => LoginView()),
                //   ModalRoute.withName('/LoginView'),
                // );
              },
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // SvgPicture.asset(
              //   "assets/images/bottom_img/ic_log.svg",
              //   height: 16,
              //   // color: AppColor.primaryColorlight,
              // ),
              const SizedBox(
                width: 4,
              ),
              Text("Logout"),
            ],
          ),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      // NOTE: even you didnt select item this method will be called with null of value so you should call your call back with checking if value is not null , value is the value given in PopupMenuItem
      if (value != null) print(value);
    });
  }

  double iconSize = 28;
  double iconSizeD = 25;

  List<Widget> _tabs() {
    return <Widget>[
      DashboardView(),
      Com_emp(),
      VideData(),
      AboutUser(),
    ];
  }
}
