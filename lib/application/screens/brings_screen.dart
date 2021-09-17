import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shiori/application/view_models/view_models.dart';
import 'package:shiori/application/widgets/widgets.dart';
import 'package:shiori/shared/shared.dart';

class BringsScreen extends StatelessWidget {

  static Widget wrapped({
    required BringsViewModel viewModel,
  }) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: BringsScreen._(),
    );
  }

  BringsScreen._({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select((BringsViewModel viewModel) => viewModel.isLoading);
    final brings = context.select((BringsViewModel viewModel) => viewModel.brings);
    return Scaffold(
      appBar: AppBar(
        title: Text('荷物一覧'),
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
                // UI: Header
                const SliverToBoxAdapter(
                  child: BringsHeader(),
                ),
                // UI: Items
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final bring = brings[index];
                      return BringsCell(
                        name: bring.name, 
                        isRequired: bring.isRequired,
                        description: bring.description,
                      );
                    },
                    childCount: brings.length
                  ),
                ),
              ],
            ),
      ),
    );
  }
}