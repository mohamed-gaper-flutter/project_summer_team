import 'package:flutter/material.dart';

class OkPage extends StatefulWidget {
  final List<Map<String, dynamic>> checkoutItems;
  const OkPage({super.key, required this.checkoutItems});

  @override
  State<OkPage> createState() => _OkPageState();
}

class _OkPageState extends State<OkPage> {
  String selectedMethod = 'card';

  double _calculateTotal() {
    double total = 0;
    for (var item in widget.checkoutItems) {
      String priceStr = item['price'].toString().replaceAll(RegExp(r'[^0-9]'), '');
      total += (double.tryParse(priceStr) ?? 0);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    double subTotal = _calculateTotal();
    double shipping = 50;
    double finalTotal = subTotal + shipping;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const BackButton(color: Colors.black),
          title: const Text('إتمام الشراء', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.checkoutItems.length,
                itemBuilder: (context, index) {
                  final item = widget.checkoutItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                              const SizedBox(height: 4),
                              Text('السعر: ${item['price']}', style: const TextStyle(color: Colors.black87)),
                            ],
                          ),
                        ),
                        if (item['image'] != null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(item['image'], width: 60, height: 60, fit: BoxFit.cover),
                          ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              
              const Text('ملخص الطلب', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              _row('المجموع الفرعي:', '${subTotal.toStringAsFixed(0)} جنيه', false),
              _row('الشحن:', '${shipping.toStringAsFixed(0)} جنيه', false),
              _row('المجموع الكلي:', '${finalTotal.toStringAsFixed(0)} جنيه', true),
              const SizedBox(height: 24),

              const Text('طريقة الدفع', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              _itemMethod('بطاقة ائتمان', 'card'),
              _itemMethod('دفع عند الاستلام', 'cod'),
              _itemMethod('فوري', 'fawry'),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('تم تأكيد طلبك بنجاح!'), backgroundColor: Colors.green),
                    );
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1A529B),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  ),
                  child: const Text('تأكيد الطلب والدفع', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _row(String title, String val, bool isBold) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: isBold ? 15 : 14, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(val, style: TextStyle(fontSize: isBold ? 15 : 14, fontWeight: FontWeight.bold, color: isBold ? const Color(0xff1A529B) : Colors.black)),
        ],
      ),
    );
  }

  Widget _itemMethod(String text, String value) {
    bool isSelected = selectedMethod == value;
    return GestureDetector(
      onTap: () => setState(() => selectedMethod = value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: isSelected ? const Color(0xff1A529B) : Colors.grey, width: 2),
              ),
              child: isSelected ? Center(child: Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xff1A529B), shape: BoxShape.circle))) : null,
            ),
            const SizedBox(width: 12),
            Text(text, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
