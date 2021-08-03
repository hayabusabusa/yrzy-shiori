import 'package:flutter/material.dart';

import 'package:shiori/application/widgets/widgets.dart';

class PricesScreen extends StatelessWidget {
  const PricesScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('料金一覧'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return PricesCell();
              },
              childCount: 5
            ),
          ),
          // UI: Total
          SliverToBoxAdapter(
            child: PricesTotalCell(),
          ),
        ],
      ),
    );
  }
}