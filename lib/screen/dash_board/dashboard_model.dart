
class DashboardDataModel {
  final List<PrAllDatum>? prAllData;
  final PrBarChartData? prBarChartData;
  final List<PrLineChartDatum>? prLineChartData;
  final List<PrPieChartDatum>? prPieChartData;

  DashboardDataModel({
    this.prAllData,
    this.prBarChartData,
    this.prLineChartData,
    this.prPieChartData,
  });

  factory DashboardDataModel.fromJson(Map<String, dynamic> json) => DashboardDataModel(
    prAllData: json["PR_ALL_DATA"] == null ? [] : List<PrAllDatum>.from(json["PR_ALL_DATA"]!.map((x) => PrAllDatum.fromJson(x))),
    prBarChartData: json["PR_BAR_CHART_DATA"] == null ? null : PrBarChartData.fromJson(json["PR_BAR_CHART_DATA"]),
    prLineChartData: json["PR_LINE_CHART_DATA"] == null ? [] : List<PrLineChartDatum>.from(json["PR_LINE_CHART_DATA"]!.map((x) => PrLineChartDatum.fromJson(x))),
    prPieChartData: json["PR_PIE_CHART_DATA"] == null ? [] : List<PrPieChartDatum>.from(json["PR_PIE_CHART_DATA"]!.map((x) => PrPieChartDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "PR_ALL_DATA": prAllData == null ? [] : List<dynamic>.from(prAllData!.map((x) => x.toJson())),
    "PR_BAR_CHART_DATA": prBarChartData?.toJson(),
    "PR_LINE_CHART_DATA": prLineChartData == null ? [] : List<dynamic>.from(prLineChartData!.map((x) => x.toJson())),
    "PR_PIE_CHART_DATA": prPieChartData == null ? [] : List<dynamic>.from(prPieChartData!.map((x) => x.toJson())),
  };
}

class PrAllDatum {
  final String? prTitle;
  final int? prValue;
  final bool? prIsActive;

  PrAllDatum({
    this.prTitle,
    this.prValue,
    this.prIsActive,
  });

  factory PrAllDatum.fromJson(Map<String, dynamic> json) => PrAllDatum(
    prTitle: json["PR_TITLE"],
    prValue: json["PR_VALUE"],
    prIsActive: json["PR_IS_ACTIVE"],
  );

  Map<String, dynamic> toJson() => {
    "PR_TITLE": prTitle,
    "PR_VALUE": prValue,
    "PR_IS_ACTIVE": prIsActive,
  };
}

class PrBarChartData {
  final int? prYear;
  final int? prOrders;
  final int? prPending;
  final int? prComplete;
  final List<PrMonthlyDatum>? prMonthlyData;

  PrBarChartData({
    this.prYear,
    this.prOrders,
    this.prPending,
    this.prComplete,
    this.prMonthlyData,
  });

  factory PrBarChartData.fromJson(Map<String, dynamic> json) => PrBarChartData(
    prYear: json["PR_YEAR"],
    prOrders: json["PR_ORDERS"],
    prPending: json["PR_PENDING"],
    prComplete: json["PR_COMPLETE"],
    prMonthlyData: json["PR_MONTHLY_DATA"] == null ? [] : List<PrMonthlyDatum>.from(json["PR_MONTHLY_DATA"]!.map((x) => PrMonthlyDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "PR_YEAR": prYear,
    "PR_ORDERS": prOrders,
    "PR_PENDING": prPending,
    "PR_COMPLETE": prComplete,
    "PR_MONTHLY_DATA": prMonthlyData == null ? [] : List<dynamic>.from(prMonthlyData!.map((x) => x.toJson())),
  };
}

class PrMonthlyDatum {
  final String? prMonth;
  final int? prOrders;
  final int? prPending;
  final int? prComplete;
  final List<PrDay>? prDays;

  PrMonthlyDatum({
    this.prMonth,
    this.prOrders,
    this.prPending,
    this.prComplete,
    this.prDays,
  });

  factory PrMonthlyDatum.fromJson(Map<String, dynamic> json) => PrMonthlyDatum(
    prMonth: json["PR_MONTH"],
    prOrders: json["PR_ORDERS"],
    prPending: json["PR_PENDING"],
    prComplete: json["PR_COMPLETE"],
    prDays: json["PR_DAYS"] == null ? [] : List<PrDay>.from(json["PR_DAYS"]!.map((x) => PrDay.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "PR_MONTH": prMonth,
    "PR_ORDERS": prOrders,
    "PR_PENDING": prPending,
    "PR_COMPLETE": prComplete,
    "PR_DAYS": prDays == null ? [] : List<dynamic>.from(prDays!.map((x) => x.toJson())),
  };
}

class PrDay {
  final DateTime? prDate;
  final int? prOrders;
  final int? prPending;
  final int? prComplete;

  PrDay({
    this.prDate,
    this.prOrders,
    this.prPending,
    this.prComplete,
  });

  factory PrDay.fromJson(Map<String, dynamic> json) => PrDay(
    prDate: json["PR_DATE"] == null ? null : DateTime.parse(json["PR_DATE"]),
    prOrders: json["PR_ORDERS"],
    prPending: json["PR_PENDING"],
    prComplete: json["PR_COMPLETE"],
  );

  Map<String, dynamic> toJson() => {
    "PR_DATE": "${prDate!.year.toString().padLeft(4, '0')}-${prDate!.month.toString().padLeft(2, '0')}-${prDate!.day.toString().padLeft(2, '0')}",
    "PR_ORDERS": prOrders,
    "PR_PENDING": prPending,
    "PR_COMPLETE": prComplete,
  };
}

class PrLineChartDatum {
  final String? prMonth;
  final int? prParies;
  final int? prAgents;

  PrLineChartDatum({
    this.prMonth,
    this.prParies,
    this.prAgents,
  });

  factory PrLineChartDatum.fromJson(Map<String, dynamic> json) => PrLineChartDatum(
    prMonth: json["PR_MONTH"],
    prParies: json["PR_PARIES"],
    prAgents: json["PR_AGENTS"],
  );

  Map<String, dynamic> toJson() => {
    "PR_MONTH": prMonth,
    "PR_PARIES": prParies,
    "PR_AGENTS": prAgents,
  };
}

class PrPieChartDatum {
  final String? prCategory;
  final int? prValue;
  final String? prColor;

  PrPieChartDatum({
    this.prCategory,
    this.prValue,
    this.prColor,
  });

  factory PrPieChartDatum.fromJson(Map<String, dynamic> json) => PrPieChartDatum(
    prCategory: json["PR_CATEGORY"],
    prValue: json["PR_VALUE"],
    prColor: json["PR_COLOR"],
  );

  Map<String, dynamic> toJson() => {
    "PR_CATEGORY": prCategory,
    "PR_VALUE": prValue,
    "PR_COLOR": prColor,
  };
}
