import 'package:mezgebe_sbhat_java/data/seatat.dart';
import 'package:mezgebe_sbhat_java/models/menu.dart';

List<Menu> seatatMenu = [
  Menu(
    title: 'ሰዓታት ዘደብረ ዓባይ ክፍል አንድ',
    name: 'seatat',
    imageUrl: 'assets/images/seatat.jpg',
    subTitle: "አአትብ - ኢየሱስ ክርስቶስ",
    playList: SeatatPartOne(),
  ),
  Menu(
    title: 'ምስባካት',
    name: 'seatat',
    imageUrl: 'assets/images/seatat.jpg',
    subTitle: "የምንባባት ምስባካት",
    playList: SeatatMsbakat(),
  ),
  Menu(
    title: 'ኵሎሙ',
    name: 'seatat',
    imageUrl: 'assets/images/seatat.jpg',
    subTitle: "ኵሎሙ - ሞገስነ",
    playList: SeatatKulomu(),
  ),
  Menu(
    title: 'መስተብቊዕ',
    name: 'seatat',
    imageUrl: 'assets/images/seatat.jpg',
    subTitle: "መስተብቊዕ - መሐረነ አብ",
    playList: SeatatMestebqueMeharene(),
  ),
  Menu(
    title: 'መቅድመ ተዓምር',
    name: 'seatat',
    imageUrl: 'assets/images/seatat.jpg',
    subTitle: "መቅድመ ተዓምር",
    playList: SeatatMekdmeTeamr(),
  ),
  Menu(
    title: 'እሴብሕ ጸጋኪ',
    name: 'seatat',
    imageUrl: 'assets/images/seatat.jpg',
    subTitle: "እሴብሕ ጸጋኪ - ጸሎታ ለማርያም",
    playList: SeatatEsebhTsegaki(),
  ),
];
