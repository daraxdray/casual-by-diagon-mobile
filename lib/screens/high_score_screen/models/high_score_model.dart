import 'package:get/get.dart';
import 'past_activity_item_model.dart';

class PastActivityModel {
  RxList<PastActivityItemModel> pastActivityItemList =
      RxList.filled(7, PastActivityItemModel());

   setPastActivityItemList(json){
    pastActivityItemList = RxList.filled(7, PastActivityItemModel.fromJson(json));
  }
}

