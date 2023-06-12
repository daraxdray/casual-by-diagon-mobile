
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../app/models/pagination_filter.dart';
import '../../../app/models/referrer_model.dart';
import '../../../app/models/transaction_model.dart';
import '../../../app/providers/user_provider.dart';
import '../../../app/services/auth_service.dart';

class AllReferralsController extends GetxController {
  final UserProvider userProvider = UserProvider();
  RxList<DgReferrerModel?> allReferrals = <DgReferrerModel>[].obs;
  final DgAuthService dgAuth = DgAuthService();
  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;
  RxInt totalReferred = 0.obs;
  int get limit => _paginationFilter.value.limit ?? 20;
  int get _page => _paginationFilter.value.page ?? 1;
  bool get lastPage => _lastPage.value;
  RxBool isLoading = false.obs;

  final RefreshController refreshController =
  RefreshController(initialRefresh: false);
  final DgAuthService authService = DgAuthService();

  void onRefresh() async{
    isLoading(true);
    refreshController.refreshCompleted();
    _getAllReferrals(refresh:true);
    Future.delayed(const Duration(milliseconds:900 ),() {
      isLoading(false);
    });
  }
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
    ever(_paginationFilter, (_) => _getAllReferrals());
    _changePaginationFilter(1, 20);
    totalReferred(await userProvider.getUserReferrersCount());
    super.onInit();
  }

void _getAllReferrals({bool? refresh: false})async {
    isLoading(true);
   if(refresh == true) allReferrals.clear();
  allReferrals.addAll(await userProvider.getUserReferrersByPage(_paginationFilter.value));
  isLoading(false);
  if(allReferrals.value.isEmpty){
    _lastPage(true);
  }
}

  void changeTotalPerPage(int limitValue) {
    allReferrals.clear();
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
