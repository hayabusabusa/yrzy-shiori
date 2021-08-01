import 'package:flutter/material.dart';

import 'package:shiori/application/widgets/widgets.dart';

class BringsScreen extends StatelessWidget {
  const BringsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('荷物一覧'),
      ),
      body: CustomScrollView(
        slivers: [
          // UI: Header
          SliverList(
            delegate: SliverChildListDelegate([
              BringsHeader(),
            ]),
          ),
          // UI: Items
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return BringsCell();
              },
              childCount: 3
            ),
          ),
        ],
      ),
    );
  }
}