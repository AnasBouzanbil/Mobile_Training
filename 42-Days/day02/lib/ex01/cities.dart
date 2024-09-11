import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

List<String> cities = [
"Marrakesh Marrakesh-Safi, Morocco",
"Casablanca Casablanca-Settat, Morocco",
"Rabat Rabat-Salé-Kénitra, Morocco",
"Tangier Tanger-Tétouan-Al Hoceïma, Morocco",
"Agadir Souss-Massa, Morocco",
"Cairo Cairo, Egypt",
"Alexandria Alexandria, Egypt",
"Giza Giza, Egypt",
"Luxor Luxor, Egypt",
"Aswan Aswan, Egypt",
"Johannesburg Gauteng, South Africa",
"Cape Town Western Cape, South Africa",
"Durban KwaZulu-Natal, South Africa",
"Pretoria Gauteng, South Africa",
"Port Elizabeth Eastern Cape, South Africa",
"Lagos Lagos, Nigeria",
"Abuja Federal Capital Territory, Nigeria",
"Kano Kano, Nigeria",
"Ibadan Oyo, Nigeria",
"Port Harcourt Rivers, Nigeria",
"Nairobi Nairobi City, Kenya",
"Mombasa Mombasa, Kenya",
"Kisumu Kisumu, Kenya",
"Eldoret Uasin Gishu, Kenya",
"Nakuru Nakuru, Kenya",
"Accra Greater Accra, Ghana",
"Kumasi Ashanti, Ghana",
"Takoradi Western, Ghana",
"Tamale Northern, Ghana",
"Cape Coast Central, Ghana",
"Kinshasa Kinshasa, DR Congo",
"Lubumbashi Haut-Katanga, DR Congo",
"Goma North Kivu, DR Congo",
"Mbuji-Mayi Kasai-Oriental, DR Congo",
"Kisangani Tshopo, DR Congo",
"Abidjan Abidjan, Ivory Coast",
"Yamoussoukro Lacs, Ivory Coast",
"Bouaké Gbêkê, Ivory Coast",
"San Pedro Sud-Bandama, Ivory Coast",
"Korhogo Savanes, Ivory Coast",
"Dakar Dakar, Senegal",
"Saint-Louis Saint-Louis, Senegal",
"Thiès Thiès, Senegal",
"Kaolack Kaolack, Senegal",
"Ziguinchor Ziguinchor, Senegal",
"Lima Lima, Peru",
"Arequipa Arequipa, Peru",
"Trujillo La Libertad, Peru",
"Cusco Cusco, Peru",
"Chiclayo Lambayeque, Peru",
"Bogotá Bogotá, Colombia",
"Medellín Antioquia, Colombia",
"Cali Valle del Cauca, Colombia",
"Barranquilla Atlántico, Colombia",
"Cartagena Bolívar, Colombia",
"Buenos Aires Buenos Aires, Argentina",
"Córdoba Córdoba, Argentina",
"Rosario Santa Fe, Argentina",
"Mendoza Mendoza, Argentina",
"La Plata Buenos Aires, Argentina",
"Santiago Santiago, Chile",
"Valparaíso Valparaíso, Chile",
"Concepción Biobío, Chile",
"Antofagasta Antofagasta, Chile",
"Temuco La Araucanía, Chile",
"São Paulo São Paulo, Brazil",
"Rio de Janeiro Rio de Janeiro, Brazil",
"Salvador Bahia, Brazil",
"Brasília Federal District, Brazil",
"Fortaleza Ceará, Brazil",
"Mexico City Ciudad de México, Mexico",
"Guadalajara Jalisco, Mexico",
"Monterrey Nuevo León, Mexico",
"Puebla Puebla, Mexico",
"Cancún Quintana Roo, Mexico",
"New York New York, USA",
"Los Angeles California, USA",
"Chicago Illinois, USA",
"Houston Texas, USA",
"Miami Florida, USA",
"Toronto Ontario, Canada",
"Vancouver British Columbia, Canada",
"Montreal Quebec, Canada",
"Calgary Alberta, Canada",
"Ottawa Ontario, Canada",
"London London, United Kingdom",
"Manchester England, United Kingdom",
"Birmingham England, United Kingdom",
"Glasgow Scotland, United Kingdom",
"Liverpool England, United Kingdom",
"Paris Île-de-France, France",
"Marseille Provence-Alpes-Côte d'Azur, France",
"Lyon Auvergne-Rhône-Alpes, France",
"Toulouse Occitanie, France",
"Nice Provence-Alpes-Côte d'Azur, France",
"Berlin Berlin, Germany",
"Munich Bavaria, Germany",
"Frankfurt Hesse, Germany",
"Hamburg Hamburg, Germany",
"Cologne North Rhine-Westphalia, Germany",
"Rome Lazio, Italy",
"Milan Lombardy, Italy",
"Naples Campania, Italy",
"Turin Piedmont, Italy",
"Florence Tuscany, Italy",
"Madrid Madrid, Spain",
"Barcelona Catalonia, Spain",
"Valencia Valencia, Spain",
"Seville Andalusia, Spain",
"Bilbao Basque Country, Spain",
"Lisbon Lisbon, Portugal",
"Porto Porto, Portugal",
"Braga Braga, Portugal",
"Coimbra Coimbra, Portugal",
"Aveiro Aveiro, Portugal",
"Istanbul Istanbul, Turkey",
"Ankara Ankara, Turkey",
"Izmir İzmir, Turkey",
"Antalya Antalya, Turkey",
"Adana Adana, Turkey",
"Dubai Dubai, UAE",
"Abu Dhabi Abu Dhabi, UAE",
"Sharjah Sharjah, UAE",
"Ajman Ajman, UAE",
"Ras Al Khaimah Ras Al Khaimah, UAE",
"Doha Doha, Qatar",
"Al Khobar Eastern Province, Saudi Arabia",
"Jeddah Makkah, Saudi Arabia",
"Riyadh Riyadh, Saudi Arabia",
"Mecca Makkah, Saudi Arabia",
"Dammam Eastern Province, Saudi Arabia",
"Kabul Kabul, Afghanistan",
"Herat Herat, Afghanistan",
"Kandahar Kandahar, Afghanistan",
"Mazar-i-Sharif Balkh, Afghanistan",
"Jalalabad Nangarhar, Afghanistan",
"Islamabad Islamabad, Pakistan",
"Karachi Sindh, Pakistan",
"Lahore Punjab, Pakistan",
"Rawalpindi Punjab, Pakistan",
"Faisalabad Punjab, Pakistan",
"Tehran Tehran, Iran",
"Isfahan Isfahan, Iran",
"Shiraz Fars, Iran",
"Tabriz East Azerbaijan, Iran",
"Mashhad Khorasan Razavi, Iran",
"Baku Baku, Azerbaijan",
"Ganja Ganja, Azerbaijan",
"Sumqayit Sumqayit, Azerbaijan",
"Lankaran Lankaran, Azerbaijan",
"Sheki Sheki, Azerbaijan",
"Tbilisi Tbilisi, Georgia",
"Batumi Adjara, Georgia",
"Kutaisi Imereti, Georgia",
"Zugdidi Samegrelo-Zemo Svaneti, Georgia",
"Rustavi Kvemo Kartli, Georgia",
"Yerevan Yerevan, Armenia",
"Gyumri Shirak, Armenia",
"Vagharshapat Aragatsotn, Armenia",
"Vanadzor Lori, Armenia",
"Hrazdan Kotayk, Armenia",
"Riga Riga, Latvia",
"Tallinn Tallinn, Estonia",
"Vilnius Vilnius, Lithuania",
"Kaunas Kaunas, Lithuania",
"Šiauliai Šiauliai, Lithuania",
"Helsinki Uusimaa, Finland",
"Espoo Uusimaa, Finland",
"Tampere Pirkanmaa, Finland",
"Oulu Oulu, Finland",
"Turku Southwest Finland, Finland",
"Stockholm Stockholm, Sweden",
"Gothenburg Västra Götaland, Sweden",
"Malmö Skåne, Sweden",
"Uppsala Uppsala, Sweden",
"Västerås Västmanland, Sweden",
"Oslo Oslo, Norway",
"Bergen Vestland, Norway",
"Stavanger Rogaland, Norway",
"Drammen Viken, Norway",
"Trondheim Trøndelag, Norway",
"Copenhagen Capital Region, Denmark",
"Aarhus Central Denmark, Denmark",
"Odense South Denmark, Denmark",
"Aalborg North Denmark, Denmark",
"Esbjerg South Denmark, Denmark",
"Reykjavik Capital Region, Iceland",
"Akureyri Northeast, Iceland",
"Kopavogur Capital Region, Iceland",
"Hafnarfjordur Capital Region, Iceland",
"Selfoss Southern Region, Iceland",
"Zurich Zurich, Switzerland",
"Geneva Geneva, Switzerland",
"Bern Bern, Switzerland",
"Basel Basel, Switzerland",
"Lausanne Vaud, Switzerland",
"Vienna Vienna, Austria",
"Graz Styria, Austria",
"Linz Upper Austria, Austria",
"Salzburg Salzburg, Austria",
"Innsbruck Tyrol, Austria",
"Brussels Brussels-Capital Region, Belgium",
"Antwerp Flanders, Belgium",
"Ghent Flanders, Belgium",
"Bruges Flanders, Belgium",
];

Future<List<double>> initializeLocation() async {
  final permission = Permission.location;

  if (await permission.isDenied || await permission.isRestricted) {
    await permission.request();
  }

  if (await permission.isPermanentlyDenied) {
    throw Exception('Location permission is permanently denied.');
  }

  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw Exception('Location services are disabled.');
  }

  LocationPermission locPermission = await Geolocator.checkPermission();
  if (locPermission == LocationPermission.denied) {
    locPermission = await Geolocator.requestPermission();
    if (locPermission == LocationPermission.denied) {
      throw Exception('Location permission denied.');
    }
  }

  if (locPermission == LocationPermission.deniedForever) {
    throw Exception('Location permission is permanently denied.');
  }

  try {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    double latitude = position.latitude;
    double longitude = position.longitude;
    print('Latitude: $latitude, Longitude: $longitude');
    return [longitude, latitude];
  } catch (e) {
    throw Exception('Failed to get location: $e');
  }
}