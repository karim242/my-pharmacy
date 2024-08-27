// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_pharmacy/features/dashboard/data/repo/firestore_repo.dart';
// import 'package:my_pharmacy/features/dashboard/data/repo/firestore_repo_implementation.dart';
// import 'package:my_pharmacy/features/dashboard/presentation/cubit/firestore_cubit.dart';
// import 'package:my_pharmacy/features/dashboard/presentation/cubit/firestore_state.dart';
// import 'package:my_pharmacy/features/home/data/models/category_model.dart';

// class AddDataScreen extends StatelessWidget {
//   final TextEditingController _categoryNameController = TextEditingController();
//   final TextEditingController _categoryPharmacyNameController =
//       TextEditingController();
//   final TextEditingController _categoryPriceController =
//       TextEditingController();
//   final TextEditingController _categoryAddressController =
//       TextEditingController();

//   final TextEditingController _productNameController = TextEditingController();
//   final TextEditingController _productOriginalPriceController =
//       TextEditingController();
//   final TextEditingController _productDiscountedPriceController =
//       TextEditingController();
//   final TextEditingController _productImageUrlController =
//       TextEditingController();
//   final TextEditingController _pharmacyNameController = TextEditingController();
//   final TextEditingController _pharmacyPhoneController =
//       TextEditingController();

//   final TextEditingController _pharmacyAddressController =
//       TextEditingController();
//   final TextEditingController _pharmacyLatitudeController =
//       TextEditingController();
//   final TextEditingController _pharmacyLongitudeController =
//       TextEditingController();

//   final FirestoreRepository _repository = FirestoreRepositoryImpl();

//   AddDataScreen({super.key}); // Use your repository implementation

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => FirestoreCubit(_repository),
//       child: Scaffold(
//         appBar: AppBar(title: const Text('Add Data')),
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               // Add Category
//               Text('Add Category',
//                   style: Theme.of(context).textTheme.titleLarge),
//               TextField(
//                 controller: _categoryNameController,
//                 decoration: const InputDecoration(labelText: 'Category Name'),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   final category = CategoryModel(
//                     id: DateTime.now().toString(), // Generate a unique ID
//                     name: _categoryNameController.text,
//                     imageUrl: '', // Add logic to upload image if needed
//                     pharmacyName: _categoryPharmacyNameController.text,
//                     price: _categoryPriceController.text,
//                     address: _categoryAddressController.text,
//                   );
//                   context.read<FirestoreCubit>().addCategory(category);
//                 },
//                 child: const Text('Add Category'),
//               ),
//               const SizedBox(height: 20),

//               // Add Product
//               Text('Add Product',
//                   style: Theme.of(context).textTheme.titleLarge),
//               TextField(
//                 controller: _productNameController,
//                 decoration: const InputDecoration(labelText: 'Product Name'),
//               ),
//               TextField(
//                 controller: _productOriginalPriceController,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(labelText: 'Original Price'),
//               ),
//               TextField(
//                 controller: _productDiscountedPriceController,
//                 keyboardType: TextInputType.number,
//                 decoration:
//                     const InputDecoration(labelText: 'Discounted Price'),
//               ),
//               TextField(
//                 controller: _productImageUrlController,
//                 decoration: const InputDecoration(labelText: 'Image URL'),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // final product = ProductModel(
//                   //   id: DateTime.now().toString(), // Generate a unique ID
//                   //   name: _productNameController.text,
//                   //   originalPrice:
//                   //       double.tryParse(_productOriginalPriceController.text) ??
//                   //           0.0,
//                   //   discountedPrice: double.tryParse(
//                   //           _productDiscountedPriceController.text) ??
//                   //       0.0,
//                   //   imageUrl: _productImageUrlController.text,
//                   //   isDiscounted:
//                   //       false, // Adjust this based on your requirement
//                   // );
//                   // const categoryId =
//                   //     'your-category-id'; // Replace with actual category ID
//                   // context
//                   //     .read<FirestoreCubit>()
//                   //     .addProduct(categoryId, product);
//                 },
//                 child: const Text('Add Product'),
//               ),
//               const SizedBox(height: 20),

//               // Add Pharmacy
//               Text('Add Pharmacy',
//                   style: Theme.of(context).textTheme.titleLarge),
//               TextField(
//                 controller: _pharmacyNameController,
//                 decoration: const InputDecoration(labelText: 'Pharmacy Name'),
//               ),
//               TextField(
//                 controller: _pharmacyAddressController,
//                 decoration: const InputDecoration(labelText: 'Address'),
//               ),
//               TextField(
//                 controller: _pharmacyLatitudeController,
//                 keyboardType:
//                     const TextInputType.numberWithOptions(decimal: true),
//                 decoration: const InputDecoration(labelText: 'Latitude'),
//               ),
//               TextField(
//                 controller: _pharmacyLongitudeController,
//                 keyboardType:
//                     const TextInputType.numberWithOptions(decimal: true),
//                 decoration: const InputDecoration(labelText: 'Longitude'),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // final pharmacy = PharmacyModel(
//                   //   id: DateTime.now().toString(), // Generate a unique ID
//                   //   name: _pharmacyNameController.text,
//                   //   address: _pharmacyAddressController.text,
//                   //   phone: _pharmacyPhoneController.text,
//                   //   latitude:
//                   //       double.tryParse(_pharmacyLatitudeController.text) ??
//                   //           0.0,
//                   //   longitude:
//                   //       double.tryParse(_pharmacyLongitudeController.text) ??
//                   //           0.0,
//                   //   imageUrl: '', // Add logic to upload image if needed
//                   // );
//                   // context.read<FirestoreCubit>().addPharmacy(pharmacy);
//                 },
//                 child: const Text('Add Pharmacy'),
//               ),
//               const SizedBox(height: 20),

//               // Feedback
//               BlocBuilder<FirestoreCubit, FirestoreState>(
//                 builder: (context, state) {
//                   if (state is FirestoreLoading) {
//                     return const CircularProgressIndicator();
//                   } else if (state is FirestoreSuccess) {
//                     return Text(state.message,
//                         style: const TextStyle(color: Colors.green));
//                   } else if (state is FirestoreError) {
//                     return Text(state.message,
//                         style: const TextStyle(color: Colors.red));
//                   }
//                   return Container();
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
