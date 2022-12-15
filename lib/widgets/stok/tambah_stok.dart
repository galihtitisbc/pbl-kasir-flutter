import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbl_kasir/utils/auth.dart';
import 'package:pbl_kasir/utils/base_url.dart';
import 'package:http/http.dart' as http;

class TambahStok extends StatefulWidget {
  final String id;
  const TambahStok({super.key, required this.id});

  @override
  State<TambahStok> createState() => _TambahStokState();
}

class _TambahStokState extends State<TambahStok> {
  final _formKeyBarang = GlobalKey<FormState>();
  TextEditingController stok = TextEditingController();
  bool isLoading = false;
  Future<void> tambahStok() async {
    try {
      Uri url = Uri.parse('${BaseUrl.url}/tambahStok/${widget.id}');
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': Auth.token,
          'Accept': 'application/json'
        },
        body: jsonEncode(
          <String, String>{
            'stok': stok.text,
          },
        ),
      );
      print(response.body);
      setState(() {
        isLoading = false;
      });
      Navigator.pop(context);
    } catch (e) {
      throw new FormatException(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Kategori"),
        centerTitle: true,
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formKeyBarang,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Masukkan Jumlah Stok',
                          ),
                          controller: stok,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Tidak Boleh Kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKeyBarang.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              tambahStok();
                            }
                          },
                          child: const Text('Tambah Stok'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
