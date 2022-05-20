import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page/helper/api_base_helper.dart';
import 'package:page/models/page_model.dart';
import 'package:page/models/wish_model.dart';

class AppController extends GetxController {
  /////////
  final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();
  final pageList = <PageModel>[];
  final pageList2 = <PageModel>[];
  final isLoading = false.obs;
  // final limit = 10.obs;
  final page = 1.obs;
  final isload = false.obs;
  final lastpage = 0.obs;
  ////////
  final wishList = <WishModel>[].obs;

  Future<List<WishModel>> getData(int page) async {
    isLoading(true);
    await _apiBaseHelper
        .onNetworkRequesting(
            url: 'wishlist/get?current_page=$page',
            methode: METHODE.get,
            isAuthorize: true)
        .then((response) {
      lastpage.value = response['meta']['last_page'];
      wishList.clear();
      //debugPrint("=======????${lastpage.value}");
      response['result'].map((e) {
        wishList.add(WishModel.fromJson(e['product']));
      }).toList();
      isLoading(false);
      // debugPrint("=======????$wishList");
      update();
    }).onError((ErrorModel error, stackTrace) {
      debugPrint(error.statusCode.toString());
    });
    return wishList;
  }
  /////////

  final isLoadingMore = false.obs;
  Future<List<WishModel>> getPagination(int page) async {
    if (page == 1) {
      isLoading(true); //shimmer
      isLoadingMore(false); //loading...
    }
    if (page != 1) {
      isLoading(false);
      isLoadingMore(true);
    }

    await _apiBaseHelper
        .onNetworkRequesting(
            url: 'wishlist/get?current_page=$page',
            methode: METHODE.get,
            isAuthorize: true)
        .then((response) {
      if (page == 1) {
        wishList.clear();
      }
      lastpage.value = response['meta']['last_page'];

      response['result'].map((e) {
        wishList.add(WishModel.fromJson(e['product']));
      }).toList();
      isLoading(false);
      isLoadingMore(false);
      // debugPrint("=======????$wishList");
      update();
    }).onError((ErrorModel error, stackTrace) {
      isLoading(false);
      isLoadingMore(false);
      debugPrint(error.statusCode.toString());
    });
    return wishList;
  }

  infinitPage() {
    page.value < lastpage.value
        ? () {
            page.value++;
            getPagination(page.value);
          }()
        : Get.snackbar("Last Page", '', snackPosition: SnackPosition.BOTTOM);
  }

  Future onRefr() async {
    page(1);
    getPagination(1);
  }

  discrease() {
    if (page > 1) {
      page.value--;
      getData(page.value);
      wishList.refresh();
    }
  }

  increase() {
    if (page > 0 && page < lastpage.value) {
      page.value++;
      getData(page.value);
      wishList.refresh();
    } else {
      Get.snackbar("Last Page", '', snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Future onRefresh() async {
  //   getData(page.value);
  // }

  @override
  void onInit() {
    getData(page.value);

    super.onInit();
  }
}
