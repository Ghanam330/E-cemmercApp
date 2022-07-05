import 'package:ecemmercapp/component/main_header.dart';
import 'package:ecemmercapp/controller/controller.dart';
import 'package:ecemmercapp/view/home/components/carousel_slider/carousel_loading.dart';
import 'package:ecemmercapp/view/home/components/carousel_slider/carousel_slider_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/popular_category/papular_category_loading_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
            children:  [
              const MainHeader(),
              Obx(() {
                if (homeController.bannerList.isNotEmpty) {
                  return CarouselSliderView(bannerList:homeController.bannerList);
                } else {
                  return const CarouselLoading();
                }
              }
              ),
              Obx(() {
                if (homeController.popularCategoryList.isNotEmpty) {
                  return const PopularCategoryLoadingCard();
                } else {
                  return const CarouselLoading();
                }
              }
              ),
            ],
        ));
  }


}