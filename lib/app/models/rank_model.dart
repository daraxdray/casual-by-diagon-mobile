enum RanksEnum {
  beginner,
  warrior,
  master,
  knight,
  baron,
  noble,
  duke,
  regent,
  prince,
  emperor
}
class RankModel {
  String title;
  int max;
  int level;
  int min;
  String description;
  String image;

  RankModel({required this.title, required this.max, required this.image, required this.description, required this.level, required this.min});

  static List<int> levels = [
    50000,
    150000,
    300000,
    500000,
    750000,
    1000000,
    1300000,
    1750000,
    2300000,
    3000000
  ];

  static List<RankModel> rankLists =  [
    RankModel(title: RanksEnum.values[0].name.toUpperCase() , level: 1, min:0, max: levels[0], image: "assets/images/lvl_0.png", description:"", ),
    RankModel(title: RanksEnum.values[1].name.toUpperCase() , level: 2, min:levels[0],max: levels[1], image: "assets/images/lvl_1.png", description:"", ),
    RankModel(title: RanksEnum.values[2].name .toUpperCase(), level: 3,min:levels[1],max: levels[2], image: "assets/images/lvl_2.png", description:"", ),
    RankModel(title: RanksEnum.values[3].name .toUpperCase(), level: 4,min:levels[2],max: levels[3], image: "assets/images/lvl_3.png", description:"", ),
    RankModel(title: RanksEnum.values[4].name .toUpperCase(), level: 5, min:levels[3],max: levels[4], image: "assets/images/lvl_4.png", description:"", ),
    RankModel(title: RanksEnum.values[5].name .toUpperCase(), level: 6, min:levels[4],max: levels[5], image: "assets/images/lvl_5.png", description:"", ),
    RankModel(title: RanksEnum.values[6].name .toUpperCase(), level: 7,min:levels[5],max: levels[6], image: "assets/images/lvl_6.png", description:"", ),
    RankModel(title: RanksEnum.values[7].name .toUpperCase(), level: 8, min:levels[6],max: levels[7], image: "assets/images/lvl_7.png", description:"", ),
    RankModel(title: RanksEnum.values[8].name .toUpperCase(), level: 9, min:levels[7],max: levels[8], image: "assets/images/lvl_8.png", description:"", ),
    RankModel(title: RanksEnum.values[9].name .toUpperCase(), level: 10,min:levels[8],max: levels[9], image: "assets/images/lvl_9.png", description:"", ),
  ];

  static RankModel getRankList(int userPoint){


    if(userPoint >= 0 && userPoint <= levels[0]){
      return rankLists[0];
    }
    else if (userPoint > levels[0] && userPoint <= levels[1]) {
      return rankLists[1];
    } else if (userPoint >levels[1] && userPoint <= levels[2]) {
      return rankLists[2];
    } else if (userPoint > levels[2] && userPoint <= levels[3]) {
      return rankLists[3];
    } else if (userPoint > levels[3] && userPoint <= levels[4]) {
      return rankLists[4];
    } else if (userPoint > levels[4] && userPoint <= levels[5]) {
      return rankLists[5];
    } else if (userPoint > levels[5] && userPoint <= levels[6]) {
      return rankLists[6];
    } else if (userPoint > levels[6] && userPoint <= levels[7]) {
      return rankLists[7];
    } else if (userPoint > levels[7] && userPoint <= levels[8]) {
      return rankLists[8];
    } else if (userPoint > levels[8] && userPoint <= levels[9]) {
      return rankLists[9];
    }
    else {
      return rankLists[9];
    }
  }
}

