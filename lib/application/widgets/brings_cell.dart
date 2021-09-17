import 'package:flutter/material.dart';

class BringsCell extends StatefulWidget {
  final String name;
  final bool isRequired;
  final String? description;

  BringsCell({
    Key? key,
    this.description,
    required this.name,
    required this.isRequired,
  }): super(key: key);

  @override
  _BringsCellState createState() => _BringsCellState();
}

class _BringsCellState extends State<BringsCell> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
      },
      child: Container(
        // `InkWell` のリップルエフェクトを表示したくないので敢えて色を指定する.
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Row(
          children: [
            Checkbox(
              value: _isChecked, 
              onChanged: (value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
            ),
            const SizedBox(width: 8,),
            Flexible(
              child: Text(
                this.widget.name,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 8,),
            Text(
              this.widget.isRequired ? '※必須' : '',
              style: TextStyle(
                color: Theme.of(context).errorColor,
                fontWeight: FontWeight.w700
              ),
            ),
          ],
        ),
      ),
    );
  }
}