import 'package:flutter/material.dart';
import 'package:project_summer_team/screens/ok_padge.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({super.key});

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  final List<Map<String, dynamic>> laptops = const [
    {
      'name': 'Lenovo IdeaPad 3',
      'oldPrice': '25,000',
      'price': '21,500',
      'discount': '14%',
      'image': 'assets/images/WhatsApp Image 2026-09-19 at 7.52.54 PM (1).jpeg',
    },
    {
      'name': 'HP Pavilion 15',
      'oldPrice': '32,000',
      'price': '27,500',
      'discount': '14%',
      'image': 'assets/images/WhatsApp Image 2026-09-19 at 7.52.55 PM (1).jpeg',
    },
    {
      'name': 'Dell Inspiron 15',
      'oldPrice': '30,000',
      'price': '25,000',
      'discount': '17%',
      'image': 'assets/images/WhatsApp Image 2026-09-19 at 7.52.55 PM (2).jpeg',
    },
    {
      'name': 'ASUS VivoBook 15',
      'oldPrice': '28,000',
      'price': '23,500',
      'discount': '16%',
      'image': 'assets/images/WhatsApp Image 2026-09-19 at 7.52.55 PM (3).jpeg',
    },
    {
      'name': 'Acer Aspire 5',
      'oldPrice': '27,000',
      'price': '22,000',
      'discount': '18%',
      'image': 'assets/images/WhatsApp Image 2026-09-19 at 7.52.55 PM (4).jpeg',
    },
    {
      'name': 'MSI Modern 14',
      'oldPrice': '35,000',
      'price': '29,500',
      'discount': '16%',
      'image': 'assets/images/WhatsApp Image 2026-09-19 at 7.52.55 PM (5).jpeg',
    },
    {
      'name': 'Lenovo ThinkPad',
      'oldPrice': '40,000',
      'price': '34,000',
      'discount': '15%',
      'image': 'assets/images/WhatsApp Image 2026-09-19 at 7.52.55 PM (6).jpeg',
    },
    {
      'name': 'HP Victus Gaming',
      'oldPrice': '50,000',
      'price': '43,000',
      'discount': '14%',
      'image': 'assets/images/WhatsApp Image 2026-09-19 at 7.52.55 PM (7).jpeg',
    },
    {
      'name': 'ASUS TUF Gaming',
      'oldPrice': '55,000',
      'price': '47,000',
      'discount': '15%',
      'image': 'assets/images/WhatsApp Image 2026-09-19 at 7.52.56 PM (1).jpeg',
    },
    {
      'name': 'Dell G15 Gaming',
      'oldPrice': '60,000',
      'price': '51,000',
      'discount': '15%',
      'image': 'assets/images/WhatsApp Image 2026-09-19 at 7.52.56 PM (2).jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(
        title: const Text(
          'عروض اللابتوبات',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff172B4D),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),

        child: GridView.builder(
          itemCount: laptops.length,

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.68,
          ),

          itemBuilder: (context, index) {
            final laptop = laptops[index];

            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // صورة اللاب
                  Expanded(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(18),
                          ),

                          child: Image.asset(
                            laptop['image'],
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // نسبة الخصم
                        Positioned(
                          top: 10,
                          right: 10,

                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 9,
                              vertical: 5,
                            ),

                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),

                            child: Text(
                              '${laptop['discount']} OFF',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          laptop['name'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,

                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          '${laptop['oldPrice']} جنيه',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),

                        const SizedBox(height: 2),

                        Text(
                          '${laptop['price']} جنيه',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff172B4D),
                          ),
                        ),

                        const SizedBox(height: 8),

                        SizedBox(
                          width: double.infinity,

                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return OkPage(
                                      checkoutItems: [laptop],
                                    );
                                  },
                                ),
                              );
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff172B4D),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),

                            child: const Text(
                              'اشتري الآن',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
