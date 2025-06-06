import 'package:mezgebe_sbhat_java/data/pdf_list.dart';
import 'package:mezgebe_sbhat_java/models/menu_list_parent.dart';
import 'package:mezgebe_sbhat_java/models/pdf.dart';
import '../models/song.dart';

class SerawitMenu extends PlayListParent {
  @override
  Uri get baseUri => Uri.parse(
      "https://www.ethiopianorthodox.org/amharic/yeqolotbet/serawitemelaekt/");

  @override
  List<Song> get playList => [
        Song(
          audioUrl: '${baseUri}hawariyat/geezehawariayt.wma',
          title: 'ግእዝ_ዘሐዋርያት',
          pageNumber: 2,
        ),
        Song(
          audioUrl: '${baseUri}hawariyat/ezelhawariyat.wma',
          title: 'ዕዝል_ዘሐዋርያት',
          pageNumber: 2,
        ),
        Song(
          audioUrl: '${baseUri}hawariyat/derebhawariyat.wma',
          title: 'ድርብ_ዘሐዋርያት',
          pageNumber: 2,
        ),
        //
        Song(
          audioUrl: '${baseUri}egzi/geezeegzi.wma',
          title: 'ግእዝ_ዘእግዚእነ',
          pageNumber: 2,
        ),
        Song(
          audioUrl: '${baseUri}egzi/ezelegzi.wma',
          title: 'ዕዝል_ዘእግዚእነ',
          pageNumber: 2,
        ),
        //
        Song(
          audioUrl: '${baseUri}stmary/geezemary.wma',
          title: 'ግእዝ_ዘእግዝእትነ',
          pageNumber: 2,
        ),
        Song(
          audioUrl: '${baseUri}stmary/ezelmary.wma',
          title: 'ዕዝል_ዘእግዝእትነ',
          pageNumber: 2,
        ),
        //
        Song(
          audioUrl: '${baseUri}yohanessweldenegodguad/geezeyohaneswelde.wma',
          title: 'ግእዝ_ዘቅዱስ_ዮሐንስ_ወልደ_ነጎድጓድ',
          pageNumber: 2,
        ),
        Song(
          audioUrl: '${baseUri}yohanessweldenegodguad/ezelyohaneswelde.wma',
          title: 'ዕዝል_ዘቅዱስ_ዮሐንስ_ወልደ_ነጎድጓድ',
          pageNumber: 2,
        ),
        Song(
          audioUrl: '${baseUri}yohanessweldenegodguad/derebyohaneswelde.wma',
          title: 'ድርብ_ዘቅዱስ_ዮሐንስ_ወልደ_ነጎድጓድ',
          pageNumber: 2,
        ),
        //
        Song(
          audioUrl: '${baseUri}selestumeate/geezezeselestumeeat.wma',
          title: 'ግእዝ_ዘሠለስቱ_ምእት',
          pageNumber: 2,
        ),
        Song(
          audioUrl: '${baseUri}selestumeate/geezederebe.wma',
          title: 'ግእዝ_ዘሠለስቱ_ምእት_ድርብ',
          pageNumber: 2,
        ),
        Song(
          audioUrl: '${baseUri}selestumeate/ezelzeselestumeeat.wma',
          title: 'ዕዝል_ዘሠለስቱ_ምእት',
          pageNumber: 2,
        ),
        Song(
          audioUrl: '${baseUri}selestumeate/ezeldereb.wma',
          title: 'ዕዝል_ዘሠለስቱ_ምእት_ድርብ',
          pageNumber: 2,
        ),
        //
        Song(
          audioUrl: '${baseUri}athnasius/geezeathansius.wma',
          title: 'ግእዝ_ዘቅዱስ_አትናቴዎስ',
          pageNumber: 2,
        ),
        Song(
          audioUrl: '${baseUri}athnasius/ezelathnasius.wma',
          title: 'ዕዝል_ዘቅዱስ_አትናቴዎስ',
          pageNumber: 2,
        ),
        //
        Song(
          audioUrl: '${baseUri}basil/geezebasil.wma',
          title: 'ግእዝ_ዘቅዱስ_ባስልዮስ',
          pageNumber: 3,
        ),
        Song(
          audioUrl: '${baseUri}basil/ezilbasil.wma',
          title: 'ዕዝል_ዘቅዱስ_ባስልዮስ',
          pageNumber: 3,
        ),
        Song(
          audioUrl: '${baseUri}gorgorios/geezegregory.wma',
          title: 'ግእዝ_ዘቅዱስ_ጎርጎርዮስ',
          pageNumber: 3,
        ),
        Song(
          audioUrl: '${baseUri}gorgorios/ezilgregory.wma',
          title: 'ዕዝል_ዘቅዱስ_ጎርጎርዮስ',
          pageNumber: 3,
        ),
        //
        Song(
          audioUrl: '${baseUri}Epiphaneous/geezepihpaneous.wma',
          title: 'ግእዝ_ዘቅዱስ_ኤጲፋንንዮስ',
          pageNumber: 3,
        ),
        Song(
          audioUrl: '${baseUri}Epiphaneous/ezilepiphaneous.wma',
          title: 'ዕዝል_ዘቅዱስ_ኤጲፋንንዮስ',
          pageNumber: 3,
        ),
        //
        Song(
          audioUrl: '${baseUri}yohanessafewerq/geezjohnchrysostom.wma',
          title: 'ግእዝ_ዘቅዱስ_ዮሐንስ_አፈወርቅ',
          pageNumber: 3,
        ),
        Song(
          audioUrl: '${baseUri}yohanessafewerq/eziljohnchrysosotom.wma',
          title: 'ዕዝል_ዘቅዱስ_ዮሐንስ_አፈወርቅ',
          pageNumber: 3,
        ),
        //
        Song(
          audioUrl: '${baseUri}qerelos/geezecyril.wma',
          title: 'ግእዝ_ዘቅዱስ_ቄርሎስ',
          pageNumber: 4,
        ),
        Song(
          audioUrl: '${baseUri}qerelos/ezilcyril.wma',
          title: 'ዕዝል_ዘቅዱስ_ቄርሎስ',
          pageNumber: 4,
        ),
        //
        Song(
          audioUrl: '${baseUri}yaekobzeserug/geezejacobzeserug.wma',
          title: 'ግእዝ_ዘቅዱስ_ያዕቆብ_ዘሥሩግ',
          pageNumber: 4,
        ),
        Song(
          audioUrl: '${baseUri}yaekobzeserug/eziljacobzeserug.wma',
          title: 'ዕዝል_ዘቅዱስ_ያዕቆብ_ዘሥሩግ',
          pageNumber: 4,
        ),
        //
        Song(
          audioUrl: '${baseUri}gorgoriuskale/geezegorgoriuskale.wma',
          title: 'ግእዝ_ዘቅዱስ_ጎርጎርዮስ_ካልዕ',
          pageNumber: 4,
        ),
        Song(
          audioUrl: '${baseUri}gorgoriuskale/ezilgregorksecond.wma',
          title: 'ዕዝል_ዘቅዱስ_ጎርጎርዮስ_ካልዕ',
          pageNumber: 4,
        ),
      ];

  @override
  String get folderName => 'serawit';

  @override
  Pdf get pdf => serawitAndMelkaQurbanPdf;
}
