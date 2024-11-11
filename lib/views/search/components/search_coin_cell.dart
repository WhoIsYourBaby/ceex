import 'package:ceex_flutter/const/resource.dart';
import 'package:flutter/material.dart';

class SearchCoinCell extends StatelessWidget {
  final String coin;
  final bool isStar;
  final VoidCallback? onStarTap;
  const SearchCoinCell({
    required this.coin,
    this.isStar = false,
    this.onStarTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      height: 50,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(coin),
          GestureDetector(
            onTap: onStarTap,
            child: Image.asset(
              isStar
                  ? R.ASSETS_IMAGES_STAR_SELECTED_PNG
                  : R.ASSETS_IMAGES_STAR_DEFAULT_PNG,
            ),
          ),
        ],
      ),
    );
  }
}
