import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TDataTable extends StatelessWidget {
  const TDataTable({
    super.key,
    required this.columns,
    required this.rows,
  });

  final List<DataColumn> columns;

  final List<DataRow> rows;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: DataTable2(
        columns: columns,
        rows: rows,
        minWidth: 600,
        columnSpacing: 12,
        horizontalMargin: 12,
        headingRowColor: WidgetStateProperty.resolveWith((states) => TColors.primary),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(TSizes.borderRadiusMd)),
        ),
        headingRowDecoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(TSizes.borderRadiusMd), topRight: Radius.circular(TSizes.borderRadiusMd)),
        ),
      ),
    );
  }
}
