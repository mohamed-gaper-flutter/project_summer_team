import 'package:flutter/material.dart';
import 'package:project_summer_team/screens/ok_padge.dart';
import 'package:project_summer_team/screens/view_padge.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<String> laptops = [
    "MacBook M2",
    "Dell XPS",
    "MacBook Air",
    "HP Pavilion",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tech Shop")),

      body: Column(
        children: [
          Text("لابتوبات", style: TextStyle(fontSize: 25)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text("الكل"), Text("الأعمال"), Text("Gaming")],
          ),

          Expanded(
            child: GridView.builder(
              itemCount: laptops.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Icon(Icons.laptop, size: 60),
                      Text(laptops[index]),
                      Text("16GB RAM - 512GB SSD"),
                      Text("55,000 جنيه"),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return OkPage(
                                  checkoutItems: [
                                    {
                                      "name": laptops[index],
                                      "price": "55000",
                                      "image":
                                          null,
                                    },
                                  ],
                                );
                              },
                            ),
                          );
                        },
                        child: Text("اشتري الان "),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return OffersPage();
                },
              ),
            );
          }
        },

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: "العروض",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: "حسابي"),
        ],
      ),
    );
  }
}
