// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barang_transaksi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BarangTransaksi _$BarangTransaksiFromJson(Map<String, dynamic> json) =>
    BarangTransaksi(
      barang_id: json['barang_id'] as String,
      nama: json['nama'] as String,
      harga_jual: json['harga_jual'] as int,
      jumlah: json['jumlah'] as int,
    );

Map<String, dynamic> _$BarangTransaksiToJson(BarangTransaksi instance) =>
    <String, dynamic>{
      'barang_id': instance.barang_id,
      'nama': instance.nama,
      'harga_jual': instance.harga_jual,
      'jumlah': instance.jumlah,
    };
