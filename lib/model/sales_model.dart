class SalesData {
  int? statusCode;
  List<Sales>? data;
  int? totalCount;

  SalesData({this.statusCode, this.data, this.totalCount});

  factory SalesData.fromJson(Map<String, dynamic> json) {
    return SalesData(
      statusCode: json['StatusCode'],
      data: List<Sales>.from(json['data'].map((x) => Sales.fromJson(x))),
      totalCount: json['total_count'],
    );
  }
}

class Sales {
  int? index;
  String? id;
  String? voucherNo;
  String? date;
  String? ledgerName;
  double? totalGrossAmtRounded;
  double? totalTaxRounded;
  double? grandTotalRounded;
  String? customerName;
  double? totalTax;
  String? status;
  double? grandTotal;
  bool? isBillwised;
  String? billwiseStatus;

  Sales({
    this.index,
    this.id,
    this.voucherNo,
    this.date,
    this.ledgerName,
    this.totalGrossAmtRounded,
    this.totalTaxRounded,
    this.grandTotalRounded,
    this.customerName,
    this.totalTax,
    this.status,
    this.grandTotal,
    this.isBillwised,
    this.billwiseStatus,
  });

  factory Sales.fromJson(Map<String, dynamic> json) {
    return Sales(
      index: json['index'],
      id: json['id'],
      voucherNo: json['VoucherNo'],
      date: json['Date'],
      ledgerName: json['LedgerName'],
      totalGrossAmtRounded: json['TotalGrossAmt_rounded'],
      totalTaxRounded: json['TotalTax_rounded'],
      grandTotalRounded: json['GrandTotal_Rounded'],
      customerName: json['CustomerName'],
      totalTax: json['TotalTax'],
      status: json['Status'],
      grandTotal: json['GrandTotal'],
      isBillwised: json['is_billwised'],
      billwiseStatus: json['billwise_status'],
    );
  }
}
