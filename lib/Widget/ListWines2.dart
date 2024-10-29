import 'package:flutter/material.dart';
import 'dart:convert'; // Importă dart:convert pentru JSON
import 'package:flutter/services.dart' as rootBundle; // Importă pentru a citi fișiere

class Wine {
  final String name;    // Numele vinului
  final String type;    // Tipul vinului
  final String country; // Țara de origine
  final String photo;   // URL-ul sau calea către imaginea vinului
  final bool available; // Disponibilitate
  final double price;   // Prețul
  final int stock;      // Stocul
  final int criticScore; // Scorul criticilor

  Wine({
    required this.name,
    required this.type,
    required this.country,
    required this.photo,
    required this.available,
    required this.price,
    required this.stock,
    required this.criticScore,
  });

  factory Wine.fromJson(Map<String, dynamic> json) {
    return Wine(
      name: json['name'],
      type: json['type'],
      country: json['country'],
      photo: json['photo'],
      available: json['available'],
      price: json['price'].toDouble(),
      stock: json['stock'],
      criticScore: json['criticScore'],
    );
  }
}

class VerticalWineList extends StatefulWidget {
  @override
  State<VerticalWineList> createState() => _VerticalWineListState();
}

class _VerticalWineListState extends State<VerticalWineList> {
  List<Wine> wines = []; // Lista inițializată ca goală

  @override
  void initState() {
    super.initState();
    loadWines(); // Încărcați vinurile când widget-ul se inițializează
  }

  Future<void> loadWines() async {
    // Citește fișierul JSON
    final String response = await rootBundle.rootBundle.loadString('Data/wines.json');
    final List<dynamic> data = json.decode(response); // Decodifică JSON-ul
    setState(() {
      wines = data.map((json) => Wine.fromJson(json)).toList(); // Deserializare
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // Înălțimea fiecărui card
      child: ListView.builder(
        scrollDirection: Axis.vertical, // Orizontală
        itemCount: wines.length,
        itemBuilder: (context, index) {
          final wine = wines[index];
          return Container(
            padding: EdgeInsets.only(top: 20, left: 5, right: 5),
            child: Container(
              width: 350, // Adjust width as needed
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image on the left side
                  Container(
                    width: 100, // Adjust image width as needed
                    height: 150, // Adjust image height as needed
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        wine.photo,
                        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                          return Icon(Icons.error); // Afișează o pictogramă de eroare în caz de problemă
                        },
                      ), // Aici wine.photo trebuie să fie calea către fișierul din assets
                    ),
                  ),
                  SizedBox(width: 16), // Space between image and text
                  // Text content on the right side
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: !wine.available ? Colors.red[100] : Colors.green[100],
                          ),
                          child: Text(
                            !wine.available ? "Unavaliable" : "Available",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: !wine.available ? Colors.red : Colors.green),
                          ),
                        ),
                        Text(
                          wine.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.wine_bar, color: Colors.redAccent),
                            SizedBox(width: 8),
                            Text(
                              'Red wine (Green and Flinty)',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.flag, color: Colors.blue),
                            SizedBox(width: 8),
                            Text(
                              'From Champagne Blanc...',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          '₹ ${wine.price.toStringAsFixed(2)}', // Formatează prețul
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Bottle (750ml)',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.favorite_border, color: Colors.grey),
                            SizedBox(width: 8),
                            Text(
                              'Critics\' Scores: ${wine.criticScore} / 100',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
