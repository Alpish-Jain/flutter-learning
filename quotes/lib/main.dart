import 'package:flutter/material.dart';
import 'quotes.dart';
import 'quote_card.dart';

void main() {
  runApp(MaterialApp(
    home: QuoteList(),
  ));
}

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote('The secret of getting ahead is getting started.', 'Mark Twain'),
    Quote(
        'All our dreams can come true, if we have the courage to pursue them.',
        'Walt Disney'),
    Quote(
        'Write it. Shoot it. Publish it. Crochet it, sauté it, whatever. MAKE.',
        'Joss Whedon'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Center(child: Text('Awesome Quotes')),
      ),
      body: Column(
        children: quotes
            .map((quote) => QuoteCard(
                quote: quote,
                delete: () {
                  setState(() {
                    quotes.remove(quote);
                  });
                }))
            .toList(),
      ),
    );
  }
}
