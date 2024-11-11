import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_route/app_pages.dart';
import '../../cbt_helper/dailog/custom_alert_dialog.dart';
import '../../cbt_helper/widgets/styles/text_style.dart';
import '../../db/preference_handler.dart';
import '../../utils/app_color.dart';
import '../about_user/about_user_controller.dart';
import '../dash_board/dash_board_controller.dart';
import '../widget_dss/text_widget.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({
    Key? key,
  }) : super(key: key);
  DashboardController dashboardController = Get.put(DashboardController());
  AboutUserController aboutUserController = Get.put(AboutUserController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 260,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0), borderSide: BorderSide(color: Colors.transparent)),
        child: Container(
            color: Colors.grey.shade50,
            child: Column(children: [
              userHeader(context),
              drawerItems([
                DrawerItem(
                    icon: Icon(
                      Icons.home_outlined,
                    ),
                    context: context,
                    title: "Home",
                    onTap: () {
                      // dashboardController.pageController.value.jumpToPage(0);
                      Get.back();
                    }),
                DrawerItem(
                    icon: Icon(
                      Icons.group_add_outlined,
                    ),
                    context: context,
                    title: "Customer",
                    onTap: () {
                      // dashboardController.pageController.value.jumpToPage(1);
                      Get.back();
                    }),
                DrawerItem(
                    icon: Icon(
                      Icons.library_books_outlined,
                    ),
                    context: context,
                    title: "Video",
                    onTap: () {
                      // dashboardController.pageController.value.jumpToPage(2);
                      Get.back();
                    }),
                DrawerItem(
                    icon: Icon(
                      Icons.manage_accounts_outlined,
                    ),
                    context: context,
                    title: "My Account",
                    onTap: () async {
                      // dashboardController.pageController.value.jumpToPage(3);
                      Get.back();
                    }),
                DrawerItem(
                    icon: Icon(
                      Icons.privacy_tip_outlined,
                    ),
                    context: context,
                    title: "Privacy & Policy",
                    onTap: () async {
                      // dashboardController.pageController.value.jumpToPage(3);
                      Get.back();
                    }),
                DrawerItem(
                    icon: Icon(
                      Icons.quick_contacts_dialer_outlined,
                    ),
                    context: context,
                    title: "Term & Conditions",
                    onTap: () async {
                      // dashboardController.pageController.value.jumpToPage(3);
                      Get.back();
                    }),
                DrawerItem(
                    icon: Icon(
                      Icons.support_agent,
                    ),
                    context: context,
                    title: "Help & Support",
                    onTap: () async {
                      // dashboardController.pageController.value.jumpToPage(3);
                      Get.back();
                    }),
                DrawerItem(
                    context: context,
                    title: "Logout",
                    onTap: () async {
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
                          });
                    },
                    icon: Icon(Icons.login_outlined))
              ]),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  child: Text("Version: 1.0.0", style: Theme.of(context).textTheme.bodySmall))
            ])));
  }

  Expanded drawerItems(List<DrawerItem> list) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: list.length,
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            width: double.maxFinite,
            height: 0.1,
            color: Colors.grey.withOpacity(0.5),
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return list[index];
        },
      ),
    );
  }

  Widget userHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[AppColor.primaryColor, AppColor.primaryColorD])),
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, left: 16),
      width: double.infinity,
      height: 160,
      child: Row(
        children: [
          CircleAvatar(
              radius: 30.0,
              child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/1200px-Default_pfp.svg.png",
                  height: 60,
                  width: 60),
              // backgroundImage: NetworkImage(""),
              backgroundColor: Colors.grey.shade200),
          Expanded(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(height: 8),
            Center(
              child: ListTile(
                title: CBTText("Sumit Kumar", style: TStyle.f16_R.styleWith(color: AppColor.white), maxLine: 1),
                subtitle: CBTText("999999999", style: TStyle.f12_R.styleWith(color: AppColor.white)),
              ),
            ),
            const SizedBox(height: 4)
          ]))
        ],
      ),
    );
  }

  Future<void> launchUrlWeb(String url) async {
    // if (!await launchUrl(Uri.parse(url))) {
    //   throw Exception('Could not launch $url');
    // }
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.context,
    required this.title,
    required this.onTap,
    this.icon = const Icon(Icons.arrow_forward_ios, color: Colors.black26),
  });

  final BuildContext context;
  final String title;
  final void Function() onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: icon,
        // dense: true,
        onTap: onTap,
        // leading: FlutterLogo(),
        title: CBTText(title, style: TStyle.f14_R.styleWith(fontWeight: FontWeight.w700))
        // trailing: icon,
        );
  }
}
