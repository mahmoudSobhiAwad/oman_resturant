// import 'dart:io';
// import 'package:huda_yousef/shared/widgets/custom_text_field.dart';
// import 'package:huda_yousef/shared/widgets/custom_upload_text_field.dart';
// import 'package:flutter/material.dart';
//
// class TextFieldExamples extends StatefulWidget {
//   const TextFieldExamples({super.key});
//
//   @override
//   State<TextFieldExamples> createState() => _TextFieldExamplesState();
// }
//
// class _TextFieldExamplesState extends State<TextFieldExamples> {
//   final TextEditingController _normalController = TextEditingController();
//   final TextEditingController _uploadController = TextEditingController();
//   File? _selectedFile;
//
//   @override
//   void dispose() {
//     _normalController.dispose();
//     _uploadController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Text Field Examples'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Normal Text Field Example
//             const Text(
//               'Normal Text Field:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             CustomTextFormField(
//               controller: _normalController,
//               headerText: 'اسم المستخدم',
//               hintText: 'أدخل اسم المستخدم',
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'هذا الحقل مطلوب';
//                 }
//                 return null;
//               },
//             ),
//
//             const SizedBox(height: 32),
//
//             // Upload Text Field Example
//             const Text(
//               'Upload Text Field:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             CustomUploadTextFormField(
//               controller: _uploadController,
//               headerText: 'رفع الملف',
//               hintText: 'اختر ملف أو أدخل نص',
//               enableUpload: true,
//               uploadButtonText: 'رفع',
//               showFileName: true,
//               allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf', 'doc', 'docx'],
//               maxFileSize: 5 * 1024 * 1024, // 5MB
//               onFileSelected: (File? file) {
//                 setState(() {
//                   _selectedFile = file;
//                 });
//                 if (file != null) {
//                   print('File selected: ${file.path}');
//                   // Here you can upload the file to your server
//                   // Example: uploadFileToServer(file);
//                 }
//               },
//               validator: (value) {
//                 if ((value == null || value.isEmpty) && _selectedFile == null) {
//                   return 'يرجى إدخال نص أو اختيار ملف';
//                 }
//                 return null;
//               },
//             ),
//
//             const SizedBox(height: 32),
//
//             // Display selected file info
//             if (_selectedFile != null)
//               Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Colors.green.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(color: Colors.green),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'الملف ��لمحدد:',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 4),
//                     Text('الاسم: ${_selectedFile!.path.split('/').last}'),
//                     Text('المسار: ${_selectedFile!.path}'),
//                     FutureBuilder<int>(
//                       future: _selectedFile!.length(),
//                       builder: (context, snapshot) {
//                         if (snapshot.hasData) {
//                           final sizeInMB = snapshot.data! / (1024 * 1024);
//                           return Text('الحجم: ${sizeInMB.toStringAsFixed(2)} MB');
//                         }
//                         return const Text('الحجم: جاري الحساب...');
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//
//             const SizedBox(height: 32),
//
//             // Submit Button Example
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Validate and submit
//                   final normalText = _normalController.text;
//                   final uploadText = _uploadController.text;
//
//                   print('Normal Text: $normalText');
//                   print('Upload Text: $uploadText');
//                   print('Selected File: ${_selectedFile?.path ?? 'None'}');
//
//                   // Show success message
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('تم الإرسال بنجاح!'),
//                       backgroundColor: Colors.green,
//                     ),
//                   );
//                 },
//                 child: const Text('إرسال'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
