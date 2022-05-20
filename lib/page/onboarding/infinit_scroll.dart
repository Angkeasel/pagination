import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page/widget/custom_shimmer.dart';

import '../../controller/page_controller.dart';
import '../../widget/custom_cart.dart';

class InfiniteScrollPage extends StatefulWidget {
  const InfiniteScrollPage({Key? key}) : super(key: key);

  @override
  State<InfiniteScrollPage> createState() => _InfiniteScrollPageState();
}

class _InfiniteScrollPageState extends State<InfiniteScrollPage> {
  final controller = Get.put(AppController());
  @override
  void initState() {
    controller.page(1);
    controller.getData(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: NotificationListener(
                onNotification: (ScrollEndNotification noti) {
                  if (noti.metrics.pixels == noti.metrics.maxScrollExtent) {
                    debugPrint('End');
                    controller.infinitPage();
                  }
                  return false;
                },
                child: RefreshIndicator(
                  onRefresh: controller.onRefr,
                  child: controller.isLoading.value
                      ? const CustomShimmerCardGetFunding()
                      : SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:
                                controller.wishList.asMap().entries.map((e) {
                              return CustomCart(
                                userId: e.value.id,
                                id: 0,
                                title: e.value.name,
                                body: '',
                              );
                            }).toList(),
                          ),
                        ),
                ),
              ),
            ),
            controller.isLoadingMore.value
                ? const Center(
                    child: Text('Loading More . . .'),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
