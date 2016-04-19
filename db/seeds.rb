Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

Employee.create!(email: 'test@wyrzuc.to', password: 'password', password_confirmation: 'password', first_name: 'test_name', last_name: 'test_surname')

District.create!([
  {name: "Aniołki"}
])
Fraction.create!([
  {name: "opakowania metalowe", waste_data_id: 1, description: nil},
  {name: "jolo", waste_data_id: 3, description: nil},
  {name: "a", waste_data_id: 1, description: "bc"}
])
Location.create!([
  {street: "11 listopada", number: "1", full_address: "11 listopada 1", lat: 54.322158061686395, lng: 18.59550006694113, number_int: 1},
  {street: "3 brygady szczerbca", number: "2A", full_address: "3 brygady szczerbca 2A", lat: 54.322290326703474, lng: 18.618676168925003, number_int: 2},
  {street: "3 maja", number: "3", full_address: "3 maja 3", lat: 54.35099625324366, lng: 18.64155278029929, number_int: 3},
  {street: "Abrahama", number: "1", full_address: "Abrahama 1", lat: 54.39310215872051, lng: 18.581170755092035, number_int: 1},
  {street: "Jabłońskiego", number: "8", full_address: "Jabłońskiego 8", lat: 54.33586515318006, lng: 18.625430786326802, number_int: 8},
  {street: "Jacka soplicy", number: "10", full_address: "Jacka soplicy 10", lat: 54.342024266138665, lng: 18.60873224921806, number_int: 10},
  {street: "Jagiellońska", number: "4", full_address: "Jagiellońska 4", lat: 54.41289873056883, lng: 18.5929285382154, number_int: 4},
  {street: "Kryształowa", number: "1", full_address: "Kryształowa 1", lat: 54.31361114714174, lng: 18.598124988972184, number_int: 1},
  {street: "Pólnicy", number: "24", full_address: "Pólnicy 24", lat: 54.34219320198924, lng: 18.565415202226568, number_int: 24},
  {street: "Wichrowe wzgórze", number: "41", full_address: "Wichrowe wzgórze 41", lat: 54.36308264541146, lng: 18.566773024389512, number_int: 41}
])
Log.create!([
  {info: "- 'Królewskie Wzgórze 20.0': Latitude nie może być puste. Longitude nie może być puste", user: "Admin"},
  {info: "- 'Kaczeńce': Latitude nie może być puste. Longitude nie może być puste", user: "Admin"},
  {info: "- 'Kartuska 416.0': Latitude nie może być puste. Longitude nie może być puste", user: "Admin"},
  {info: "- 'Źródlana 80.0': Latitude nie może być puste. Longitude nie może być puste", user: "Admin"},
  {info: "- 'Grubby 1-3-5': Latitude nie może być puste. Longitude nie może być puste", user: "Admin"},
  {info: "- 'Łabędzia': Latitude nie może być puste. Longitude nie może być puste", user: "Admin"}
])
Phrase.create!([
  {name: "puszki", fraction_id: 3},
  {name: "puszkia", fraction_id: 4},
  {name: "Trolololo", fraction_id: nil}
])
Route.create!([
  {name: "Trasa 1"},
  {name: "Trasa 3"},
  {name: "Trasa 4"},
  {name: "Trasa 5"},
  {name: "Trasa 6"},
  {name: "Trasa 7"},
  {name: "Trasa 8"},
  {name: "Trasa 9"}
])
Waste.create!([
  {kind: 1, street: "Buczka 15", latitude: 54.34162623113455, longitude: 18.62707302356267, data: {:info=>"Chełmska", :name=>"Chełmska", :post_code=>"80-808", :phone_number=>"58/322-52-22", :date=>['2015-08-18', '2015-10-13', '2015-12-08']}, group_id: nil, date: "2015-08-18", area: nil, type: nil, district_id: nil, details: nil, visible: true, route_id: nil, position: 2310, description: nil, picture: nil, container_type: nil, clear_glass_containers: 0, colorful_glass_containers: 0, plastic_containers: 0, maculature_containers: 0, clear_glass_container_type: "Janko", colorful_glass_container_type: "Janko", plastic_container_type: "Janko", maculature_container_type: "Janko"},
  {kind: 5, street: "świętokrzyska 132", latitude: 54.31489223487416, longitude: 18.57269153857219, data: {:info=>"ŚWIĘTOKRZYSKA ", :group_name=>"Jednorodzinne", :date=>['2015-03-13','2015-06-12','2015-09-11', '2015-12-11']}, group_id: 1, date: nil, area: nil, type: nil, district_id: nil, details: nil, visible: true, route_id: nil, position: 3690, description: nil, picture: nil, container_type: nil, clear_glass_containers: 0, colorful_glass_containers: 0, plastic_containers: 0, maculature_containers: 0, clear_glass_container_type: "Janko", colorful_glass_container_type: "Janko", plastic_container_type: "Janko", maculature_container_type: "Janko"},
  {kind: 4, street: "Związku jaszczurczego 9", latitude: 54.35434860067462, longitude: 18.57375431827274, data: {:info=>"Związku Jaszczurczego", :number=>nil, :area=>"PIECKI-MIGOWO", :group_name=>"Wielolokalowe", :weekday=>{:dry=>[1, 5], :wet=>[2, 5], :mixed=>[1, 5]}}, group_id: 2, date: nil, area: nil, type: nil, district_id: nil, details: nil, visible: true, route_id: nil, position: 11663, description: nil, picture: nil, container_type: nil, clear_glass_containers: 0, colorful_glass_containers: 0, plastic_containers: 0, maculature_containers: 0, clear_glass_container_type: "Janko", colorful_glass_container_type: "Janko", plastic_container_type: "Janko", maculature_container_type: "Janko"},
  {kind: 2, street: "Burzyńskiego 6", latitude: 54.395973586215, longitude: 18.604783165604314, data: {:info=>"koło hydroforni", :date=>['2015-10-24'], :hour=>"11:50 - 12:04"}, group_id: nil, date: "2015-10-24", area: nil, type: nil, district_id: nil, details: nil, visible: true, route_id: nil, position: 14965, description: nil, picture: nil, container_type: nil, clear_glass_containers: 0, colorful_glass_containers: 0, plastic_containers: 0, maculature_containers: 0, clear_glass_container_type: "Janko", colorful_glass_container_type: "Janko", plastic_container_type: "Janko", maculature_container_type: "Janko"},
  {kind: 3, street: "Rzeczypospolitej 5", latitude: 54.40216570920885, longitude: 18.595244000296244, data: nil, group_id: nil, date: nil, area: nil, type: "Wastes::PackagingWaste", district_id: nil, details: nil, visible: true, route_id: nil, position: 53, description: nil, picture: nil, container_type: nil, clear_glass_containers: 0, colorful_glass_containers: 0, plastic_containers: 1, maculature_containers: 1, clear_glass_container_type: "Janko", colorful_glass_container_type: "Janko", plastic_container_type: "Janko", maculature_container_type: "Janko"},
])
RouteVersion.create!([
  {route_id: 2, data: [{:id=>15617, :address=>"Sztormowa 1"}, {:id=>15615, :address=>"Pelplińska 5"}, {:id=>15614, :address=>"Rybacka 7"}, {:id=>15616, :address=>"Sztormowa 7"}, {:id=>15613, :address=>"Subisława 22"}, {:id=>15612, :address=>"Subisława 23"}, {:id=>16582, :address=>"Aleja grunwaldzka 20"}]},
  {route_id: 2, data: [{:id=>15617, :address=>"Sztormowa 1"}, {:id=>15615, :address=>"Pelplińska 5"}, {:id=>15614, :address=>"Rybacka 7"}, {:id=>15616, :address=>"Sztormowa 7"}, {:id=>15613, :address=>"Subisława 22"}, {:id=>15612, :address=>"Subisława 23"}]}
])
Setting.create!([
  {name: "site_name", value: "Wyrzuc.to"},
  {name: "site_email", value: "admin@wyrzuc.to"},
  {name: "hazardous_days_home", value: "140"}
])
StaticPage.create!([
  {title: "Testowa podstrona", slug: "testowa-podstrona", content: "<p><strong>abc</strong></p>"},
  {title: "O aplikacji", slug: "o-aplikacji", content: "<p>test test test</p>\r\n<p> </p>\r\n<p>test</p>"}
])
Wastes::PackagingWaste.create!([
  {kind: 3, street: "Przemian 13", latitude: 54.30717817302367, longitude: 18.607924026934597, data: nil, group_id: nil, date: nil, area: nil, type: "Wastes::PackagingWaste", district_id: nil, details: nil, visible: true, route_id: nil, position: 932, description: nil, picture: nil, container_type: nil, clear_glass_containers: 0, colorful_glass_containers: 1, plastic_containers: 1, maculature_containers: 1, clear_glass_container_type: "Janko", colorful_glass_container_type: "Janko", plastic_container_type: "Janko", maculature_container_type: "Janko"},
  {kind: 3, street: "Jagiełły 3", latitude: 54.30498730826773, longitude: 18.61405035768128, data: nil, group_id: nil, date: nil, area: nil, type: "Wastes::PackagingWaste", district_id: nil, details: nil, visible: true, route_id: nil, position: 933, description: nil, picture: nil, container_type: nil, clear_glass_containers: 0, colorful_glass_containers: 1, plastic_containers: 1, maculature_containers: 1, clear_glass_container_type: "Janko", colorful_glass_container_type: "Janko", plastic_container_type: "Janko", maculature_container_type: "Janko"},
  {kind: 3, street: "Starogardzka 79", latitude: 54.30156955779568, longitude: 18.60876035884221, data: nil, group_id: nil, date: nil, area: nil, type: "Wastes::PackagingWaste", district_id: nil, details: nil, visible: true, route_id: nil, position: 934, description: nil, picture: nil, container_type: nil, clear_glass_containers: 1, colorful_glass_containers: 1, plastic_containers: 3, maculature_containers: 3, clear_glass_container_type: "Janko", colorful_glass_container_type: "Janko", plastic_container_type: "Janko", maculature_container_type: "Janko"},
])
Wastes::BatteryCollectionPoint.create!([
 {kind: 6, street: "Narwicka 19b", latitude: 54.383123609208134, longitude: 18.63139843080281, data: {:info=>"KON-TRA Sp. Z o.o.", :name=>"KON-TRA Sp. Z o.o."}, group_id: nil, date: nil, area: nil, type: "Wastes::BatteryCollectionPoint", district_id: nil, details: nil, visible: true, route_id: nil, position: 15609, description: nil, picture: nil, container_type: nil, clear_glass_containers: 0, colorful_glass_containers: 0, plastic_containers: 0, maculature_containers: 0, clear_glass_container_type: "Janko", colorful_glass_container_type: "Janko", plastic_container_type: "Janko", maculature_container_type: "Janko"},
 {kind: 6, street: "Litewska 1", latitude: 54.35134824578173, longitude: 18.677084925980505, data: {:info=>"Collect Point Sp. Z o.o. S.K.A", :name=>"Collect Point Sp. Z o.o. S.K.A"}, group_id: nil, date: nil, area: nil, type: "Wastes::BatteryCollectionPoint", district_id: nil, details: nil, visible: true, route_id: nil, position: 15610, description: nil, picture: nil, container_type: nil, clear_glass_containers: 0, colorful_glass_containers: 0, plastic_containers: 0, maculature_containers: 0, clear_glass_container_type: "Janko", colorful_glass_container_type: "Janko", plastic_container_type: "Janko", maculature_container_type: "Janko"},
 {kind: 6, street: "Rzeczypospolitej 26", latitude: 54.39961730823666, longitude: 18.59639496880299, data: {:info=>"Przedsiębiorstwo Usługowe \"Clean-BUD\"", :name=>"Przedsiębiorstwo Usługowe \"Clean-BUD\""}, group_id: nil, date: nil, area: nil, type: "Wastes::BatteryCollectionPoint", district_id: nil, details: nil, visible: true, route_id: nil, position: 15611, description: nil, picture: nil, container_type: nil, clear_glass_containers: 0, colorful_glass_containers: 0, plastic_containers: 0, maculature_containers: 0, clear_glass_container_type: "Janko", colorful_glass_container_type: "Janko", plastic_container_type: "Janko", maculature_container_type: "Janko"}
])
