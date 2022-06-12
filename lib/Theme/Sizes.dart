// ignore_for_file: file_names

import 'dart:io';

class Sizes {
  static double sm = Platform.isAndroid || Platform.isIOS ? 8 : 12;
  static double md = Platform.isAndroid || Platform.isIOS ? 10:14;
  static double lg = Platform.isAndroid || Platform.isIOS ? 12:16;
  static double xl =Platform.isAndroid || Platform.isIOS ? 14: 18;
  static double xxl =Platform.isAndroid || Platform.isIOS ? 16: 20;
  static double headings =Platform.isAndroid || Platform.isIOS ? 20:28;
  static double mainHeadings = Platform.isAndroid || Platform.isIOS ? 24:36;
}
