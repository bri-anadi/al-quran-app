// To parse this JSON data, do
//
//     final ayah = ayahFromJson(jsonString);

import 'dart:convert';

Ayah ayahFromJson(String str) => Ayah.fromJson(json.decode(str));

class Ayah {
    final int code;
    final String message;
    final Data data;

    Ayah({
        required this.code,
        required this.message,
        required this.data,
    });

    factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );
}

class Data {
    final int nomor;
    final String nama;
    final String namaLatin;
    final int jumlahAyat;
    final String tempatTurun;
    final String arti;
    final String deskripsi;
    final Map<String, String> audioFull;
    final List<Ayat> ayat;

    Data({
        required this.nomor,
        required this.nama,
        required this.namaLatin,
        required this.jumlahAyat,
        required this.tempatTurun,
        required this.arti,
        required this.deskripsi,
        required this.audioFull,
        required this.ayat,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
        tempatTurun: json["tempatTurun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audioFull: Map.from(json["audioFull"]).map((k, v) => MapEntry<String, String>(k, v)),
        ayat: List<Ayat>.from(json["ayat"].map((x) => Ayat.fromJson(x))),
    );
}

class Ayat {
    final int nomorAyat;
    final String teksArab;
    final String teksLatin;
    final String teksIndonesia;
    final Map<String, String> audio;

    Ayat({
        required this.nomorAyat,
        required this.teksArab,
        required this.teksLatin,
        required this.teksIndonesia,
        required this.audio,
    });

    factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        nomorAyat: json["nomorAyat"],
        teksArab: json["teksArab"],
        teksLatin: json["teksLatin"],
        teksIndonesia: json["teksIndonesia"],
        audio: Map.from(json["audio"]).map((k, v) => MapEntry<String, String>(k, v)),
    );
}
