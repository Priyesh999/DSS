
abstract class ApiUrls {
  // static String cbtBaseUrl(String cbtApi) => "http://codebright.in/$cbtApi";
  static String cbtBaseUrl(String endPoint) => "https://advisor-connect-apis.codebright.in/$endPoint";

  // "http://testing.codebright.in/$cbtApi";

  static String cbtDynamicUrl(String cbtApi) =>
      // " http://testing.codebright.in/$cbtApi";
      "https://advisor-connect-apis.codebright.in/$cbtApi";

  // "http://apis.codebright.in/$cbtApi";

  static String baseUrl(String endPoint) => cbtBaseUrl("api/$endPoint");

  static String baseUrl1(String endPoint) => cbtBaseUrl("outer/$endPoint");

  static String base_url_web(String endPoint) => cbtBaseUrl(endPoint);

  static String base_url_web1(String endPoint) => cbtBaseUrl(endPoint);

  static String base_url_web_form(String endPoint, {String employeeID = "", String formID = ""}) =>
      formID.isEmpty && employeeID.isEmpty
          ? cbtBaseUrl("form/$endPoint")
          : formID.isEmpty
              ? cbtBaseUrl("$endPoint/$employeeID")
              : cbtBaseUrl("$endPoint$employeeID/$formID");

  static String get login => base_url_web("master-api/user-login");

  static String get fileUpload => base_url_web("common-api/file-data-upload");

  static String get sync => baseUrl("syncData");

  static String get locationList => baseUrl("locationList");

  static String get qrcodeList => baseUrl("qrList");

  static String get controlList => baseUrl("controlPermissionList");

  static String get leaveRequestSubmit => baseUrl("leaveRequest");

  static String get attendanceRequest => baseUrl("attendanceRequest");

  static String get checkIn => baseUrl("checkIn");

  static String get departmentMenu => baseUrl("menuList");

  static String get departmentMenuSelection => baseUrl("menuPermission");

  static String get controlSelection => baseUrl("controlPermission");

  static String get checkOut => baseUrl("checkOut");

  static String get leaveReqUpdat => baseUrl("checkOut");

  static String get liveLocationSave => baseUrl("locationSubmit");

  static String get qrcodeupdate => baseUrl("companyQrAssign");

  static String get attdenceReqUpdate => baseUrl("checkOut");

  static String get expenseData => baseUrl("expenseData");

  static String get expenseCommit => baseUrl("expenseCommit");

  static String get clientData => baseUrl("client_add");

  static String get companyList => base_url_web("master-api/company-list");

  static String get header_list => base_url_web("common-api/header-list");

  static String get getAllWebData => base_url_web("portfolio-api/all-website-data-list");

  static String get banner_list => base_url_web("common-api/banner-list");

  static String get our_services => base_url_web("common-api/services-list");

  static String get our_products => base_url_web("common-api/website-data");

  static String get our_clients => base_url_web("common-api/website-data");

  static String get company_list => cbtDynamicUrl("/master-api/organization-dt-list");

  static String get projectList => cbtDynamicUrl("/master-api/project-dt-list");

  static String get moduleList => cbtDynamicUrl("/master-api/module-dt-list");

  static String get menuList => cbtDynamicUrl("/master-api/menu-dt-list");

  static String get dynamicForm => cbtDynamicUrl("/master-api/form-add");

  // static String get menu_list => base_url_web("common-api/menu-data-list");
  static String get menu_list => base_url_web("account-api/menu-data");

  static String get department_list => base_url_web("common-api/department-list");

  static String get department_add => base_url_web("common-api/department-add");

  static String get employeeList => base_url_web("employee-api/employee-list");

  static String get designation_list => base_url_web("common-api/designation-list");

  static String get designation_add => base_url_web("common-api/designation-add");

  static String get cbt_drop_down => base_url_web("common-api/dropdown-list");

  static String get cbt_flight_ssearch => cbtBaseUrl("flight-api/search-flight-data");

  static String get cbt_flight_authantication =>
      "http://api.tektravels.com/SharedServices/SharedData.svc/rest/Authenticate";

  static String get state_list => base_url_web("common-api/state-list");

  static String get lead_list => base_url_web("sales-api/lead-list");

  static String get empadd => base_url_web("employee-api/employee-add");

  static String get productList => base_url_web("inventory-api/product-list");

  static String get pinCode => base_url_web("common-api/pincode-data");

  static String get postLeadData => base_url_web("sales-api/lead-trans-add");

  static String get menuListData => base_url_web("common-api/menu-list");

  static String get in_out => base_url_web("payroll-api/attendance");

  static String get headQtrData => base_url_web("common-api/head-quater-list");

  static String get holyDayData => base_url_web("common-api/holiday-list");

  static String get eventListData => base_url_web("common-api/events-list");

  static String get controlListData => base_url_web("common-api/control-list");

  static String get submenuCodeData => base_url_web("common-api/submenu-list");

  static String get extensionData => base_url_web("sales-api/extension-list");

  static String get assetsData => base_url_web("sales-api/assets-list");

  //inventory
  static String get brandUrl => base_url_web("inventory-api/brand-list");

  static String get categoryUrl => base_url_web("inventory-api/category-list");

  static String get productUrl => base_url_web("inventory-api/product-list");

  static String get whereHouseUrl => base_url_web("inventory-api/warehouse-list");

  static String get stockUrl => base_url_web("inventory-api/warehouse-stock-list");

  static String get dayPlanPopulate => base_url_web("dwr-api/dayplan-list");

  static String get dwr_api_route_list => base_url_web("dwr-api/route-list-of-emp");

  static String get dayplanAdd => base_url_web("dwr-api/dayplan-add");

  static String get sendOtp => cbtBaseUrl("account-api/send-otp");

  static String get verifyOtp => cbtBaseUrl("account-api/login-with-otp");

  static String get register => cbtBaseUrl("account-api/user-register");

  // static String get agent_list => cbtBaseUrl("account-api/agent-list");
  // static String get user_list => cbtBaseUrl("account-api/user-list");
  static String get user_list => cbtBaseUrl("account-api/user-list-pagination");

  // static String get customer_list => cbtBaseUrl("account-api/party-list");

  static String get order_list => cbtBaseUrl("sales-api/book-order-list");

  // static String get book_entry_list => cbtBaseUrl("mobile-api/category-with-book-data");
  static String get book_entry_list => cbtBaseUrl("book-master-api/all-book-data");

  static String get order_address_list => cbtBaseUrl("sales-api/order-address-list");

  static String get party_wise_order_list => cbtBaseUrl("sales-api/order-detail-by-user");

  static String get order_address_add => cbtBaseUrl("sales-api/order-address-add");

  static String get partyRegistration => cbtBaseUrl("account-api/party-registration");

  static String get add_user => cbtBaseUrl("account-api/user-add");

  static String get profile_list => cbtBaseUrl("account-api/user-profile");

  static String get profile_list_update => cbtBaseUrl("account-api/user-profile-update");

  static String get save_order_data => cbtBaseUrl("sales-api/book-order-create");

  static String get change_approval_status => cbtBaseUrl("account-api/user-account-permission");

  static String get user_account_permission => cbtBaseUrl("account-api/party-assign-to-agent");

  static String get dashboard_data => cbtBaseUrl("dashboard-api/dashboard-data");
}

class AppInfo {
  static const String companyName = "CodeBright Technologies Pvt. Ltd.";
  static const String companyAddress = "Delhi";
  static const String appName = "Advisor Connect";
  static const String appVersion = "1.0.0";
  static const String appVersionDisplay = "20211117";
  static const String allRightReserved = "Delhi";

  static const String _ANDROID = "ANDROID";
  static const String _IOS = "IOS";

  // static String getPlatform() => defaultTargetPlatform == TargetPlatform.android ? _ANDROID : _IOS;
}

class CBTConstant {
  static const String menuPremission = "CBT_MENU_PERMISSION";
  static const String controlPremission = "CBT_CONTROL_PERMISSION";
}
