// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ExamplePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Example Page'),
//       ),
//       body: BlocConsumer<AuthBloc, AuthState>(
//         listener: (context, state) {
//           if (state is DeleteAccountSuccess) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('Hesap başarıyla silindi.')),
//             );
//             // Hesap silindikten sonra yönlendirme yapabilirsiniz
//             Navigator.pushReplacementNamed(context, '/login');
//           } else if (state is DeleteAccountError) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                   content: Text(
//                       'Hesap silinirken hata oluştu: ${state.errorMessage}')),
//             );
//           }
//         },
//         builder: (context, state) {
//           if (state is DeleteAccountProgress) {
//             return Center(child: CircularProgressIndicator());
//           }
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     _showDeleteConfirmationDialog(context);
//                   },
//                   child: Text('Hesabımı Sil'),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   void _showDeleteConfirmationDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Hesabı Sil'),
//           content: Text('Hesabı silmek istediğinize emin misiniz?'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Dialog'u kapat
//               },
//               child: Text('İptal'),
//             ),
//             TextButton(
//               onPressed: () {
//                 context.read<AuthBloc>().add(const DeleteAccountEvent());
//                 Navigator.of(context).pop(); // Dialog'u kapat
//               },
//               child: Text('Evet'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
