class Transaction {
  final String title;
   final String subtitle;
   final String dateTime;
   final String imageUrl;
   final String amount;
   final bool isExpense;

   Transaction({
    required this.title,
     required this.subtitle,
     required this.dateTime,
     required this.imageUrl,
     required this.amount,
     required this.isExpense
});
}