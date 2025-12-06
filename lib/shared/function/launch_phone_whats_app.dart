import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom_toast.dart';

Future<void> makePhoneCall({
  required BuildContext context,
  required String phoneNumber,
}) async {
  final url = 'tel:$phoneNumber';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  } else {
    if (context.mounted) {
      CustomToast(
        context: context,
        type: ToastificationType.error,
        header: 'ميزة الاتصال غير متوفرة',
      ).showBottomToast();
    }
  }
}

Future<void> launchWhatsAppCall({
  required BuildContext context,
  required String phoneNumber,
}) async {
  final String whatsappChatUrl = 'https://wa.me/$phoneNumber';
  final Uri uri = Uri.parse(whatsappChatUrl);

  try {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } catch (e) {
    if (context.mounted) {
      CustomToast(context: context, header: e.toString()).showBottomToast();
    }
  }
}

Future<void> launchEmail({
  required BuildContext context,
  required String email,
}) async {
  final Uri emailUri = Uri(scheme: 'mailto', path: email);
  try {
    await launchUrl(emailUri, mode: LaunchMode.externalApplication);
  } catch (e) {
    if (context.mounted) {
      CustomToast(
        context: context,
        type: ToastificationType.error,
        header: 'ميزة البريد الإلكتروني غير متوفرة',
      ).showBottomToast();
    }
  }
}

Future<void> launchMap({
  required BuildContext context,
  required double latitude,
  required double longitude,
  String? label,
}) async {
  // Create Google Maps URL with coordinates
  final String googleMapsUrl =
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

  final Uri mapUri = Uri.parse(googleMapsUrl);

  try {
    if (await canLaunchUrl(mapUri)) {
      await launchUrl(mapUri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch map';
    }
  } catch (e) {
    if (context.mounted) {
      CustomToast(
        context: context,
        type: ToastificationType.error,
        header: 'ميزة الخرائط غير متوفرة',
      ).showBottomToast();
    }
  }
}

// make launch url
Future<void> launchUrlInBrowser({
  required BuildContext context,
  required String url,
}) async {
  final Uri uri = Uri.parse(url);

  try {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } catch (e) {
    if (context.mounted) {
      CustomToast(
        context: context,
        type: ToastificationType.error,
        header: 'ميزة المتصفح غير متوفرة',
      ).showBottomToast();
    }
  }
}
