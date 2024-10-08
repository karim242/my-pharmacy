import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/cubit/pharmacy_cubit.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/cubit/pharmacy_state.dart';
import 'package:my_pharmacy/features/pharmacises/presentation/widgets/nearest_pharmacy_item.dart';

class NearestPharmacyList extends StatelessWidget {
  const NearestPharmacyList({super.key});

  @override
  Widget build(BuildContext context) {
    
      return BlocBuilder<PharmacyCubit, PharmacyState>(
      builder: (context, state) {
        if (state is PharmacyLoaded) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:state.pharmacy.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: NearestPharmacyItem(pharmacy: state.pharmacy[index],
                    ),
              );
            },
          ),
        );
        }
         else if (state is PharmacyLoading ) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PharmacyError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('No data found'));
        }
      },
      
    );
  }
}
