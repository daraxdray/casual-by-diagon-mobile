
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../app/models/pagination_filter.dart';
import '../../../app/models/user.dart';
import '../../../app/providers/user_provider.dart';
import '../../../app/services/auth_service.dart';
import '../models/past_activity_item_model.dart';
import '../models/high_score_model.dart';

class HighScoreController extends GetxController {
  Rx<PastActivityModel> pastActivityModelObj = PastActivityModel().obs;
  RxList pastActivityList = [].obs;
  final UserProvider userProvider = UserProvider();
  final DgAuthService dgAuth = DgAuthService();
  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;
  int get limit => _paginationFilter.value.limit ?? 15;
  int get _page => _paginationFilter.value.page ?? 1;
  bool get lastPage => _lastPage.value;
  RxBool isLoading = false.obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  @override
  void onInit() async{
    ever(_paginationFilter, (_) => _getAllHighScore());
    _changePaginationFilter(1, 12);
    super.onInit();
  }

void _getAllHighScore()async {
    isLoading(true);
   UserModel result = await userProvider.getHighScore();

  // pastActivityList.addAll(result);
  isLoading(false);
  if(pastActivityList.value.isEmpty){
    _lastPage(true);
  }
}
  void changeTotalPerPage(int limitValue) {
    pastActivityList.clear();
    _lastPage.value = false;
    _changePaginationFilter(1, limitValue);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val?.page = page;
      val?.limit = limit;
    });
  }

  void loadNextPage() => _changePaginationFilter(_page + limit, limit);


}
