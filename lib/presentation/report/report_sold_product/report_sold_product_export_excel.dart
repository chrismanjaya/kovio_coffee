import 'package:excel/excel.dart';
import 'package:kovio_coffee/domain/model/transaction_filter_model.dart';
import 'package:kovio_coffee/presentation/core/formatter.dart';
import 'package:kovio_coffee/presentation/core/widget_file.dart';
import 'package:kovio_coffee/presentation/report/report_sold_product/report_sold_product_page.dart';
import 'package:kovio_coffee/presentation/report/report_sold_product/sold_product_data_source.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReportSoldProductExportExcel {
  final CellStyle cellStyleTitle = CellStyle(
    fontFamily: getFontFamily(
      FontFamily.Arial,
    ),
    fontSize: 20,
    verticalAlign: VerticalAlign.Center,
    horizontalAlign: HorizontalAlign.Center,
    bold: true,
  );

  final CellStyle cellStyleSubtitle = CellStyle(
    fontFamily: getFontFamily(
      FontFamily.Arial,
    ),
    fontSize: 14,
    verticalAlign: VerticalAlign.Center,
    horizontalAlign: HorizontalAlign.Center,
    bold: false,
  );
  final CellStyle cellStyleTableHeader = CellStyle(
    fontFamily: getFontFamily(
      FontFamily.Arial,
    ),
    fontSize: 12,
    verticalAlign: VerticalAlign.Center,
    horizontalAlign: HorizontalAlign.Center,
    bold: true,
  );
  final CellStyle cellStyleTableBodyCenter = CellStyle(
    fontFamily: getFontFamily(
      FontFamily.Arial,
    ),
    fontSize: 12,
    verticalAlign: VerticalAlign.Center,
    horizontalAlign: HorizontalAlign.Center,
    bold: false,
  );
  final CellStyle cellStyleTableBodyLeft = CellStyle(
    fontFamily: getFontFamily(
      FontFamily.Arial,
    ),
    fontSize: 12,
    verticalAlign: VerticalAlign.Center,
    horizontalAlign: HorizontalAlign.Left,
    bold: false,
  );
  final CellStyle cellStyleTableBodyRight = CellStyle(
    fontFamily: getFontFamily(
      FontFamily.Arial,
    ),
    fontSize: 12,
    verticalAlign: VerticalAlign.Center,
    horizontalAlign: HorizontalAlign.Right,
    bold: false,
  );
  final CellStyle cellStyleTableFooter = CellStyle(
    fontFamily: getFontFamily(
      FontFamily.Arial,
    ),
    fontSize: 12,
    verticalAlign: VerticalAlign.Center,
    horizontalAlign: HorizontalAlign.Left,
    bold: true,
  );
  final CellStyle cellStyleTableFooterValue = CellStyle(
    fontFamily: getFontFamily(
      FontFamily.Arial,
    ),
    fontSize: 12,
    verticalAlign: VerticalAlign.Center,
    horizontalAlign: HorizontalAlign.Right,
    bold: true,
  );

  Future<void> generateExcel(
    List<Cell> columnHeader,
    SoldProductDataSource soldProductDataSource,
    TransactionFilterModel filter,
    int totalItem,
    double totalItemPrice,
    double totalItemDiscount,
    double totalItemSold,
  ) async {
    int positionX = 65;
    int positionY = 0;

    // Setup Excel File
    final Excel excel = Excel.createExcel();

    // Setup Sheet
    Sheet sheet = excel["Sold Product Report"];
    excel.delete("Sheet1");

    // Add Title
    positionY++;
    sheet.merge(
      CellIndex.indexByString(
        String.fromCharCode(positionX) + positionY.toString(),
      ),
      CellIndex.indexByString(
        String.fromCharCode(positionX + columnHeader.length) +
            positionY.toString(),
      ),
    );
    final Data cellTitle = sheet.cell(
      CellIndex.indexByString(
        String.fromCharCode(positionX) + positionY.toString(),
      ),
    );
    cellTitle.value = "Report Sold Product";
    cellTitle.cellStyle = cellStyleTitle;

    // Add Subtitle
    positionY++;
    sheet.merge(
      CellIndex.indexByString(
        String.fromCharCode(positionX) + positionY.toString(),
      ),
      CellIndex.indexByString(
        String.fromCharCode(positionX + columnHeader.length) +
            positionY.toString(),
      ),
    );
    final Data cellSubtitle = sheet.cell(
      CellIndex.indexByString(
        String.fromCharCode(positionX) + positionY.toString(),
      ),
    );
    cellSubtitle.value = Formatter().dateTimeToDateString(filter.dateFrom) +
        " to " +
        Formatter().dateTimeToDateString(filter.dateTo);
    cellSubtitle.cellStyle = cellStyleSubtitle;

    // Add Table: Header
    positionY++;
    positionY++;
    for (int i = 0; i < columnHeader.length; i++) {
      final Data cellHeader = sheet.cell(
        CellIndex.indexByString(
          String.fromCharCode(positionX + i) + positionY.toString(),
        ),
      );
      cellHeader.value = columnHeader[i].label;
      cellHeader.cellStyle = cellStyleTableHeader;
    }

    // Add Table: Body
    for (DataGridRow dataGridRow in soldProductDataSource.dataGridRows) {
      positionY++;
      final data = dataGridRow.getCells();
      for (int i = 0; i < data.length; i++) {
        switch (data[i].columnName) {
          case "No":
            final Data cellHeader = sheet.cell(
              CellIndex.indexByString(
                String.fromCharCode(positionX + i) + positionY.toString(),
              ),
            );
            cellHeader.value = data[i].value.toString();
            cellHeader.cellStyle = cellStyleTableBodyCenter;
            break;
          case "Product Name":
            final Data cellHeader = sheet.cell(
              CellIndex.indexByString(
                String.fromCharCode(positionX + i) + positionY.toString(),
              ),
            );
            cellHeader.value = data[i].value;
            cellHeader.cellStyle = cellStyleTableBodyCenter;
            break;
          case "Quantity":
            final Data cellHeader = sheet.cell(
              CellIndex.indexByString(
                String.fromCharCode(positionX + i) + positionY.toString(),
              ),
            );
            cellHeader.value = data[i].value.toString();
            cellHeader.cellStyle = cellStyleTableBodyCenter;
            break;
          case "T. Price":
            final Data cellHeader = sheet.cell(
              CellIndex.indexByString(
                String.fromCharCode(positionX + i) + positionY.toString(),
              ),
            );
            cellHeader.value = Formatter().decimalGrouping(data[i].value);
            cellHeader.cellStyle = cellStyleTableBodyRight;
            break;
          case "T. Discount":
            final Data cellHeader = sheet.cell(
              CellIndex.indexByString(
                String.fromCharCode(positionX + i) + positionY.toString(),
              ),
            );
            cellHeader.value = Formatter().decimalGrouping(data[i].value);
            cellHeader.cellStyle = cellStyleTableBodyRight;
            break;
          case "T. Sold":
            final Data cellHeader = sheet.cell(
              CellIndex.indexByString(
                String.fromCharCode(positionX + i) + positionY.toString(),
              ),
            );
            cellHeader.value = Formatter().decimalGrouping(data[i].value);
            cellHeader.cellStyle = cellStyleTableBodyRight;
            break;
        }
      }
    }

    // Add Table: Footer
    // Total Item
    positionY++;
    _setTableFooter(
      sheet,
      "Total Item",
      totalItem.toDouble(),
      positionX,
      positionY,
    );
    // Total Item Price
    positionY++;
    _setTableFooter(
      sheet,
      "Total Item Price",
      totalItemPrice,
      positionX,
      positionY,
    );
    // Total Item Discount
    positionY++;
    _setTableFooter(
      sheet,
      "Total Item Discount",
      totalItemDiscount,
      positionX,
      positionY,
    );
    // Total Item Sold
    positionY++;
    _setTableFooter(
      sheet,
      "Total Item Sold",
      totalItemSold,
      positionX,
      positionY,
    );

    // Generate File Excel
    _generateExcelDocument(excel);
  }

  void _generateExcelDocument(Excel excel) async {
    List<int> bytes = await excel.encode();
    print("bytes: " + bytes.toString());
    String fileName = Formatter().generateFileName("SoldProduct", ".xlsx");
    saveAndLaunchFile(
      bytes,
      fileName,
    );
  }

  void _setTableFooter(
    Sheet sheet,
    String name,
    double value,
    int positionX,
    int positionY,
  ) {
    sheet.merge(
      CellIndex.indexByString(
        String.fromCharCode(positionX) + positionY.toString(),
      ),
      CellIndex.indexByString(
        String.fromCharCode(positionX + 1) + positionY.toString(),
      ),
    );
    final Data cellFooter = sheet.cell(
      CellIndex.indexByString(
        String.fromCharCode(positionX) + positionY.toString(),
      ),
    );
    cellFooter.value = name.toUpperCase();
    cellFooter.cellStyle = cellStyleTableFooter;

    sheet.merge(
      CellIndex.indexByString(
        String.fromCharCode(positionX + 2) + positionY.toString(),
      ),
      CellIndex.indexByString(
        String.fromCharCode(positionX + 3) + positionY.toString(),
      ),
    );
    final Data cellFooterValue = sheet.cell(
      CellIndex.indexByString(
        String.fromCharCode(positionX + 2) + positionY.toString(),
      ),
    );
    cellFooterValue.value = Formatter().decimalGrouping(value);
    cellFooterValue.cellStyle = cellStyleTableFooterValue;
  }
}
