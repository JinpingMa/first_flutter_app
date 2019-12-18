// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:f_stellar_app/src/data/veggie.dart';

class LocalVeggieProvider {
  static List<Veggie> veggies = [
    Veggie(
      id: 1,
      name: 'Apples',
      imageAssetPath: 'assets/images/apple.jpg',
      category: VeggieCategory.fruit,
      shortDescription: 'Green or red, they\'re generally round and tasty.',
      accentColor: Color(0x40de8c66),
      seasons: [Season.winter, Season.spring, Season.summer, Season.autumn],
      vitaminAPercentage: 2,
      vitaminCPercentage: 8,
      servingSize: 'One large apple',
      caloriesPerServing: 130,
    ),
    Veggie(
      id: 2,
      name: 'Artichokes',
      imageAssetPath: 'assets/images/artichoke.jpg',
      category: VeggieCategory.flower,
      shortDescription: 'The armadillo of vegetables.',
      accentColor: Color(0x408ea26d),
      seasons: [Season.spring, Season.autumn],
      vitaminAPercentage: 0,
      vitaminCPercentage: 25,
      servingSize: '1 medium artichoke',
      caloriesPerServing: 60,
    ),
    Veggie(
      id: 3,
      name: 'Asparagus',
      imageAssetPath: 'assets/images/asparagus.jpg',
      category: VeggieCategory.fern,
      shortDescription: 'It\'s been used a food and medicine for millenia.',
      accentColor: Color(0x408cb437),
      seasons: [Season.spring],
      vitaminAPercentage: 10,
      vitaminCPercentage: 15,
      servingSize: '5 spears',
      caloriesPerServing: 20,
    ),
    Veggie(
      id: 4,
      name: 'Avocado',
      imageAssetPath: 'assets/images/avocado.jpg',
      category: VeggieCategory.stealthFruit,
      shortDescription: 'One of the oiliest, richest vegetables money can buy.',
      accentColor: Color(0x40b0ba59),
      seasons: [Season.winter, Season.spring, Season.summer],
      vitaminAPercentage: 0,
      vitaminCPercentage: 4,
      servingSize: '1/5 medium avocado',
      caloriesPerServing: 50,
    ),
    Veggie(
      id: 5,
      name: 'Blackberries',
      imageAssetPath: 'assets/images/blackberry.jpg',
      category: VeggieCategory.berry,
      shortDescription: 'Find them on backroads and fences in the Northwest.',
      accentColor: Color(0x409d5adb),
      seasons: [Season.summer],
      vitaminAPercentage: 6,
      vitaminCPercentage: 4,
      servingSize: '1 cup',
      caloriesPerServing: 62,
    ),
    Veggie(
      id: 6,
      name: 'Cantaloupe',
      imageAssetPath: 'assets/images/cantaloupe.jpg',
      category: VeggieCategory.melon,
      shortDescription: 'A fruit so tasty there\'s a utensil just for it.',
      accentColor: Color(0x40f6bd56),
      seasons: [Season.summer],
      vitaminAPercentage: 120,
      vitaminCPercentage: 80,
      servingSize: '1/4 medium cantaloupe',
      caloriesPerServing: 50,
    ),
    Veggie(
      id: 7,
      name: 'Cauliflower',
      imageAssetPath: 'assets/images/cauliflower.jpg',
      category: VeggieCategory.cruciferous,
      shortDescription: 'Looks like white broccoli and explodes when cut.',
      accentColor: Color(0x40c891a8),
      seasons: [Season.autumn],
      vitaminAPercentage: 0,
      vitaminCPercentage: 100,
      servingSize: '1/6 medium head',
      caloriesPerServing: 25,
    ),
    Veggie(
      id: 8,
      name: 'Endive',
      imageAssetPath: 'assets/images/endive.jpg',
      category: VeggieCategory.leafy,
      shortDescription: 'It\'s basically the veal of lettuce.',
      accentColor: Color(0x40c5be53),
      seasons: [Season.winter, Season.spring, Season.autumn],
      vitaminAPercentage: 10,
      vitaminCPercentage: 2,
      servingSize: '1/2 cup, chopped',
      caloriesPerServing: 4,
    ),
    Veggie(
      id: 9,
      name: 'Figs',
      imageAssetPath: 'assets/images/fig.jpg',
      category: VeggieCategory.fruit,
      shortDescription: 'Delicious when sliced and wrapped in prosciutto.',
      accentColor: Color(0x40aa6d7c),
      seasons: [Season.summer, Season.autumn],
      vitaminAPercentage: 2,
      vitaminCPercentage: 2,
      servingSize: '1 large fig',
      caloriesPerServing: 50,
    ),
    Veggie(
      id: 10,
      name: 'Grapes',
      imageAssetPath: 'assets/images/grape.jpg',
      category: VeggieCategory.berry,
      shortDescription: 'Couldn\'t have wine without them.',
      accentColor: Color(0x40ac708a),
      seasons: [Season.autumn],
      vitaminAPercentage: 0,
      vitaminCPercentage: 2,
      servingSize: '3/4 cup',
      caloriesPerServing: 90,
    ),
    Veggie(
      id: 11,
      name: 'Green Pepper',
      imageAssetPath: 'assets/images/green_bell_pepper.jpg',
      category: VeggieCategory.stealthFruit,
      shortDescription: 'Pleasantly bitter, like a sad movie.',
      accentColor: Color(0x408eb332),
      seasons: [Season.summer],
      vitaminAPercentage: 4,
      vitaminCPercentage: 190,
      servingSize: '1 medium pepper',
      caloriesPerServing: 25,
    ),
    Veggie(
      id: 12,
      name: 'Habanero',
      imageAssetPath: 'assets/images/habanero.jpg',
      category: VeggieCategory.stealthFruit,
      shortDescription: 'Delicious... in extremely small quantities.',
      accentColor: Color(0x40ff7a01),
      seasons: [Season.summer, Season.autumn],
      vitaminAPercentage: 9,
      vitaminCPercentage: 100,
      servingSize: '1 pepper',
      caloriesPerServing: 20,
    ),
    Veggie(
      id: 13,
      name: 'Kale',
      imageAssetPath: 'assets/images/kale.jpg',
      category: VeggieCategory.cruciferous,
      shortDescription: 'The meanest vegetable. Does not want to be eaten.',
      accentColor: Color(0x40a86bd8),
      seasons: [Season.winter, Season.autumn],
      vitaminAPercentage: 133,
      vitaminCPercentage: 134,
      servingSize: '1 cup, chopped',
      caloriesPerServing: 33,
    ),
    Veggie(
      id: 14,
      name: 'Kiwi',
      imageAssetPath: 'assets/images/kiwi.jpg',
      category: VeggieCategory.berry,
      shortDescription: 'Also known as Chinese gooseberry.',
      accentColor: Color(0x40b47b37),
      seasons: [Season.summer],
      vitaminAPercentage: 2,
      vitaminCPercentage: 240,
      servingSize: '2 medium kiwis',
      caloriesPerServing: 90,
    ),
    Veggie(
      id: 15,
      name: 'Lemons',
      imageAssetPath: 'assets/images/lemon.jpg',
      category: VeggieCategory.citrus,
      shortDescription: 'Similar to limes, only yellow.',
      accentColor: Color(0x40e2a500),
      seasons: [Season.winter],
      vitaminAPercentage: 0,
      vitaminCPercentage: 40,
      servingSize: '1 medium lemon',
      caloriesPerServing: 15,
    ),
    Veggie(
      id: 16,
      name: 'Limes',
      imageAssetPath: 'assets/images/lime.jpg',
      category: VeggieCategory.citrus,
      shortDescription: 'Couldn\'t have ceviche and margaritas without them.',
      accentColor: Color(0x4089b733),
      seasons: [Season.winter],
      vitaminAPercentage: 0,
      vitaminCPercentage: 35,
      servingSize: '1 medium lime',
      caloriesPerServing: 20,
    ),
    Veggie(
      id: 17,
      name: 'Mangos',
      imageAssetPath: 'assets/images/mango.jpg',
      category: VeggieCategory.tropical,
      shortDescription: 'A fun orange fruit popular with smoothie enthusiasts.',
      accentColor: Color(0x40fcc93c),
      seasons: [Season.summer, Season.autumn],
      vitaminAPercentage: 72,
      vitaminCPercentage: 203,
      servingSize: '1 fruit',
      caloriesPerServing: 201,
    ),
    Veggie(
      id: 18,
      name: 'Mushrooms',
      imageAssetPath: 'assets/images/mushroom.jpg',
      category: VeggieCategory.fungus,
      shortDescription: 'They\'re not truffles, but they\'re still tasty.',
      accentColor: Color(0x40ba754b),
      seasons: [Season.spring, Season.autumn],
      vitaminAPercentage: 0,
      vitaminCPercentage: 2,
      servingSize: '5 medium \'shrooms',
      caloriesPerServing: 20,
    ),
    Veggie(
      id: 19,
      name: 'Nectarines',
      imageAssetPath: 'assets/images/nectarine.jpg',
      category: VeggieCategory.stoneFruit,
      shortDescription: 'Tiny, bald peaches.',
      accentColor: Color(0x40e45b3b),
      seasons: [Season.summer],
      vitaminAPercentage: 8,
      vitaminCPercentage: 15,
      servingSize: '1 medium nectarine',
      caloriesPerServing: 60,
    ),
    Veggie(
      id: 20,
      name: 'Persimmons',
      imageAssetPath: 'assets/images/persimmon.jpg',
      category: VeggieCategory.fruit,
      shortDescription: 'It\'s like a plum and an apple had a baby together.',
      accentColor: Color(0x40979852),
      seasons: [Season.winter, Season.autumn],
      vitaminAPercentage: 0,
      vitaminCPercentage: 27,
      servingSize: '1 fruit',
      caloriesPerServing: 32,
    ),
    Veggie(
      id: 21,
      name: 'Plums',
      imageAssetPath: 'assets/images/plum.jpg',
      category: VeggieCategory.stoneFruit,
      shortDescription: 'Popular in fruit salads and children\'s tales.',
      accentColor: Color(0x40e48b47),
      seasons: [Season.summer],
      vitaminAPercentage: 8,
      vitaminCPercentage: 10,
      servingSize: '2 medium plums',
      caloriesPerServing: 70,
    ),
    Veggie(
      id: 22,
      name: 'Potatoes',
      imageAssetPath: 'assets/images/potato.jpg',
      category: VeggieCategory.tuber,
      shortDescription: 'King of starches and giver of french fries.',
      accentColor: Color(0x40c65c63),
      seasons: [Season.winter, Season.autumn],
      vitaminAPercentage: 0,
      vitaminCPercentage: 45,
      servingSize: '1 medium spud',
      caloriesPerServing: 110,
    ),
    Veggie(
      id: 23,
      name: 'Radicchio',
      imageAssetPath: 'assets/images/radicchio.jpg',
      category: VeggieCategory.leafy,
      shortDescription: 'It\'s that bitter taste in the salad you\'re eating.',
      accentColor: Color(0x40d75875),
      seasons: [Season.spring, Season.autumn],
      vitaminAPercentage: 0,
      vitaminCPercentage: 10,
      servingSize: '2 cups shredded',
      caloriesPerServing: 20,
    ),
    Veggie(
      id: 24,
      name: 'Radishes',
      imageAssetPath: 'assets/images/radish.jpg',
      category: VeggieCategory.root,
      shortDescription: 'Try roasting them in addition to slicing them up raw.',
      accentColor: Color(0x40819e4e),
      seasons: [Season.spring, Season.autumn],
      vitaminAPercentage: 0,
      vitaminCPercentage: 30,
      servingSize: '7 radishes',
      caloriesPerServing: 10,
    ),
    Veggie(
      id: 25,
      name: 'Squash',
      imageAssetPath: 'assets/images/squash.jpg',
      category: VeggieCategory.gourd,
      shortDescription: 'Just slather them in butter and pop \'em in the oven.',
      accentColor: Color(0x40dbb721),
      seasons: [Season.winter, Season.autumn],
      vitaminAPercentage: 297,
      vitaminCPercentage: 48,
      servingSize: '1 cup diced butternut',
      caloriesPerServing: 63,
    ),
    Veggie(
      id: 26,
      name: 'Strawberries',
      imageAssetPath: 'assets/images/strawberry.jpg',
      category: VeggieCategory.berry,
      shortDescription:
          'A delicious fruit that keeps its seeds on the outside.',
      accentColor: Color(0x40f06a44),
      seasons: [Season.spring, Season.summer],
      vitaminAPercentage: 0,
      vitaminCPercentage: 160,
      servingSize: '8 medium strawberries',
      caloriesPerServing: 50,
    ),
    Veggie(
      id: 27,
      name: 'Tangelo',
      imageAssetPath: 'assets/images/tangelo.jpg',
      category: VeggieCategory.citrus,
      shortDescription: 'No one\'s sure what they are or where they came from.',
      accentColor: Color(0x40f88c06),
      seasons: [Season.winter, Season.autumn],
      vitaminAPercentage: 6,
      vitaminCPercentage: 181,
      servingSize: '1 medium tangelo',
      caloriesPerServing: 60,
    ),
    Veggie(
      id: 28,
      name: 'Tomatoes',
      imageAssetPath: 'assets/images/tomato.jpg',
      category: VeggieCategory.stealthFruit,
      shortDescription: 'A new world food with old world tradition.',
      accentColor: Color(0x40ea3628),
      seasons: [Season.summer],
      vitaminAPercentage: 20,
      vitaminCPercentage: 40,
      servingSize: '1 medium tomato',
      caloriesPerServing: 25,
    ),
    Veggie(
      id: 29,
      name: 'Watermelon',
      imageAssetPath: 'assets/images/watermelon.jpg',
      category: VeggieCategory.melon,
      shortDescription: 'Everyone\'s favorite closing act at the picnic.',
      accentColor: Color(0x40fa8c75),
      seasons: [Season.summer],
      vitaminAPercentage: 30,
      vitaminCPercentage: 25,
      servingSize: '2 cups diced',
      caloriesPerServing: 80,
    ),
    Veggie(
      id: 30,
      name: 'Orange Bell Pepper',
      imageAssetPath: 'assets/images/orange_bell_pepper.jpg',
      category: VeggieCategory.stealthFruit,
      shortDescription: 'Like green pepper, but nicer.',
      accentColor: Color(0x40fd8e00),
      seasons: [Season.summer],
      vitaminAPercentage: 4,
      vitaminCPercentage: 190,
      servingSize: '1 medium pepper',
      caloriesPerServing: 25,
    ),
  ];
}