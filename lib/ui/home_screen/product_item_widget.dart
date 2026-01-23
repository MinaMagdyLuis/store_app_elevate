import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app_elevate/ui/utils/app_colors.dart';

import '../../core/data/model/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.lightBlue,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue.shade200, width: 1),
        ),
        width: MediaQuery.of(context).size.width * .4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.topRight,

              children: [
                CachedNetworkImage(
                  imageUrl: product.image ?? "",
                  fit: BoxFit.cover,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .13,
                  httpHeaders: {"Accept": "image/*"},
                ),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.favorite_border_outlined),
                  ),
                ),
              ],
            ),
            Spacer(),

            Text(
              product.title ?? "",
              textAlign: TextAlign.start,
              maxLines: 2,
              style: TextStyle(
                fontSize: 14,
                height: 1,

                fontWeight: FontWeight.w500,
                color: Colors.blue.shade800,
              ),
            ),
            Spacer(),

            Row(
              children: [
                Text("Review (${product.rating})"),
                Spacer(),
                Icon(Icons.star, color: Colors.amberAccent),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text("EGB ${product.price.toString()}"),
                Spacer(),
                SizedBox(
                  width: 30,
                  height: 30,

                  child: FloatingActionButton(  // disables Hero animation

                    backgroundColor: AppColors.primary,
                     onPressed: () {  },
                    child: Icon(Icons.add, color: AppColors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
