
import 'package:ecemmercapp/model/product.dart';
import 'package:ecemmercapp/service/remote_service/remote_popular_category_service.dart';
import 'package:get/get.dart';
import '../model/add_banner.dart';
import '../model/category.dart';
import '../service/remote_service/remote_banner_service.dart';
import '../service/remote_service/remote_popular_product_service.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<Category> popularCategoryList = List<Category>.empty(growable: true).obs;
  RxList<Product> popularProductList = List<Product>.empty(growable: true).obs;

  RxBool isBannerLoading = false.obs;
  RxBool isPopularCategoryLoading = false.obs;

  RxBool isPopularProductLoading = false.obs;

  @override
  void onInit() {
    getAdBanners();
    getPopularCategories();
    getPopularProduct();
    super.onInit();
  }

  void getAdBanners() async{
    try{
      isBannerLoading(true);
      var result = await RemoteBannerService().get();
      if (result != null) {
        bannerList.assignAll(adBannerListFromJson(result.body));
      }
    } finally {

      print(bannerList.first.image);
      isBannerLoading(false);
    }
  }

  void getPopularCategories() async{
    try{
      isPopularCategoryLoading(true);
      var result = await RemotePopularCategoryService().get();
      if (result != null) {
        popularCategoryList.assignAll(popularCategoryListFromJson(result.body));
      }
    } finally {
      print("Ahmed");
      print(popularCategoryList.length);
      isPopularCategoryLoading(false);
    }
  }

  void getPopularProduct() async{
    try{
      isPopularProductLoading(true);
      var result = await RemotePopularProductService().get();
      if (result != null) {
        popularProductList.assignAll(popularProductListFromJson(result.body));
      }
    } finally {
      print("AhmedProduct");
      print(popularProductList.length);
      isPopularProductLoading(false);
    }
  }
}