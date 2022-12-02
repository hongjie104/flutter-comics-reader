import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

String decryptAESCryptoJS(String secret, String code) {
  code = md5.convert(utf8.encode(code)).toString();
  final key = code.substring(16);
  final iv = code.substring(0, 16);

  final encrypter = encrypt.Encrypter(
    encrypt.AES(
      encrypt.Key.fromUtf8(key),
      mode: encrypt.AESMode.cbc,
      padding: "PKCS7",
    ),
  );
  final decrypted = encrypter.decrypt64(secret, iv: encrypt.IV.fromUtf8(iv));
  return decrypted;
}
