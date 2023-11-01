import 'package:flutter/material.dart';
import 'package:unicalm_v2/core/ui/styles/text_style.dart';

class ReviewHistoryPage extends StatefulWidget {
  const ReviewHistoryPage({super.key});

  @override
  State<ReviewHistoryPage> createState() => _ReviewHistoryPageState();
}

class _ReviewHistoryPageState extends State<ReviewHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Histórico de Avaliações',
          style: TxtStyle.instance.titleTextStyle,
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Histórico de Avaliações'),
      ),
    );
  }
}