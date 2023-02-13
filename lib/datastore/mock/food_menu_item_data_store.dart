// Mock data store with fake entities to test.
import 'package:food_delivery_single_template/datastore/mock/mock_data_store.dart';
import 'package:food_delivery_single_template/model/choice.dart';
import 'package:food_delivery_single_template/model/choice_item.dart';
import 'package:food_delivery_single_template/model/food_menu_item.dart';

class FoodMenuItemDataStore extends MockDataStore<FoodMenuItem> {
  @override
  List<FoodMenuItem> items = const [
    FoodMenuItem(
        id: "i001",
        name: "Classic Burger Menu",
        description: "Burger, Potato, Beverage, felapton",
        image: "mi_classic_burger_menu",
        price: 18.0,
        regularPrice: 18.0,
        categoryId: "c001",
        choices: [
          Removables(
            name: "Ingredients",
            choiceItems: [
              ChoiceItem(name: "Onion"),
              ChoiceItem(name: "Pickles"),
              ChoiceItem(name: "Tomato"),
              ChoiceItem(name: "Mayonnaise"),
              ChoiceItem(name: "Lettuce"),
            ],
          ),
          Options(
            name: "Hamburger Bread",
            choiceItems: [
              ChoiceItem(name: "Classic", price: 0.0, isDefault: true),
              ChoiceItem(name: "Bread with Sesame", price: 1.0),
            ],
          ),
          Options(
            name: "Potato",
            choiceItems: [
              ChoiceItem(name: "Apple slice", price: 0.0, isDefault: true),
              ChoiceItem(name: "Finger"),
            ],
          ),
          Options(
            name: "Beverage",
            choiceItems: [
              ChoiceItem(name: "Cola 33cl", price: 0.0, isDefault: true),
              ChoiceItem(name: "Sprite 33cl"),
              ChoiceItem(name: "Fanta 33cl"),
              ChoiceItem(name: "Fruko 33cl"),
              ChoiceItem(name: "Cappy 33cl"),
              ChoiceItem(name: "7up 33cl"),
            ],
          ),
        ]),

    FoodMenuItem(
      id: "i002",
      name: "Classic Double Burger Menu",
      description: "Burger, Potato, Beverage, darapti, felapton",
      image: "mi_double_burger_menu",
      price: 32,
      regularPrice: 38,
      isFeatured: true,
      categoryId: "c001",
      choices: [
        Removables(
          name: "Ingredients",
          choiceItems: [
            ChoiceItem(name: "Onion"),
            ChoiceItem(name: "Pickles"),
            ChoiceItem(name: "Tomato"),
            ChoiceItem(name: "Mayonnaise"),
            ChoiceItem(name: "Lettuce"),
          ],
        ),
        Options(
          name: "Hamburger Bread",
          choiceItems: [
            ChoiceItem(name: "Classic", price: 0.0, isDefault: true),
            ChoiceItem(name: "Bread with Sesame", price: 1.0),
          ],
        ),
        Options(
          name: "Potato",
          choiceItems: [
            ChoiceItem(name: "Apple slice", price: 0.0, isDefault: true),
            ChoiceItem(name: "Finger"),
          ],
        ),
        Options(
          name: "Beverage",
          choiceItems: [
            ChoiceItem(name: "Cola 33cl", price: 0.0, isDefault: true),
            ChoiceItem(name: "Sprite 33cl"),
            ChoiceItem(name: "Fanta 33cl"),
            ChoiceItem(name: "Fruko 33cl"),
            ChoiceItem(name: "Cappy 33cl"),
            ChoiceItem(name: "7up 33cl"),
          ],
        ),
      ],
    ),

    FoodMenuItem(
      id: "i003",
      name: "Chicken Burger Menu",
      description: "Chicken, bread, mayonnaise, lettuce, darapti",
      image: "mi_chicken_burger_menu",
      price: 12.0,
      regularPrice: 12.0,
      categoryId: "c001",
      choices: [
        Removables(
          name: "Ingredients",
          choiceItems: [
            ChoiceItem(name: "Mayonnaise"),
            ChoiceItem(name: "Lettuce"),
          ],
        ),
        Options(
          name: "Hamburger Bread",
          choiceItems: [
            ChoiceItem(name: "Classic", price: 0.0, isDefault: true),
            ChoiceItem(name: "Bread with Sesame", price: 1.0),
          ],
        ),
        Options(
          name: "Potato",
          choiceItems: [
            ChoiceItem(name: "Apple slice", price: 0.0, isDefault: true),
            ChoiceItem(name: "Finger"),
          ],
        ),
        Options(
          name: "Beverage",
          choiceItems: [
            ChoiceItem(name: "Cola 33cl", price: 0.0, isDefault: true),
            ChoiceItem(name: "Sprite 33cl"),
            ChoiceItem(name: "Fanta 33cl"),
            ChoiceItem(name: "Fruko 33cl"),
            ChoiceItem(name: "Cappy 33cl"),
            ChoiceItem(name: "7up 33cl"),
          ],
        ),
      ],
    ),

    FoodMenuItem(
      id: "i004",
      name: "Double Chicken Burger Menu",
      description: "Chicken, bread, mayonnaise, lettuce, felapton",
      image: "mi_double_chicken_burger_menu",
      price: 20.0,
      regularPrice: 20.0,
      categoryId: "c001",
      choices: [
        Removables(
          name: "Ingredients",
          choiceItems: [
            ChoiceItem(name: "Mayonnaise"),
            ChoiceItem(name: "Lettuce"),
          ],
        ),
        Options(
          name: "Hamburger Bread",
          choiceItems: [
            ChoiceItem(name: "Classic", price: 0.0, isDefault: true),
            ChoiceItem(name: "Bread with Sesame", price: 1.0),
          ],
        ),
        Options(name: "Potato", choiceItems: [
          ChoiceItem(name: "Apple slice", price: 0.0, isDefault: true),
          ChoiceItem(name: "Finger"),
        ]),
        Options(
          name: "Beverage",
          choiceItems: [
            ChoiceItem(name: "Cola 33cl", price: 0.0, isDefault: true),
            ChoiceItem(name: "Sprite 33cl"),
            ChoiceItem(name: "Fanta 33cl"),
            ChoiceItem(name: "Fruko 33cl"),
            ChoiceItem(name: "Cappy 33cl"),
            ChoiceItem(name: "7up 33cl"),
          ],
        ),
      ],
    ),

    // burger

    FoodMenuItem(
      id: "i005",
      name: "Classic Burger",
      description:
          "Beef, bread, pickles, ketchup, mayonnaise, lettuce, tomato, onion.",
      image: "mi_burger",
      price: 8,
      regularPrice: 10,
      categoryId: "c002",
      choices: [
        Removables(
          name: "Ingredients",
          choiceItems: [
            ChoiceItem(name: "Onion"),
            ChoiceItem(name: "Pickles"),
            ChoiceItem(name: "Tomato"),
            ChoiceItem(name: "Mayonnaise"),
            ChoiceItem(name: "Lettuce"),
          ],
        ),
        Options(
          name: "Hamburger Bread",
          choiceItems: [
            ChoiceItem(name: "Classic", price: 0.0, isDefault: true),
            ChoiceItem(name: "Bread with Sesame", price: 1.0),
          ],
        ),
      ],
    ),

    FoodMenuItem(
      id: "i006",
      name: "Double Burger",
      description:
          "Beef, bread, pickles, ketchup, mayonnaise, lettuce, tomato, onion.",
      image: "mi_double_burger",
      price: 14.0,
      regularPrice: 14.0,
      categoryId: "c002",
      choices: [
        Removables(
          name: "Ingredients",
          choiceItems: [
            ChoiceItem(name: "Onion"),
            ChoiceItem(name: "Pickles"),
            ChoiceItem(name: "Tomato"),
            ChoiceItem(name: "Mayonnaise"),
            ChoiceItem(name: "Lettuce"),
          ],
        ),
        Options(
          name: "Hamburger Bread",
          choiceItems: [
            ChoiceItem(name: "Classic", price: 0.0, isDefault: true),
            ChoiceItem(name: "Bread with Sesame", price: 1.0),
          ],
        ),
      ],
    ),

    FoodMenuItem(
      id: "i007",
      name: "Chicken Burger",
      description: "Chicken, bread, mayonnaise, lettuce, felapton, darapti",
      image: "mi_chicken_burger",
      price: 6,
      regularPrice: 6.0,
      categoryId: "c002",
      choices: [
        Removables(
          name: "Ingredients",
          choiceItems: [
            ChoiceItem(name: "Mayonnaise"),
            ChoiceItem(name: "Lettuce"),
          ],
        ),
        Options(
          name: "Hamburger Bread",
          choiceItems: [
            ChoiceItem(name: "Classic", price: 0.0, isDefault: true),
            ChoiceItem(name: "Bread with Sesame", price: 1.0),
          ],
        ),
      ],
    ),

    FoodMenuItem(
      id: "i008",
      name: "Double Chicken Burger",
      description: "Chicken, bread, mayonnaise, lettuce, darapti, felapton",
      image: "mi_double_chicken_burger",
      price: 10.0,
      regularPrice: 10.0,
      categoryId: "c002",
      choices: [
        Removables(
          name: "Ingredients",
          choiceItems: [
            ChoiceItem(name: "Mayonnaise"),
            ChoiceItem(name: "Lettuce"),
          ],
        ),
        Options(
          name: "Hamburger Bread",
          choiceItems: [
            ChoiceItem(name: "Classic", price: 0.0, isDefault: true),
            ChoiceItem(name: "Bread with Sesame", price: 1.0),
          ],
        ),
      ],
    ),

    // meat

    FoodMenuItem(
      id: "i009",
      name: "Tenderloin",
      description: "Tenderloin, salad, pasta, felapton, darapti",
      image: "mi_tenderloin",
      price: 20.0,
      regularPrice: 20.0,
      isPopular: true,
      categoryId: "c003",
      choices: [
        Extras(
          name: "Sauces",
          choiceItems: [
            ChoiceItem(name: "Barbeque", price: 2.0),
            ChoiceItem(name: "Ranch", price: 2.0),
            ChoiceItem(name: "Garlic", price: 2.0),
            ChoiceItem(name: "Mustrad", price: 2.0),
            ChoiceItem(name: "Cheddar", price: 2.0),
            ChoiceItem(name: "Chili", price: 2.0),
          ],
        ),
      ],
    ),

    FoodMenuItem(
      id: "i010",
      name: "Tenderloin with Mushroom Sauce",
      description: "Tenderloin, mushroom sauce, salad, pasta, felapton",
      image: "mi_tenderloin_mushroom",
      price: 23.0,
      regularPrice: 23.0,
      categoryId: "c003",
      choices: [
        Extras(
          name: "Sauces",
          choiceItems: [
            ChoiceItem(name: "Barbeque", price: 2.0),
            ChoiceItem(name: "Ranch", price: 2.0),
            ChoiceItem(name: "Garlic", price: 2.0),
            ChoiceItem(name: "Mustrad", price: 2.0),
            ChoiceItem(name: "Cheddar", price: 2.0),
            ChoiceItem(name: "Chili", price: 2.0),
          ],
        ),
      ],
    ),

    FoodMenuItem(
      id: "i011",
      name: "Grilled Meatball",
      description: "Meatball, salad, potato.",
      image: "mi_meatball",
      price: 25.0,
      regularPrice: 25.0,
      isFeatured: true,
      categoryId: "c003",
      choices: [
        Extras(
          name: "Sauces",
          choiceItems: [
            ChoiceItem(name: "Barbeque", price: 2.0),
            ChoiceItem(name: "Ranch", price: 2.0),
            ChoiceItem(name: "Garlic", price: 2.0),
            ChoiceItem(name: "Mustrad", price: 2.0),
            ChoiceItem(name: "Cheddar", price: 2.0),
            ChoiceItem(name: "Chili", price: 2.0),
          ],
        ),
      ],
    ),

    // chicken

    FoodMenuItem(
      id: "i012",
      name: "Grilled Chicken Steak",
      description: "Grilled chicken steak, pasta, salad, felapton, darapti",
      image: "mi_grilled_chicken_steak",
      price: 16.0,
      regularPrice: 16.0,
      categoryId: "c004",
      choices: [
        Extras(
          name: "Extra Ingredients",
          choiceItems: [
            ChoiceItem(name: "Mushroom", price: 3.0),
            ChoiceItem(name: "Special Sauce", price: 2.0)
          ],
        ),
      ],
    ),

    FoodMenuItem(
      id: "i014",
      name: "Alinazik Chicken",
      description: "Chicken chop, yogurt, eggplant, felapton, darapti",
      image: "mi_alinazik_chicken",
      price: 20.0,
      regularPrice: 20.0,
      isFeatured: true,
      categoryId: "c004",
      choices: [
        Extras(
          name: "Extra Ingredients",
          choiceItems: [
            ChoiceItem(name: "Mushroom", price: 3.0),
            ChoiceItem(name: "Special Sauce", price: 2.0),
          ],
        ),
      ],
    ),

    FoodMenuItem(
      id: "i015",
      name: "Chicken with curry sauce",
      description: "Chicken curry sauce, mushroom, pasta, onion, salad",
      image: "mi_curry_chicken",
      price: 22.0,
      regularPrice: 22.0,
      isPopular: true,
      categoryId: "c004",
      choices: [
        Extras(
          name: "Extra Ingredients",
          choiceItems: [
            ChoiceItem(name: "Mushroom", price: 3.0),
            ChoiceItem(name: "Special Sauce", price: 2.0)
          ],
        ),
      ],
    ),

    FoodMenuItem(
        id: "i016",
        name: "Chicken Fajitas",
        description: "Chicken fajitas, mushroom, onion, salad, pepper",
        image: "mi_chicken_fajitas",
        price: 22.0,
        regularPrice: 22.0,
        categoryId: "c004",
        choices: [
          Removables(
            name: "Ingredients",
            choiceItems: [
              ChoiceItem(name: "Onion"),
              ChoiceItem(name: "Pepper"),
            ],
          ),
          Options(
            name: "Potato",
            choiceItems: [
              ChoiceItem(name: "Apple slice", price: 0.0, isDefault: true),
              ChoiceItem(name: "Finger"),
            ],
          ),
          Extras(name: "Extra Ingredients", choiceItems: [
            ChoiceItem(name: "Mushroom", price: 3.0),
            ChoiceItem(name: "Special Sauce", price: 2.0),
          ])
        ]),

    // pasta

    FoodMenuItem(
      id: "i017",
      name: "Noodle Chicken",
      description: "Chicken with sauce, mushroom, pepper, felapton, darapti",
      image: "mi_noodle_chicken",
      price: 10.0,
      regularPrice: 12.0,
      categoryId: "c005",
      choices: [
        Removables(
          name: "Ingredients",
          choiceItems: [
            ChoiceItem(name: "Pepper"),
          ],
        ),
      ],
    ),

    FoodMenuItem(
      id: "i018",
      name: "Spaghetti Bolognese",
      description: "Tomato sauce, mince, pasta, felapton, darapti",
      image: "mi_spaghetti_bolognese",
      price: 10.0,
      regularPrice: 10.0,
      isFeatured: true,
      categoryId: "c005",
      choices: [],
    ),

    FoodMenuItem(
      id: "i019",
      name: "Napolitan Pasta",
      description: "Napolitan sauce, cheddar, pasta, felapton, darapti",
      image: "mi_napolitan_pasta",
      price: 11,
      regularPrice: 12,
      isPopular: true,
      categoryId: "c005",
      choices: [],
    ),

    FoodMenuItem(
      id: "i020",
      name: "Alfredo Pasta",
      description: "Chicken with sauce, cheddar, mushroom, pasta, custard",
      image: "mi_alfredo_pasta",
      price: 12,
      regularPrice: 14.0,
      isFeatured: true,
      categoryId: "c005",
      choices: [],
    ),

    // salad

    FoodMenuItem(
      id: "i021",
      name: "Caesar Salad",
      description: "Chicken fillet, cucumber, tomato, lettuce, caesar sauce.",
      image: "mi_caesar_salad",
      price: 7,
      regularPrice: 8,
      categoryId: "c006",
      choices: [],
    ),

    FoodMenuItem(
      id: "i022",
      name: "Mexican Salad",
      description:
          "Chicken with Mexican sauce, cucumber, tomato, corn, lettuce.",
      image: "mi_mexican_salad",
      price: 8,
      regularPrice: 8.0,
      isPopular: true,
      categoryId: "c006",
      choices: [],
    ),

    FoodMenuItem(
      id: "i023",
      name: "Thai Salad",
      description:
          "Mushrooms in sauce, beans, lettuce, cucumber, tomato, corn.",
      image: "mi_thai_salad",
      price: 8,
      regularPrice: 8.0,
      categoryId: "c006",
      choices: [],
    ),

    FoodMenuItem(
      id: "i024",
      name: "Tuna Salad",
      description:
          "Mediterranean salad, tuna, tomato, cucumber, corn, lettuce.",
      image: "mi_tuna_salad",
      price: 10,
      regularPrice: 10.0,
      categoryId: "c006",
      choices: [],
    ),

    // dessert

    FoodMenuItem(
      id: "i025",
      name: "Ginger Carrot Cake",
      description: "Carrot cake with ginger, felapton, darapti",
      image: "mi_ginger_carrot_cake",
      price: 4,
      regularPrice: 4.0,
      categoryId: "c007",
      choices: [],
    ),

    FoodMenuItem(
      id: "i026",
      name: "Lemon Tart",
      description: "Pastry shell with a lemon flavored filling.",
      image: "mi_lemon_tart",
      price: 4,
      regularPrice: 6,
      categoryId: "c007",
      choices: [],
    ),

    FoodMenuItem(
      id: "i027",
      name: "Profiterole",
      description:
          "Small hollow pastry typically filled with cream and covered with chocolate sauce.",
      image: "mi_profiterole",
      price: 5.0,
      regularPrice: 5.0,
      isPopular: true,
      categoryId: "c007",
      choices: [],
    ),

    FoodMenuItem(
      id: "i028",
      name: "Salted Caramel Brownie",
      description: "70% dark chocolate, salted caramel brownie.",
      image: "mi_salted_caramel_brownie",
      price: 5.0,
      regularPrice: 7.0,
      categoryId: "c007",
      choices: [],
    ),

    FoodMenuItem(
      id: "i029",
      name: "Supangle",
      description:
          "Its bottom layer includes pieces of cake and it is often garnished with pistachio or coconut, and chocolate chips.",
      image: "mi_supangle",
      price: 5.0,
      regularPrice: 5.0,
      categoryId: "c007",
      choices: [],
    ),

    // beverage

    FoodMenuItem(
      id: "i030",
      name: "Caffe Latte",
      description: "Darapti, disamis, datisi, felapton, darapti, disamis",
      image: "mi_caffe_latte",
      price: 2.0,
      regularPrice: 3.0,
      categoryId: "c008",
      choices: [],
    ),

    FoodMenuItem(
      id: "i031",
      name: "Cappucino",
      description: "Darapti, disamis, datisi, felapton, darapti, disamis",
      image: "mi_cappucino",
      price: 2.0,
      regularPrice: 2.0,
      categoryId: "c008",
      choices: [],
    ),

    FoodMenuItem(
      id: "i032",
      name: "Ice Americano",
      description: "Darapti, disamis, datisi, felapton, darapti, disamis",
      image: "mi_ice_americano",
      price: 3.0,
      regularPrice: 4.0,
      categoryId: "c008",
      choices: [],
    ),

    FoodMenuItem(
      id: "i033",
      name: "Americano",
      description: "Darapti, disamis, datisi, felapton, darapti, disamis",
      image: "mi_americano",
      price: 3.0,
      regularPrice: 4.0,
      categoryId: "c008",
      choices: [],
    )
  ];
}
