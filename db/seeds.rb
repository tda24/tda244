if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)

#--------->Сорта винограда

  g1 = Grapesort.create!(name: 'Агбиж', place_of_production: 'Италия', date_of_collection: '06.03.2001')
  g2 = Grapesort.create!(name: 'Морцхула', place_of_production: 'Франция', date_of_collection: '25.04.1992')
  g3 = Grapesort.create!(name: 'Неретте', place_of_production: 'Франция', date_of_collection: '06.09.1993')
  g4 = Grapesort.create!(name: 'Галбина', place_of_production: 'Италия', date_of_collection: '14.07.1997')
  g5 = Grapesort.create!(name: 'Неббиоло', place_of_production: 'Италия', date_of_collection: '09.11.1995')
  g6 = Grapesort.create!(name: 'Ажапш', place_of_production: 'Франция', date_of_collection: '01.05.1995')
  g7 = Grapesort.create!(name: 'Монтий', place_of_production: 'Италия', date_of_collection: '08.01.1994')
  g8 = Grapesort.create!(name: 'Грансфюсер', place_of_production: 'Франция', date_of_collection: '17.08.1992')
  g9 = Grapesort.create!(name: 'Ребула', place_of_production: 'Франция', date_of_collection: '23.10.1992')
  g10 = Grapesort.create!(name: 'Пульижанац', place_of_production: 'Италия', date_of_collection: '29.05.1993')



#--------->Сорт вина

  w1 = Varietywine.create!(name: 'Шираз', type_of_wine: 'Полусухое',
   color: 'Красное', aging_in_barrels: '5', aging_in_bottles: '9')

  w2 = Varietywine.create!(name: 'Кабарне Савиньон', type_of_wine: 'Сладкое',
   color: 'Розовое', aging_in_barrels: '3', aging_in_bottles: '7')

  w3 = Varietywine.create!(name: 'Шардане', type_of_wine: 'Полусладкое',
   color: 'Красное', aging_in_barrels: '11', aging_in_bottles: '14')

  w4 = Varietywine.create!(name: 'Мерло', type_of_wine: 'Сухое',
   color: 'Белое', aging_in_barrels: '5', aging_in_bottles: '7')

#--------->Бочки
  b1 = Barrel.create!(location: 'Италия', date_of_manufacture: '20.04.1995',
   amount: '40.0', is_empty: 'Не пустая', date_of_filling: '12.03.2004',
   varietywine: w1)


  b2 = Barrel.create!(location: 'Франция', date_of_manufacture: '25.05.1997',
   amount: '30.0', is_empty: 'Не пустая', date_of_filling: '06.07.2007',
   varietywine: w2)


  b3 =Barrel.create!(location: 'Италия', date_of_manufacture: '20.04.1997',
   amount: '40.0', is_empty: 'Не пустая', date_of_filling: '10.06.2008',
   varietywine: w3)


  b4 = Barrel.create!(location: 'Италия', date_of_manufacture: '29.11.1997',
   amount: '50.0', is_empty: 'Не пустая', date_of_filling: '25.09.1999',
   varietywine: w4)


  b5 = Barrel.create!(location: 'Италия', date_of_manufacture: '31.10.1998',
   amount: '50.0', is_empty: 'Не пустая', date_of_filling: '14.09.2001',
   varietywine: w1)


 #--------->Соотношение

   relation1 = Relationship.create!(ratio: '30%', grapesort: g1, varietywine: w1)

   relation2 = Relationship.create!(ratio: '70%', grapesort: g2, varietywine: w1)

   relation3 = Relationship.create!(ratio: '60%', grapesort: g1, varietywine: w2)

   relation4 = Relationship.create!(ratio: '40%', grapesort: g4, varietywine: w2)

   relation5 = Relationship.create!(ratio: '20%', grapesort: g9, varietywine: w3)

   relation6 = Relationship.create!(ratio: '80%', grapesort: g2, varietywine: w3)

   relation7 = Relationship.create!(ratio: '75%', grapesort: g2, varietywine: w4)

   relation8 = Relationship.create!(ratio: '25%', grapesort: g8, varietywine: w4)
