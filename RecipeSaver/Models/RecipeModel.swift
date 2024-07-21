//
//  RecipeModel.swift
//  RecipeSaver
//
//  Created by Esma Koçak on 21.07.2024.
//

import Foundation

enum Category: String {
    case breakfast = "Breakfast"
    case soup = "Soup"
    case salad = "Salad"
    case appetizer = "Appetizer"
    case main = "Main"
    case side = "Side"
    case dessert = "Dessert"
    case snack = "Snack"
    case drink = "Drink"
}

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let description: String
    let ingredients: String
    let directions: String
    let category: Category.RawValue
    let datePublished: String
    let url: String
    
}


extension Recipe {
    static let all: [Recipe] = [
        Recipe(
            name: "Creamy Carrot Soup",
            image: "https://midwestfoodieblog.com/wp-content/uploads/2019/11/FINAL-vegan-carrot-soup-1-7_1.jpg",
            description: "This bold-hued soup is perfectly sweet and seriously comforting. Peeling the red bell pepper helps make this carrot soup extra silky. Dress it up with a drizzle of rich cashew cream, pomegranate seeds, and chopped fresh parsley for a festive fall presentation.",
            ingredients: "2 cup cashews\n1 medium onion, cut into 2-inch dice (2 cups)\n1 pounds carrots, cut into 2-inch dice (3 cups)\n1 red bell pepper, peeled and cut into 2-inch dice (1 cup)\n1 sprig fresh rosemary\n1 sprig fresh thyme\n1 large fresh sage leaf\n4 cloves garlic, minced\n1 tablespoon lemon juice\nSea salt and freshly ground black pepper or cayenne pepper, to taste\n2 cup fresh pomegranate seeds\n2 tablespoons finely chopped fresh parsley",
            directions: "In a small bowl, cover the cashews with 1 cup hot water; let soak 20 minutes. Transfer cashews and remaining liquid to a blender; blend until smooth and creamy. Set aside. \nIn a saucepan, combine onion, carrots, bell pepper, rosemary, thyme, sage, and garlic. Add 2 cup water and saute over medium heat for 15 to 20 minutes, or until carrots are tender. InRemove pan from heat. Let vegetables cool for 10 minutes; then remove rosemary sprigs and thyme leaf. \nTransfer sauteed vegetables to a blender, and puree to a smooth paste. Return pureed vegetables to saucepan and add 3 cups water and 1 tablespoon lemon juice. Season with salt and pepper. Bring soup to boiling. InTo serve, place soup in individual bowls, drizzle with cashew cream, and garnish with pomegranate seeds and parsley.",
            category: "Soup",
            datePublished: "2019-11-11",
            url: "https://www.forksoverknives.com/recipes/vegan-soups-stews/creamy-carrot-soup/"
            ),
        
        Recipe(
            name: "Apple and Quinoa Salad",
            image: "https://www.recipegirl.com/wp-content/uploads/2016/09/Spinach-and-Quinoa-Salad-with-Apple.jpeg",
            description: "Each bite of this colorful salad is filled with the flavors of favorite fall ingredients such as apples, butternut squash, and pumpkin seeds. For optimum freshness and texture, wait to add the dressing until just before serving. InnNote that this recipe calls for cooked quinoa, so have that ready to go: For 1 cups cooked quinoa, rinse and drain 4 cup quinoa; cook according to package directions; and drain if needed. Check out our Grains Cooking Guide for more tips on prepping grains like a pro.",
            ingredients: "2 cups inch pieces peeled butternut squash\n3 cup pumpkin seeds\n5 teaspoon ground cinnamon\n1 lemon\n2 tablespoons pure maple syrup\n1 tablespoon Dijon mustard\n3 cups stemmed and chopped kale\n1 cups cooked quinoa\n cup chopped apple\n1 cup sliced green onionsSea salt and freshly ground black pepper, to taste",
            directions: "Preheat oven to 400°F. Line a 15x10-inch baking pan with parchment paper or a silicone baking mat. Arrange squash in the prepared baking pan. Roast 20 to 25 minutes or until squash is tender, brushing lightly with water if squash starts to look dry. Cool slightly on a wire rack. InMeanwhile, in a small bowl toss together pumpkin seeds and 3 teaspoon water; sprinkle with cinnamon. Place pumpkin seeds in a small, shallow baking pan. Roast 5 minutes or until lightly toasted; cool\nFor dressing, remove 1 teaspoon zest and squeeze 2 tablespoons juice from lemon. In a small bowl whisk together lemon zest and juice, maple syrup, and mustard. InIn a large bowl combine kale, quinoa, apple, green onions, and roasted squash. Add dressing; toss to coat. Season with salt and pepper. Top with pumpkin seeds.",
            category: "Salad",
            datePublished: "2019-10-22",
            url:"https://www.forksoverknives.com/recipes/vegan-salads-sides/kale-apple-and-quinoa-salad/™"
        ),
        
        Recipe(
            name:"Kale Cheese Bruschetta",
            image: "https://img.taste.com.au/FYjm5H3D/w720-h480-cfill-q80/taste/2016/11/blt-bruschettas-89298-1.jpeg",
            description: "We adore this as an appetizer, and so does everyohe else. It is always the first empty platter at our holiday party. No one knows it is plant-based; they just know it is so yummy. \nFrom The Prevent and Reverse Heart Disease Cookbook.",
            ingredients: "1 bunch kale\n1 loaf fresh 100 whole-grain bread, sliced\n cup Cannellini Bean Sauce\n1 cup grape tomatoes, halved\nbalsamic glaze",
            directions: "Place the kale leaves in a large pot of boiling water. Cover and cook until tender, about 5 minutes. Drain in a colander, then squeeze out any extra liquid with your hands (you don't want soggy bread). InToast 8 pieces of bread, and place them on a handsome serving platter. InSpread a tablespoon of the Cannellini Bean Sauce on the toasted bread, then cover with a layer of kale and top with a scattering of grape tomatoes. Drizzle\ngenerously with the balsamic glaze, and grab one for yourself before they all disappear.",
            category:"Appetizer",
            datePublished: "2015-06-28",
            url: "https://www.forksoverknives.com/recipes/vegan-snacks-appetizers/kale-bruschetta/"
        ),
        
        Recipe(
            name: "Vegetable Pot Pie",
            image: "https://www.forksoverknives.com/wp-content/uploads/fly-images/98816/Vegetable-pot-pie-for-wordpress-360x270-c.jpg",
            description: "This eye-popping pot pie makes a hearty addition to a holiday menu or an impressive entree any time of year. Note that this recipe calls for whole wheat pizza dough: Make some using our 10-minute recipe or look for oil-free options at the store (Trader Joe's makes a good one).",
            ingredients: "3 cups sliced fresh cremini mushrooms)n1 cup sliced carrots\nk cup sliced celery\n3 cups low-sodium vegetable brothin2 cups ½-inch pieces peeled butternut squash\n1 cups frozen whole pearl onions\n1 teaspoon chopped fresh thyme\n1 bay leafin1 15-oz, can no-salt-added chickpeas, rinsed and drained\n1 cup frozen peas\n1 cup frozen corn\n3 tablespoons all-purpose flourinSea salt and freshly ground black pepper, to taste\ni recipe Homemade Oil-Free Pizza Dough or 1 1b. refrigerated whole wheat pizza dough\n1 tablespoon unsweetened plant milk, such as almond, soy, cashew, or rice",
            directions:"Preheat oven to 425°F. For filling, in a 4-qt. saucepan cook mushrooms, carrots, and celery over medium 3 to 4 minutes, stirring occasionally and adding water, 1 to 2 Tbsp, at a time, as needed to prevent sticking. Add 3 cups of the broth, the squash, onions, thyme, and bay leaf. Bring to boiling; reduce heat. Simmer, covered, 5 minutes or until vegetables are nearly tender. Stir in chickpeas, peas, and corn.Inwhisk together flour and the remaining & cup broth; stir into vegetables.",
            category: "Main",
            datePublished: "2019-11-25",
            url: "https://www.forksoverknives.com/recipes/vegan-baked-stuffed/vegetable-pot-pia/"
        ),
        
        Recipe(
          name: "Blueberry Oatmeal",
          image: "https://www.saltycanary.com/wp-content/uploads/2019/07/Blueberry-Banana-Oatmeal-Salty-Canary-59-of-2-copy-480x480.jpg",
          description: "A nutritious and filling breakfast that can be customized with your favorite toppings.",
          ingredients: """
            1 cup rolled oats\n
            1 ½ cups milk (dairy or plant-based)\n
            ½ cup frozen blueberries\n
            1 banana, sliced\n
            Maple syrup or honey to taste (optional)\n
            Additional toppings: nuts, seeds, granola, cinnamon, etc. (optional)
            """,
          directions: """
            Combine oats and milk in a saucepan. \n
            Bring to a boil, then reduce heat and simmer for 5 minutes, or until oats are cooked through. \n
            Stir in blueberries and cook for 1 minute more, or until berries are heated through. \n
            Pour oatmeal into a bowl and top with sliced banana and your desired toppings. \n
            Drizzle with maple syrup or honey if desired.
            """,
          category: "Breakfast",
          datePublished: "2023-05-22",
          url: "https://www.saltycanary.com/blueberry-banana-oatmeal/"
        ),
        
        Recipe(
          name: "Roasted Broccoli",
          image: "https://s23209.pcdn.co/wp-content/uploads/2014/09/240124_DD_garlic-parm-broccoli_189-760x1140.jpg",
          description: "A simple and delicious side dish that's perfect for any meal.",
          ingredients: """
            1 head broccoli, cut into florets\n
            2 tablespoons olive oil\n
            3 cloves garlic, minced\n
            ¼ cup grated Parmesan cheese\n
            Salt and pepper to taste
            """,
          directions: """
            Preheat oven to 425°F (220°C). \n
            Toss broccoli florets with olive oil, garlic, salt, and pepper. \n
            Spread on a baking sheet and roast for 15-20 minutes, or until tender and slightly browned. \n
            Sprinkle with Parmesan cheese and roast for 1-2 minutes more, until cheese is melted.
            """,
          category: "Side",
          datePublished: "2023-06-15",
          url: "https://damndelicious.net/2014/09/19/garlic-parmesan-roasted-broccoli/"
        ),

        
        Recipe(
          name: "Spicy Chilli Edamame",
          image: "https://www.acouplecooks.com/wp-content/uploads/2020/03/Spicy-Edamame-004.jpg",
          description: "A quick and healthy snack with a kick.",
          ingredients: """
            1 cup shelled edamame (fresh or frozen)\n
            1 tablespoon olive oil\n
            ½ teaspoon chili powder\n
            ¼ teaspoon garlic powder\n
            ¼ teaspoon salt\n
            """,
          directions: """
            In a skillet, heat olive oil over medium heat. \n
            Add edamame and spices. \n
            Stir-fry for 5-7 minutes, or until heated through.
            """,
          category: "Snack",
          datePublished: "2023-07-03",
          url: "https://www.acouplecooks.com/spicy-edamame/"
        ),
        
        Recipe(
          name: "Pineapple Smoothie",
          image: "https://images.eatthismuch.com/img/906927_Shamarie84_c9cb0a63-7194-4eef-a7f0-006a11e19f85.png",
          description: "A refreshing and healthy smoothie.",
          ingredients: """
            1 cup frozen strawberries\n
            ½ cup milk (dairy or plant-based)\n
            ½ cup yogurt (plain or vanilla)\n
            1 tablespoon honey or maple syrup (optional)\n
            """,
          directions: """
            Combine all ingredients in a blender. \n
            Blend until smooth.
            """,
          category: "Drink",
          datePublished: "2023-04-10",
          url: "https://www.forksoverknives.com/recipes/vegan-snacks-appetizers/pineapple-ginger-smoothie/"
        ),
        
        Recipe(
          name: "Chocolate Tiramisu",
          image: "https://prettysimplesweet.com/wp-content/uploads/2016/05/ChocolateTiramisu_03.jpg",
          description: "A luscious Italian dessert with coffee-soaked ladyfingers and creamy mascarpone.",
          ingredients: """
            24 savoiardi ladyfingers (Italian sponge biscuits)\n
            1 ½ cups strong brewed coffee, cooled\n
            8 ounces mascarpone cheese\n
            ½ cup granulated sugar\n
            2 large eggs, separated\n
            1 tablespoon dark rum or brandy (optional)\n
            Cocoa powder for dusting
            """,
          directions: """
            In a shallow dish, combine coffee and rum (if using). \n
            Quickly dip each ladyfinger in the coffee mixture, turning once to coat both sides, and arrange in a single layer in a 9x13 inch dish. \n
            In a large bowl, beat mascarpone and sugar until smooth. \n
            In a separate bowl, beat egg yolks until pale and thick. Stir into mascarpone mixture. \n
            In a clean bowl, beat egg whites until stiff peaks form. Gently fold into the mascarpone mixture. \n
            Spread half the mascarpone mixture over the ladyfingers. \n
            Repeat with remaining ladyfingers and mascarpone mixture. \n
            Dust the top with cocoa powder. \n
            Refrigerate for at least 4 hours, or preferably overnight, before serving.
            """,
          category: "Dessert",
          datePublished: "2023-08-01",
          url: "https://prettysimplesweet.com/chocolate-tiramisu/"
        )
    ]
}
