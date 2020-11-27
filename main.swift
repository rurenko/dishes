import GameplayKit

struct SeededGenerator: RandomNumberGenerator {
  let seed: UInt64
  private let generator: GKMersenneTwisterRandomSource
  init(seed: UInt64) {
    self.seed = seed
    generator = GKMersenneTwisterRandomSource(seed: seed)
  }

  mutating func next() -> UInt64 {
    let next1 = UInt64(bitPattern: Int64(generator.nextInt()))
    let next2 = UInt64(bitPattern: Int64(generator.nextInt()))
    return next1 ^ (next2 << 32)
  }
}

struct Dish: Hashable, CustomStringConvertible {
  enum Meal: Hashable { case breakfast, dinner, supper }
  enum Kind: Hashable { case soup, main, porridge, salad }
  enum Ingredient: String, Hashable, CustomStringConvertible, Comparable {
    case spud = "картофель"
    case tomato = "помидоры"
    case chicken = "курица"
    case pork = "свинина"
    case rice = "рис"
    case milk = "молоко"
    case coconutMilk = "кокосовое молоко"
    case grecha = "греча"
    case egg = "яйцо"
    case cottageCheese = "творог"
    case oatmeal = "овсянка"
    case avocado = "авокадо"
    case nuts = "орехи"
    case flour = "мука"
    case beans = "фасоль"
    case cannedBeans = "фасоль консервированая"
    case kefir = "кефир"
    case bacon = "бекон"
    case salmon = "лосось"
    case creamcheese = "крем-сыр"
    case vinegar = "уксус"
    case bread = "хлеб"
    case celery = "сельдерей"
    case mushrooms = "грибы"
    case peas = "горох"
    case smockedRibs = "копчёные рёбрышки"
    case squash = "кабачок"
    case turkey = "индейка"
    case onion = "лук"
    case dill = "укроп"
    case pasta = "макароны"
    case carrot = "морковка"
    case mayonnaise = "майонез"
    case soy = "соевый соус"
    case paprika = "паприка (специя)"
    case pesto = "песто"
    case pineNut = "кедровые орешки"
    case hummus = "хумус"
    case cucumber = "огурец"
    case garganzola = "гарганзола"
    case cream = "сливки"
    case pita = "лаваш"
    case shrimp = "креветки"
    case redCabbage = "красная капуста"
    case green = "зелень"
    case pickles = "маринованые огурчики"
    case sausage = "колбаса"
    case rusk = "сухарики"
    case havaiiMix = "гавайская смесь"
    case pelmeni = "пельмени"
    case stake = "стейк"
    case butter = "сливочное масло"
    case lemon = "лимон"
    case ginger = "имбирь"
    case sweetRedPepper = "сладкий красный перец"
    case eggplant = "баклажан"
    case garlic = "чеснок"
    case cauliflower = "цветная капуста"
    case dijonMustard = "дижонская горчица"
    case cheese = "сыр"
    case spinach = "шпинат"
    case sourCream = "сметана"
    case millet = "пшено"
    case mozzarella = "моцарелла"
    case pumpkin = "тыква"
    case cellophaneNoodles = "фунчоза"
    case cranberry = "брусника"

    var isVegetarian: Bool {
      switch self {
      case .spud,
           .tomato,
           .rice,
           .milk,
           .coconutMilk,
           .grecha,
           .egg,
           .cottageCheese,
           .oatmeal,
           .avocado,
           .nuts,
           .flour,
           .beans,
           .cannedBeans,
           .kefir,
           .creamcheese,
           .vinegar,
           .bread,
           .celery,
           .mushrooms,
           .peas,
           .squash,
           .onion,
           .dill,
           .pasta,
           .carrot,
           .mayonnaise,
           .soy,
           .paprika,
           .pesto,
           .pineNut,
           .hummus,
           .cucumber,
           .garganzola,
           .cream,
           .pita,
           .shrimp,
           .redCabbage,
           .green,
           .pickles,
           .sausage,
           .rusk,
           .butter,
           .lemon,
           .ginger,
           .sweetRedPepper,
           .eggplant,
           .garlic,
           .cauliflower,
           .dijonMustard,
           .cheese,
           .spinach,
           .sourCream,
           .millet,
           .mozzarella,
           .cellophaneNoodles,
           .cranberry,
           .pumpkin,
           .havaiiMix:
        return true
      case .chicken,
           .pork,
           .stake,
           .pelmeni,
           .bacon,
           .turkey,
           .salmon,
           .smockedRibs:
        return false
      }
    }

    var emoji: String? {
      switch self {
      case .spud: return "🥔"
      case .tomato: return "🍅"
      case .chicken: return "🐔"
      case .pork: return "🐷"
      case .rice: return "🍚"
      case .milk, .kefir: return "🥛"
      case .coconutMilk: return "🥥"
      case .egg: return "🥚"
      case .avocado: return "🥑"
      case .nuts: return "🥜"
      case .flour: return "🌾"
      case .bacon: return "🥓"
      case .salmon: return "🐟"
      case .bread: return "🍞"
      case .celery: return nil
      case .mushrooms: return "🍄"
      case .turkey: return "🦃"
      case .onion: return "🧅"
      case .carrot: return "🥕"
      case .paprika: return "🌶"
      case .cucumber, .pickles: return "🥒"
      case .shrimp: return "🍤"
      case .green: return "🌿"
      case .pelmeni: return "🥟"
      case .stake: return "🥩"
      case .cheese: return "🧀"
      case .butter: return "🧈"
      case .lemon: return "🍋"
      case .garlic: return "🧄"
      case .eggplant: return "🍆"
      case .cauliflower: return "🥦"
      case .grecha,
           .cottageCheese,
           .oatmeal,
           .beans,
           .cannedBeans,
           .creamcheese,
           .vinegar,
           .peas,
           .smockedRibs,
           .squash,
           .dill,
           .pasta,
           .mayonnaise,
           .soy,
           .pesto,
           .pineNut,
           .hummus,
           .cream,
           .pita,
           .redCabbage,
           .sausage,
           .rusk,
           .ginger,
           .sweetRedPepper,
           .garganzola,
           .dijonMustard,
           .spinach,
           .sourCream,
           .millet,
           .mozzarella,
           .cellophaneNoodles,
           .cranberry,
           .pumpkin,
           .havaiiMix:
        return nil
      }
    }

    var description: String {
      rawValue + (emoji ?? "")
    }

    static func < (lhs: Dish.Ingredient, rhs: Dish.Ingredient) -> Bool {
      lhs.rawValue < rhs.rawValue
    }
  }

  enum Unit: String, Comparable, CustomStringConvertible {
    case p = "шт"

    var description: String { rawValue }

    static func < (lhs: Dish.Unit, rhs: Dish.Unit) -> Bool {
      lhs.rawValue < rhs.rawValue
    }
  }

  struct Value: Hashable, CustomStringConvertible, Comparable {
    let quantity: UInt
    let unit: Unit

    var description: String { "\(quantity) \(unit)" }

    static func < (lhs: Dish.Value, rhs: Dish.Value) -> Bool {
      guard lhs.unit == rhs.unit else {
        return false
      }
      return lhs.unit < rhs.unit
    }

    static let one = Self(quantity: 1, unit: .p)
  }

  struct Item: Hashable, CustomStringConvertible, Comparable {
    let ingredient: Ingredient
    let value: Value

    var description: String { "\(ingredient) (\(value))" }

    static func < (lhs: Dish.Item, rhs: Dish.Item) -> Bool {
      if lhs.ingredient < rhs.ingredient {
        return true
      }
      if lhs.ingredient > rhs.ingredient  {
        return false
      }
      return lhs.value < rhs.value
    }
  }

  let name: String
  let meals: Set<Meal>
  let kind: Kind?
  let items: Set<Item>

  init(name: String, meals: Set<Dish.Meal>, kind: Dish.Kind?, ingredients: Set<Dish.Ingredient>) {
    self.name = name
    self.meals = meals
    self.kind = kind
    self.items = Set(ingredients.map { Dish.Item(ingredient: $0, value: .one) })
  }

  var ingredients: Set<Ingredient> {
    Set(items.map { $0.ingredient })
  }

  var isVegetarian: Bool {
    ingredients.filter { !$0.isVegetarian }.isEmpty
  }

  var description: String {
    let ingredientsList = ingredients.map { "\($0)" }.joined(separator: ", ")
    return "\(name) (\(ingredientsList))"
  }
}

let favoritesDishes = [
  Dish(name: "рисовая каша", meals: [.breakfast], kind: .porridge, ingredients: [.rice, .coconutMilk]),
  Dish(name: "гречневая каша", meals: [.breakfast], kind: .porridge, ingredients: [.grecha, .coconutMilk]),
  Dish(name: "пшенная каша", meals: [.breakfast], kind: .porridge, ingredients: [.millet, .coconutMilk]),
  Dish(name: "сырники", meals: [.breakfast], kind: .none, ingredients: [.cottageCheese, .egg, .flour]),
  Dish(name: "гранола", meals: [.breakfast], kind: .none, ingredients: [.oatmeal, .nuts]),
  Dish(name: "английский завтрак", meals: [.breakfast], kind: .none, ingredients: [.egg, .bacon, .cannedBeans, .tomato]),
  Dish(name: "авокадо тост", meals: [.breakfast], kind: .none, ingredients: [.avocado, .egg, .bread, .salmon, .creamcheese]),
  Dish(name: "оладушки", meals: [.breakfast], kind: .none, ingredients: [.kefir, .flour, .vinegar]),
  Dish(name: "капрезе с соусом песто", meals: [.breakfast], kind: .none, ingredients: [.mozzarella, .lemon, .garlic, .green, .pesto]),

  Dish(name: "грибной суп", meals: [.dinner], kind: .soup, ingredients: [.milk, .mushrooms, .onion, .spud, .carrot]),
  Dish(name: "гороховый суп", meals: [.dinner], kind: .soup, ingredients: [.peas, .smockedRibs, .onion, .spud, .carrot]),
  Dish(name: "рыбный суп", meals: [.dinner], kind: .soup, ingredients: [.salmon, .onion, .spud, .carrot]),
  Dish(name: "куриный суп", meals: [.dinner], kind: .soup, ingredients: [.chicken, .pasta, .onion, .spud, .carrot]),
  Dish(name: "суп из индейки", meals: [.dinner], kind: .soup, ingredients: [.turkey, .squash, .dill, .onion, .spud, .carrot]),
  Dish(name: "овощной суп", meals: [.dinner], kind: .soup, ingredients: [.beans, .celery, .tomato, .onion, .spud, .carrot]),
  Dish(name: "греча с грибами", meals: [.dinner], kind: .main, ingredients: [.grecha, .mushrooms]),
  Dish(name: "боул с рисом", meals: [.dinner], kind: .main, ingredients: [.rice]),
  Dish(name: "мясо по-французски", meals: [.dinner], kind: .main, ingredients: [.pork, .carrot, .onion, .spud, .mayonnaise]),
  Dish(name: "мясо запечённое", meals: [.dinner], kind: .main, ingredients: [.pork]),
  Dish(name: "индейка в соевом соусе", meals: [.dinner], kind: .main, ingredients: [.turkey, .soy]),
  Dish(name: "картошка запечено-вареная", meals: [.dinner], kind: .main, ingredients: [.spud, .paprika]),
  Dish(name: "макароны с яйцом", meals: [.dinner], kind: .main, ingredients: [.pasta, .egg, .tomato]),
  Dish(name: "макароны с песто", meals: [.dinner], kind: .main, ingredients: [.pasta, .pesto]),
  Dish(name: "паста с кедровыми орехами", meals: [.dinner], kind: .main, ingredients: [.pasta, .pineNut, .pork, .garganzola, .cream]),
  Dish(name: "картошка запечено-вареная", meals: [.dinner], kind: .main, ingredients: [.spud, .paprika]),
  Dish(name: "шаверма", meals: [.dinner], kind: .main, ingredients: [.pita, .pork, .hummus, .redCabbage, .tomato, .cucumber, .pickles]),
  Dish(name: "запечённая клунька", meals: [.dinner], kind: .main, ingredients: [.chicken]),

  Dish(name: "салат с креветками", meals: [.supper], kind: .salad, ingredients: [.green, .shrimp, .tomato, .egg]),
  Dish(name: "кустодиевский салат", meals: [.supper], kind: .salad, ingredients: [.green, .cannedBeans, .sausage, .tomato, .rusk, .mayonnaise]),
  Dish(name: "пельмени", meals: [.supper], kind: .none, ingredients: [.pelmeni]),
  Dish(name: "гавайская смесь с яйцом", meals: [.supper], kind: .none, ingredients: [.havaiiMix, .egg]),
  Dish(name: "творог с зеленью", meals: [.supper], kind: .none, ingredients: [.cottageCheese, .cucumber, .dill]),
  Dish(name: "стейк", meals: [.supper], kind: .main, ingredients: [.stake]),
  Dish(name: "рыба в панировке", meals: [.supper], kind: .main, ingredients: [.salmon, .green, .rusk, .butter]),
  Dish(name: "свинина по-индонезийски", meals: [.supper], kind: .main, ingredients: [.pork, .flour, .ginger, .onion, .lemon, .soy]),
  Dish(name: "пеннони с овощами", meals: [.supper], kind: .none, ingredients: [.pasta, .squash, .sweetRedPepper, .eggplant, .garlic, .pesto]),
  Dish(name: "гратен из цветной капусты", meals: [.supper], kind: .main, ingredients: [.cauliflower, .cheese, .milk, .butter, .dijonMustard]),
  Dish(name: "лосось в пергаменте", meals: [.supper], kind: .main, ingredients: [.salmon, .spinach, .onion, .sourCream]),
  Dish(name: "оладьи из цукини", meals: [.supper], kind: .main, ingredients: [.squash, .pumpkin, .sweetRedPepper, .green, .flour]),
  Dish(name: "фунчоза с овщами", meals: [.supper], kind: .main, ingredients: [.carrot, .sweetRedPepper, .garlic, .soy, .green, .cucumber]),
  Dish(name: "куриные котлеты", meals: [.supper], kind: .main, ingredients: [.chicken, .squash, .garlic, .dill, .green, .celery, .cranberry]),
]

enum Weekday: Int, CaseIterable, CustomStringConvertible {
  case monday
  case tuesday
  case wednesday
  case thursday
  case friday
  case saturday
  case sunday

  static func day(before: Weekday) -> Weekday {
    if before == .monday { return .sunday }
    return Weekday(rawValue: before.rawValue - 1)!
  }

  static let weekend: [Weekday] = [.saturday, .sunday]

  var description: String {
    switch self {
    case .monday: return "Пн"
    case .tuesday: return "Вт"
    case .wednesday: return "Ср"
    case .thursday: return "Чт"
    case .friday: return "Пт"
    case .saturday: return "Сб"
    case .sunday: return "Вс"
    }
  }
}

enum DaylyMenu: CustomStringConvertible {
  struct Regular: CustomStringConvertible {
    let breakfast: Dish
    let dinner: Dish
    let supper: Dish

    var dishes: [Dish] {
      [breakfast, dinner, supper]
    }

    var description: String {
      dishes.map { " - \($0)" }.joined(separator: "\n")
    }

    var items: [Dish.Item] {
      dishes.map { Array($0.items) }.flatMap { $0 }
    }

    var ingredients: Set<Dish.Ingredient> {
      dishes.map { $0.ingredients }
        .reduce([]) { $0.union($1) }
    }

    func hasDish(of kind: Dish.Kind) -> Bool {
      dishes.contains { $0.kind == kind }
    }
  }

  case regular(Regular)
  case free

  var dishes: [Dish] {
    value?.dishes ?? []
  }

  var description: String {
    value?.description ?? "Свободный день (доедаем остатки)"
  }

  var value: Regular? {
    switch self {
    case let .regular(value):
      return value
    case .free:
      return nil
    }
  }

  var items: [Dish.Item] {
    value.map { Array($0.items) } ?? []
  }

  var ingredients: Set<Dish.Ingredient> {
    value?.ingredients ?? []
  }

  func hasDish(of kind: Dish.Kind) -> Bool {
    value?.hasDish(of: kind) ?? false
  }
}

struct WeeklyMenu: CustomStringConvertible {
  let monday: DaylyMenu
  let tuesday: DaylyMenu
  let wednesday: DaylyMenu
  let thursday: DaylyMenu
  let friday: DaylyMenu
  let saturday: DaylyMenu
  let sunday: DaylyMenu

  init?(dict: [Weekday: DaylyMenu]) {
    guard
      let monday = dict[.monday],
      let tuesday = dict[.tuesday],
      let wednesday = dict[.wednesday],
      let thursday = dict[.thursday],
      let friday = dict[.friday],
      let saturday = dict[.saturday],
      let sunday = dict[.sunday]
    else {
      return nil
    }

    self.monday = monday
    self.tuesday = tuesday
    self.wednesday = wednesday
    self.thursday = thursday
    self.friday = friday
    self.saturday = saturday
    self.sunday = sunday
  }

  var menus: [DaylyMenu] {
    [monday, tuesday, wednesday, thursday, friday, saturday, sunday]
  }

  var dishes: [Dish] {
    menus
      .map { $0.dishes }
      .flatMap { $0 }
  }

  var description: String {
    let ss: [[CustomStringConvertible]] = zip(
      Weekday.allCases,
      menus
    ).map { (weekday, daylyMenu) in [weekday, daylyMenu] }
    return ss.reduce([], +)
      .map { $0.description }
      .joined(separator: "\n")
  }

  var items: [Dish.Item] {
    menus.map { $0.items }.flatMap({ $0 })
  }

  var ingredients: Set<Dish.Ingredient> {
    menus
      .map { $0.ingredients }
      .reduce([]) { $0.union($1) }
  }
}

enum MenuGenerationError: Error {
  case notEnoughBreakfast
  case notEnoughDinner
  case notEnoughSupper
}

extension WeeklyMenu {
  //  1. Выводить суп на обед 2 дня подряд
  //  2. 1 день должен быть веганским
  //  3. Выводить cottageCheese, rice, egg, grecha, salmon, pork 1 раз в день
  //  4. Не повторять каши 2 дня подряд
  //  5. Суббота или воскресенье — свободный день
  //  6. Любое блюдо, кроме супа, не должно повторяться 2 раза в неделю

  static func make(
    dishes: [Dish],
    mondayDinner: Dish?,
    seed: UInt64?
  ) throws -> WeeklyMenu {
    let seed = seed ?? UInt64.random(in: UInt64.min...UInt64.max)
    print("Using seed: \(seed)")
    var generator = SeededGenerator(seed: seed)

    var menu = [Weekday: DaylyMenu]()
    let freeday = Weekday.weekend.randomElement(using: &generator)!
    let vegetarianday = Weekday.allCases
      .filter { ![Weekday.monday, freeday].contains($0) }.randomElement(using: &generator)!

    var usedDishes = Set<Dish>()
    try Weekday.allCases.forEach { today in
      let yesterday = Weekday.day(before: today)
      let dayBeforeYesterday = Weekday.day(before: yesterday)
      let yesterdayMenu = menu[yesterday]
      let dayBeforeYesterdayMenu = menu[dayBeforeYesterday]

      let yesterdayWasPorrige = yesterdayMenu?.hasDish(of: .porridge) ?? false
      let notUsedDishes = dishes.not(in: usedDishes)
      let availableDishes = yesterdayWasPorrige
        ? notUsedDishes.notPorridge
        : notUsedDishes

      let yesterdayWasSoup = yesterdayMenu?.hasDish(of: .soup) ?? false
      let dayBeforeYesterdayWasSoup = dayBeforeYesterdayMenu?.hasDish(of: .soup) ?? false

      let yesterdaySoup = (yesterdayWasSoup && !dayBeforeYesterdayWasSoup)
        ? yesterdayMenu?.value?.dinner : nil

      let option: DinnerOption
      if let mondayDinner = mondayDinner, today == .monday {
        option = .mondayDinner(mondayDinner)
      } else if let yesterdaySoup = yesterdaySoup {
        option = .yesterday(yesterdaySoup)
      } else {
        option = .fromScratch
      }

      let todayMenu: DaylyMenu
      if today == freeday {
        todayMenu = .free
      } else if today == vegetarianday {
        todayMenu = try availableDishes.vegetarian.makeRegularMenuForADay(
          option,
          generator: &generator
        )
      } else {
        todayMenu = try availableDishes.makeRegularMenuForADay(
          option,
          generator: &generator
        )
      }
      menu[today] = todayMenu
      usedDishes = usedDishes.union(todayMenu.dishes)
    }
    return WeeklyMenu(dict: menu)!
  }
}

enum DinnerOption {
  case yesterday(Dish)
  case mondayDinner(Dish)
  case fromScratch
}

extension Array where Element == Dish {
  var vegetarian: Self { filter { $0.isVegetarian } }
  var notPorridge: Self { filter { $0.kind == nil || $0.kind != .porridge } }
  func not(in used: Set<Dish>) -> Self { filter { !used.contains($0) } }

  func makeRegularMenuForADay(
    _ dinnerOption: DinnerOption,
    generator: inout SeededGenerator
  ) throws -> DaylyMenu {
    let onceADay: [Dish.Ingredient] = [.rice, .egg, .grecha, .salmon, .cottageCheese, .pork]
    let breakfasts = filter({ $0.meals.contains(.breakfast) })
    guard let breakfast = breakfasts
            .randomElement(using: &generator) else {
      throw MenuGenerationError.notEnoughBreakfast
    }
    let dinner: Dish
    switch dinnerOption {
    case let .yesterday(yesterday):
      dinner = yesterday
    case let .mondayDinner(mondayDinner):
      dinner = mondayDinner
    case .fromScratch:
      if let today = not(in: [breakfast])
          .filter({ $0.meals.contains(.dinner) })
          .filter({ $0.ingredients.isDisjoint(with: breakfast.ingredients.intersection(onceADay)) })
          .randomElement(using: &generator) {
        dinner = today
      } else {
        throw MenuGenerationError.notEnoughDinner
      }
    }
    let breakfastAndDinner = breakfast.ingredients.union(dinner.ingredients)
    guard let supper = not(in: [breakfast, dinner])
            .filter({ $0.meals.contains(.supper) })
            .filter({ $0.ingredients.isDisjoint(with: breakfastAndDinner.intersection(onceADay)) })
            .randomElement(using: &generator) else {
      throw MenuGenerationError.notEnoughSupper
    }

    return DaylyMenu.regular(.init(breakfast: breakfast, dinner: dinner, supper: supper))
  }
}

do {
  let bannedDishes = [
    "грибной суп",
    "кустодиевский салат",
    "пельмени",
    "гратен из цветной капусты",
    "гороховый суп",
    "свинина по-индонезийски",
    "салат с креветками",
    "запечённая клунька",
    "шаверма",
    "суп из индейки",
    "мясо запечённое",
    "мясо по-французски",
    "картошка запечено-вареная",
  ].map { name in favoritesDishes.first { $0.name == name }! }

  let menu = try WeeklyMenu.make(
    dishes: favoritesDishes.not(in: Set(bannedDishes)),
    mondayDinner: nil,
    seed: nil
  )
  print(menu)
  print("Все ингридиенты:")
  menu.items.sorted().compacted().forEach { print("\($0)") }
} catch {
  print("Ошибка: \(error).")
}


extension Array where Element == Dish.Item {
  func compacted() -> Self {
    var result = Self()
    forEach { curr in
      if let prev = result.last,
         prev.ingredient == curr.ingredient,
         prev.value.unit == curr.value.unit {
        result[result.index(before: result.endIndex)] = Dish.Item(
          ingredient: curr.ingredient,
          value: Dish.Value(
            quantity: prev.value.quantity + curr.value.quantity,
            unit: curr.value.unit
          )
        )
      } else {
        result.append(curr)
      }
    }
    return result
  }
}
