import 'package:cartzy_app/core/common/widget/product_item_widget.dart';
import 'package:cartzy_app/feature/home/domain/entities/category_entity.dart';
import 'package:cartzy_app/feature/home/domain/entities/product_entity.dart';
import 'package:cartzy_app/feature/home/presentation/view_model/home_cubit.dart';
import 'package:cartzy_app/feature/home/presentation/widgets/tab_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Text.rich(
            TextSpan(
              text: 'Hi !,\n',
              style: TextStyle(
                color: Color(0xff212121),
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: 'Let’s start your shopping',
                  style: TextStyle(
                    color: Color(0xff212121),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Categories",
            style: TextStyle(
              color: Color(0xff212121),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          //! getCategories
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is GetCategoriesLoading) {
                return Skeletonizer(
                  enabled: true,
                  child: TabContainerWidget(
                    categories: dummyCategories,
                  ),
                );
              }
               return TabContainerWidget(
                  categories: context.read<HomeCubit>().listOfCategories,
                );
            },
          ),
          SizedBox(height: 16),
          //! getProducts
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is GetProductLoading) {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 20,
                        childAspectRatio: 163/288,
                        ),
                    itemBuilder: (context, index) => Skeletonizer(
                      child: ProductItemWidget(
                        product: ProductEntity(
                          title: "dummy title",
                          price: 1152,
                          images: [imageTest],
                        ),
                      ),
                    ),
                  ),
                );
              }
              if (state is GetProductSuccess) {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 20,
                        childAspectRatio: 163/288,
                        ),
                    itemBuilder: (context, index) => ProductItemWidget(
                      product: context.read<HomeCubit>().listOfProduct[index],
                    ),
                    itemCount: context.read<HomeCubit>().listOfProduct.length,
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}

var dummyCategories = <CategoryEntity>[
  CategoryEntity(id: 1, name: "All"),
  CategoryEntity(id: 2, name: "Electronics"),
  CategoryEntity(id: 3, name: "Jewelery"),
  CategoryEntity(id: 4, name: "Men's clothing"),
  CategoryEntity(id: 5, name: "Women's clothing"),
];
