import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/features/media/controller/media_controller.dart';

class ProductImageController extends GetxController{
  static ProductImageController get instance => Get.find();

  Rx<String?> selectedThumbnailimageUrl = Rx<String?>(null);

  final RxList<String> additionalProductImagesUrls = <String>[].obs;

  Future<void> removeImage(int index) async {
    additionalProductImagesUrls.removeAt(index);
  }


  void selectThumbnailImage() async {
    final controller = Get.put(MediaController());
    // List<ImageModel>? 
  }
}