import 'package:flutter/material.dart';

class Karyawan extends StatefulWidget {
  const Karyawan({super.key});

  @override
  State<Karyawan> createState() => _KaryawanState();
}

class _KaryawanState extends State<Karyawan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Karyawan"),
        centerTitle: true,
      ),
      body: Container(
        child: Text("sfds"),
      ),
    );
  }
}
