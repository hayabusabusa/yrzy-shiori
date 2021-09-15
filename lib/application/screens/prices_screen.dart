import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shiori/application/view_models/view_models.dart';
import 'package:shiori/application/widgets/widgets.dart';

class PricesScreen extends StatelessWidget {

  static Widget wrapped({
    required PricesViewModel viewModel,
  }) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: PricesScreen._(),
    );
  }

  PricesScreen._({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select((PricesViewModel viewModel) => viewModel.isLoading);
    final prices = context.select((PricesViewModel viewModel) => viewModel.prices);
    return Scaffold(
      appBar: AppBar(
        title: Text('料金一覧'),
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 400),
        child: isLoading 
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            )
          : CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return PricesCell();
                    },
                    childCount: prices.length,
                  ),
                ),
                // UI: Total
                SliverToBoxAdapter(
                  child: PricesTotalCell(),
                ),
              ],
            ),
      ),
    );
  }
}