import 'package:flutter/material.dart';
import 'package:food_recipes_app/manager/food_list_manager.dart';
import 'package:food_recipes_app/services/food_services.dart';
import 'package:food_recipes_app/ui/home/model/food_list_model.dart';
import 'package:get/get.dart';

class AddFoodController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController recipeController = TextEditingController();
  RxDouble rating = 5.0.obs;
  RxBool isLoading = false.obs;

  Future<void> addFood(FoodListModel foodListModel) async {
    isLoading.value = true;
    await FoodServices().setFood(foodListModel);
    isLoading.value = false;
    FoodListManager.foodList.add(foodListModel);
    Get.back(closeOverlays: true);
  }

  void generateFoodList() {
    var list = [
      FoodListModel(
          name: "Spaghetti Bolognese",
          image: "images/spaghetti_bolognese.jpg",
          rating: 8.7,
          category: "Öğle Yemeği",
          recipe: """Makarnanın Yapılışı:
500 gram spagetti
Su ve tuz

Bolognese Sosu İçin Malzemeler:
300 gram kıyma
1 adet soğan
2 diş sarımsak
2 yemek kaşığı domates salçası
1 su bardağı domates püresi
1 çay bardağı kırmızı şarap (isteğe bağlı)
1 tatlı kaşığı tuz
1 tatlı kaşığı karabiber
1 tatlı kaşığı kekik
Yapılışı:
1- Soğan ve sarımsağı doğrayın, tavada zeytinyağında kavurun.
2- Kıymayı ekleyip kavurun, ardından domates salçasını ilave edin.
3- Domates püresi ve baharatları ekleyin. Kısık ateşte pişirin.
4- Spagettiyi tuzlu suda haşlayın ve süzün.
5- Makarnayı sosla karıştırıp sıcak servis yapın.
Afiyet olsun! 🍝"""),
      FoodListModel(
          name: "Sushi",
          image: "images/sushi.jpg",
          rating: 9.3,
          category: "Yemek",
          recipe: """Malzemeler:
1 su bardağı sushi pirinci
1 su bardağı su
1 yemek kaşığı pirinç sirkesi
1 yemek kaşığı şeker
Yarım tatlı kaşığı tuz
Sushi Nori (deniz yosunu)
Dilimlenmiş somon veya ton balığı
Avokado, salatalık, havuç (isteğe bağlı)
Yapılışı:
1- Pirinci yıkayıp suyla birlikte pişirin.
2- Pirinç piştikten sonra üzerine sirke, şeker ve tuzu ekleyin.
3- Nori yaprağını bir su geçirmez yüzeye serin ve üzerine pişmiş pirinci eşit şekilde yayın.
4- İç malzemeleri (somon, avokado vb.) yerleştirip rulo yapın.
5- Şekil vererek dilimleyin ve soya sosu ile servis yapın.
Afiyet olsun! 🍣"""),
      FoodListModel(
          name: "Tavuklu Çörek",
          image: "images/tavuklu_corek.jpg",
          rating: 8.5,
          category: "Atıştırmalık",
          recipe: """Hamur İçin Malzemeler:
2 su bardağı un
1 paket kuru maya
1 tatlı kaşığı tuz
1 tatlı kaşığı şeker
1/4 su bardağı sıvı yağ
1 su bardağı su

İç Malzemeler:
300 gram tavuk göğsü
1 adet soğan
1 tatlı kaşığı pul biber
1 tatlı kaşığı kekik
Yapılışı:
1- Hamur malzemelerini karıştırarak yoğurun ve mayalandırın.
2- Tavukları haşlayıp didikleyin, soğanı kavurun, baharatları ekleyin.
3- Hamuru açıp iç harcı yerleştirip rulo yapın.
4- Fırında 180°C’de 25 dakika pişirin.
Afiyet olsun! 🥐"""),
      FoodListModel(
          name: "Fırında Somon",
          image: "images/firinda_somon.jpg",
          rating: 9.0,
          category: "Akşam Yemeği",
          recipe: """Malzemeler:
4 dilim somon fileto
2 yemek kaşığı zeytinyağı
Yarım limon suyu
Tuz, karabiber
1 tatlı kaşığı kekik
Yapılışı:
1- Somon dilimlerini fırın tepsisine yerleştirin.
2- Zeytinyağı, limon suyu, tuz, karabiber ve kekikle marine edin.
3- Önceden ısıtılmış 200°C fırında 15-20 dakika pişirin.
Afiyet olsun! 🐟"""),
      FoodListModel(
          name: "Köfte",
          image: "images/kofte.jpg",
          rating: 8.8,
          category: "Ana Yemek",
          recipe: """Malzemeler:
500 gram kıyma
1 adet soğan
1 çay bardağı galeta unu
1 yumurta
Tuz, karabiber, kimyon
Yapılışı:
1- Soğanı rendeler ve bütün malzemeleri karıştırarak yoğurun.
2- Karışımdan ceviz büyüklüğünde parçalar alıp şekil verin.
3- Tavada veya fırında pişirip sıcak servis yapın.
Afiyet olsun! 🍽️"""),
      FoodListModel(
          name: "Lazanya",
          image: "images/lazanya.jpg",
          rating: 9.2,
          category: "Ana Yemek",
          recipe: """Malzemeler:
500 gram kıyma
1 paket lazanya hamuru
1 litre süt
2 yemek kaşığı un
2 yemek kaşığı tereyağı
1 su bardağı rendelenmiş kaşar peyniri
Yapılışı:
1- Kıymayı kavurup domates salçası ve baharatlarla pişirin.
2- Beşamel sosu için tereyağını eritin, unu kavurun, sütü ekleyip karıştırın.
3- Fırın tepsisine sırayla lazanya hamuru, kıyma, beşamel sos ve peynir ekleyin.
4- 180°C fırında 30-35 dakika pişirin.
Afiyet olsun! 🍽️"""),
      FoodListModel(
          name: "Meyve Salatası",
          image: "images/meyve_salatası.jpg",
          rating: 8.4,
          category: "Tatlı",
          recipe: """Malzemeler:
1 adet elma
1 adet portakal
1 adet muz
1/2 su bardağı nar taneleri
1 yemek kaşığı bal
Yapılışı:
1- Meyveleri küçük parçalar halinde doğrayın.
2- Üzerine nar taneleri ekleyin.
3- Son olarak bal ile tatlandırıp karıştırın.
Afiyet olsun! 🍊""")
    ];

    for (var i = 0; i < list.length; i++) {
      addFood(list[i]);
    }
  }
}
