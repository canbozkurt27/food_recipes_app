import 'package:food_recipes_app/ui/home/model/food_list_model.dart';
import 'package:get/get.dart';

class FoodListManager {
  static RxList<FoodListModel> foodList =  [
    FoodListModel(
        name: "Pankek",
        image: "pancakes.jpg",
        rating: 8.8,
        category: "Kahvaltı",
        recipe: """Malzemeler:
1 su bardağı un
2 yemek kaşığı toz şeker
1 tatlı kaşığı kabartma tozu
Yarım çay kaşığı tuz
1 yumurta
1 su bardağı süt
2 yemek kaşığı sıvı yağ veya eritilmiş tereyağı
1 tatlı kaşığı vanilin (isteğe bağlı)
Yapılışı:
1-Kuru malzemeleri karıştırın: Bir kaba un, toz şeker, kabartma tozu, tuz ve vanilini ekleyip karıştırın.

2-Islak malzemeleri karıştırın: Başka bir kasede yumurtayı çırpın, üzerine süt ve sıvı yağı ekleyin, karıştırarak birleştirin.

3-Malzemeleri birleştirin: Kuru malzemeleri, ıslak malzemelere ekleyin. Karıştırın, ancak fazla karıştırmamaya özen gösterin; hamur biraz pütürlü kalabilir, bu normaldir.

4-Pankekleri pişirin: Orta büyüklükte bir tavayı ısıtın ve hafifçe yağlayın. Hamurdan bir kepçe alıp tavaya dökün. Hamurun üst kısmında kabarcıklar oluştuğunda, yaklaşık 2-3 dakika sonra ters çevirin ve diğer tarafını da pişirin.

5-Servis yapın: Pankekler piştikten sonra sıcak servis yapın. Üzerine bal, reçel, meyve dilimleri veya dondurma ekleyebilirsiniz."""),
    FoodListModel(
        name: "Hamburger",
        image: "burger.jpg",
        rating: 8.5,
        category: "Akşam Yemegi",
        recipe: """

"""),
    FoodListModel(
        name: "Pizza",
        image: "pizza.jpg",
        rating: 9.1,
        category: "Akşam Yemegi",
        recipe: """Hamur İçin Malzemeler:
2 su bardağı un
1 paket (10 g) kuru maya
1 tatlı kaşığı tuz
1 tatlı kaşığı şeker
2 yemek kaşığı zeytinyağı
3/4 su bardağı ılık su (yaklaşık 180 ml)
Sosu İçin Malzemeler:
2 yemek kaşığı zeytinyağı
1/2 su bardağı domates püresi veya rendelenmiş domates
1 tatlı kaşığı tuz
1 tatlı kaşığı şeker
1 tatlı kaşığı kekik
1/2 tatlı kaşığı pul biber (isteğe bağlı)
Üst Malzemeleri:
200-250 gram rendelenmiş mozarella peyniri (veya istediğiniz pizza peyniri)
1 su bardağı dilimlenmiş sucuk, salam veya pepperoni (isteğe bağlı)
Dilimlenmiş mantar, yeşil biber, zeytin, kırmızı soğan, mısır gibi sevdiğiniz malzemeler
Birkaç dal taze fesleğen (isteğe bağlı)
Hamurun Yapılışı:
1-Mayayı hazırlayın: Bir kaba ılık suyu, şeker ve kuru mayayı ekleyip karıştırın. 5-10 dakika kadar maya aktifleşene kadar bekleyin. Karışımda kabarcıklar oluşmaya başlamalı.

2-Hamuru yoğurun: Başka bir kaba un ve tuzu ekleyin, ortasını açın ve aktifleşmiş maya karışımını, zeytinyağını ekleyin. Karıştırmaya başlayın ve yavaşça yoğurarak hamuru kıvamlı bir hale getirin. Hamur elastik ve pürüzsüz olmalıdır.

3-Hamuru mayalandırın: Hamurun üstünü örtün ve sıcak bir ortamda 1-1.5 saat kadar mayalanmaya bırakın. Hamur iki katına çıkmalıdır.

Sosu Hazırlayın:
1-Zeytinyağını bir tavada ısıtın, üzerine domates püresini ekleyin. Birkaç dakika karıştırarak pişirin.

2-Şeker, tuz, kekik ve pul biberi ekleyip karıştırın. Sos kıvam alana kadar 5-10 dakika kadar pişirin. Ardından ocaktan alın.

Pizzayı Yapın:
1-Fırını önceden ısıtın: Fırınınızı 220°C'ye (fanlı fırın için 200°C) önceden ısıtın.

2-Hamuru açın: Mayalanmış hamuru hafif unlanmış bir yüzeyde açın. Hamurun kalınlığını dilediğiniz gibi ayarlayabilirsiniz. İnce bir pizza seviyorsanız ince açın, kalın seviyorsanız biraz daha kalın bırakın.

3-Sos ve malzemeleri ekleyin: Hamurun üzerine hazırladığınız domates sosunu yayın. Ardından mozarella peynirini serpin ve sevdiğiniz diğer malzemeleri (sucuk, biber, zeytin, mantar vb.) ekleyin.

4-Pizzayı pişirin: Hazırladığınız pizzayı ısıttığınız fırına verin ve 10-15 dakika kadar pişirin. Peynirler eriyip, kenarları altın rengini almaya başladığında pizza hazır demektir.

5-Servis yapın: Pizzayı fırından çıkarın, birkaç dal taze fesleğenle süsleyin (isteğe bağlı) ve sıcak servis yapın.

Afiyet olsun! 🍕



"""),
    FoodListModel(
        name: "Salata",
        image: "salad.jpg",
        rating: 8.7,
        category: "Öğle Yemeği"),
    FoodListModel(
        name: "Sandviç",
        image: "sandvich.jpeg",
        rating: 8.3,
        category: "Kahvaltı"),
    FoodListModel(
        name: "Elmalı Tart", image: "pie.jpg", rating: 8.9, category: "Tatlı"),
  ].obs;
  
}