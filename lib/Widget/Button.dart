import 'package:flutter/material.dart';



class ButtonWines extends StatefulWidget {
  final String typeWine; // Declari tipul vinului
  bool isActive = false;

  ButtonWines({required this.typeWine, required  this.isActive});

  @override
  _ButtonWinesState createState() => _ButtonWinesState();
}

class _ButtonWinesState extends State<ButtonWines> {
  // Inițializăm ca inactiv
  late Color status;
  late Color? btnFon;

  @override
  void initState() {
    super.initState();
    updateButtonStyle(); // Setăm stilul inițial
  }

  // Funcție pentru a actualiza stilul butonului în funcție de activitate
  void updateButtonStyle() {
    if (widget.isActive) {
      status = Colors.pink;
      btnFon = Colors.pink[50];
    } else {
      status = Colors.grey;
      btnFon = Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextButton(
        onPressed: () {
          setState(() {
            // Schimbăm starea butonului la apăsare
            widget.isActive = !widget.isActive;
            updateButtonStyle(); // Actualizăm stilul în funcție de noua stare
          });
        },
        style: TextButton.styleFrom(
          backgroundColor: btnFon, // Culoarea de fundal în funcție de stare
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // Colțuri rotunjite
            side: BorderSide(color: status, width: 2), // Culoarea bordurii
          ),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
        ),
        child: Text(
          widget.typeWine, // Tipul vinului
          style: TextStyle(
            color: status, // Culoarea textului în funcție de stare
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
