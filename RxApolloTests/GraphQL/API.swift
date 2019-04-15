//  This file was automatically generated and should not be edited.

import Apollo

/// The episodes in the Star Wars trilogy
public enum Episode: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Star Wars Episode IV: A New Hope, released in 1977.
  case newhope
  /// Star Wars Episode V: The Empire Strikes Back, released in 1980.
  case empire
  /// Star Wars Episode VI: Return of the Jedi, released in 1983.
  case jedi
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "NEWHOPE": self = .newhope
      case "EMPIRE": self = .empire
      case "JEDI": self = .jedi
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .newhope: return "NEWHOPE"
      case .empire: return "EMPIRE"
      case .jedi: return "JEDI"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Episode, rhs: Episode) -> Bool {
    switch (lhs, rhs) {
      case (.newhope, .newhope): return true
      case (.empire, .empire): return true
      case (.jedi, .jedi): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

/// The input object sent when someone is creating a new review
public struct ReviewInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(stars: Int, commentary: Swift.Optional<String?> = nil, favoriteColor: Swift.Optional<ColorInput?> = nil) {
    graphQLMap = ["stars": stars, "commentary": commentary, "favoriteColor": favoriteColor]
  }

  /// 0-5 stars
  public var stars: Int {
    get {
      return graphQLMap["stars"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "stars")
    }
  }

  /// Comment about the movie, optional
  public var commentary: Swift.Optional<String?> {
    get {
      return graphQLMap["commentary"] as! Swift.Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "commentary")
    }
  }

  /// Favorite color, optional
  public var favoriteColor: Swift.Optional<ColorInput?> {
    get {
      return graphQLMap["favoriteColor"] as! Swift.Optional<ColorInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "favoriteColor")
    }
  }
}

/// The input object sent when passing in a color
public struct ColorInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(red: Int, green: Int, blue: Int) {
    graphQLMap = ["red": red, "green": green, "blue": blue]
  }

  public var red: Int {
    get {
      return graphQLMap["red"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "red")
    }
  }

  public var green: Int {
    get {
      return graphQLMap["green"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "green")
    }
  }

  public var blue: Int {
    get {
      return graphQLMap["blue"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "blue")
    }
  }
}

public final class HeroAndFriendsNamesQuery: GraphQLQuery {
  public let operationDefinition =
    "query HeroAndFriendsNames($episode: Episode) {\n  hero(episode: $episode) {\n    __typename\n    name\n    friends {\n      __typename\n      name\n    }\n  }\n}"

  public var episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("hero", arguments: ["episode": GraphQLVariable("episode")], type: .object(Hero.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(hero: Hero? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "hero": hero.flatMap { (value: Hero) -> ResultMap in value.resultMap }])
    }

    public var hero: Hero? {
      get {
        return (resultMap["hero"] as? ResultMap).flatMap { Hero(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "hero")
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let possibleTypes = ["Human", "Droid"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("friends", type: .list(.object(Friend.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public static func makeHuman(name: String, friends: [Friend?]? = nil) -> Hero {
        return Hero(unsafeResultMap: ["__typename": "Human", "name": name, "friends": friends.flatMap { (value: [Friend?]) -> [ResultMap?] in value.map { (value: Friend?) -> ResultMap? in value.flatMap { (value: Friend) -> ResultMap in value.resultMap } } }])
      }

      public static func makeDroid(name: String, friends: [Friend?]? = nil) -> Hero {
        return Hero(unsafeResultMap: ["__typename": "Droid", "name": name, "friends": friends.flatMap { (value: [Friend?]) -> [ResultMap?] in value.map { (value: Friend?) -> ResultMap? in value.flatMap { (value: Friend) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The name of the character
      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// The friends of the character, or an empty list if they have none
      public var friends: [Friend?]? {
        get {
          return (resultMap["friends"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Friend?] in value.map { (value: ResultMap?) -> Friend? in value.flatMap { (value: ResultMap) -> Friend in Friend(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Friend?]) -> [ResultMap?] in value.map { (value: Friend?) -> ResultMap? in value.flatMap { (value: Friend) -> ResultMap in value.resultMap } } }, forKey: "friends")
        }
      }

      public struct Friend: GraphQLSelectionSet {
        public static let possibleTypes = ["Human", "Droid"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeHuman(name: String) -> Friend {
          return Friend(unsafeResultMap: ["__typename": "Human", "name": name])
        }

        public static func makeDroid(name: String) -> Friend {
          return Friend(unsafeResultMap: ["__typename": "Droid", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The name of the character
        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class HeroAndFriendsNamesWithIDsQuery: GraphQLQuery {
  public let operationDefinition =
    "query HeroAndFriendsNamesWithIDs($episode: Episode) {\n  hero(episode: $episode) {\n    __typename\n    id\n    name\n    friends {\n      __typename\n      id\n      name\n    }\n  }\n}"

  public var episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("hero", arguments: ["episode": GraphQLVariable("episode")], type: .object(Hero.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(hero: Hero? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "hero": hero.flatMap { (value: Hero) -> ResultMap in value.resultMap }])
    }

    public var hero: Hero? {
      get {
        return (resultMap["hero"] as? ResultMap).flatMap { Hero(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "hero")
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let possibleTypes = ["Human", "Droid"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("friends", type: .list(.object(Friend.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public static func makeHuman(id: GraphQLID, name: String, friends: [Friend?]? = nil) -> Hero {
        return Hero(unsafeResultMap: ["__typename": "Human", "id": id, "name": name, "friends": friends.flatMap { (value: [Friend?]) -> [ResultMap?] in value.map { (value: Friend?) -> ResultMap? in value.flatMap { (value: Friend) -> ResultMap in value.resultMap } } }])
      }

      public static func makeDroid(id: GraphQLID, name: String, friends: [Friend?]? = nil) -> Hero {
        return Hero(unsafeResultMap: ["__typename": "Droid", "id": id, "name": name, "friends": friends.flatMap { (value: [Friend?]) -> [ResultMap?] in value.map { (value: Friend?) -> ResultMap? in value.flatMap { (value: Friend) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The ID of the character
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The name of the character
      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// The friends of the character, or an empty list if they have none
      public var friends: [Friend?]? {
        get {
          return (resultMap["friends"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Friend?] in value.map { (value: ResultMap?) -> Friend? in value.flatMap { (value: ResultMap) -> Friend in Friend(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Friend?]) -> [ResultMap?] in value.map { (value: Friend?) -> ResultMap? in value.flatMap { (value: Friend) -> ResultMap in value.resultMap } } }, forKey: "friends")
        }
      }

      public struct Friend: GraphQLSelectionSet {
        public static let possibleTypes = ["Human", "Droid"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeHuman(id: GraphQLID, name: String) -> Friend {
          return Friend(unsafeResultMap: ["__typename": "Human", "id": id, "name": name])
        }

        public static func makeDroid(id: GraphQLID, name: String) -> Friend {
          return Friend(unsafeResultMap: ["__typename": "Droid", "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of the character
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The name of the character
        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class HeroAndFriendsNamesWithIdForParentOnlyQuery: GraphQLQuery {
  public let operationDefinition =
    "query HeroAndFriendsNamesWithIDForParentOnly($episode: Episode) {\n  hero(episode: $episode) {\n    __typename\n    id\n    name\n    friends {\n      __typename\n      name\n    }\n  }\n}"

  public var episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("hero", arguments: ["episode": GraphQLVariable("episode")], type: .object(Hero.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(hero: Hero? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "hero": hero.flatMap { (value: Hero) -> ResultMap in value.resultMap }])
    }

    public var hero: Hero? {
      get {
        return (resultMap["hero"] as? ResultMap).flatMap { Hero(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "hero")
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let possibleTypes = ["Human", "Droid"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("friends", type: .list(.object(Friend.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public static func makeHuman(id: GraphQLID, name: String, friends: [Friend?]? = nil) -> Hero {
        return Hero(unsafeResultMap: ["__typename": "Human", "id": id, "name": name, "friends": friends.flatMap { (value: [Friend?]) -> [ResultMap?] in value.map { (value: Friend?) -> ResultMap? in value.flatMap { (value: Friend) -> ResultMap in value.resultMap } } }])
      }

      public static func makeDroid(id: GraphQLID, name: String, friends: [Friend?]? = nil) -> Hero {
        return Hero(unsafeResultMap: ["__typename": "Droid", "id": id, "name": name, "friends": friends.flatMap { (value: [Friend?]) -> [ResultMap?] in value.map { (value: Friend?) -> ResultMap? in value.flatMap { (value: Friend) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The ID of the character
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The name of the character
      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// The friends of the character, or an empty list if they have none
      public var friends: [Friend?]? {
        get {
          return (resultMap["friends"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Friend?] in value.map { (value: ResultMap?) -> Friend? in value.flatMap { (value: ResultMap) -> Friend in Friend(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Friend?]) -> [ResultMap?] in value.map { (value: Friend?) -> ResultMap? in value.flatMap { (value: Friend) -> ResultMap in value.resultMap } } }, forKey: "friends")
        }
      }

      public struct Friend: GraphQLSelectionSet {
        public static let possibleTypes = ["Human", "Droid"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeHuman(name: String) -> Friend {
          return Friend(unsafeResultMap: ["__typename": "Human", "name": name])
        }

        public static func makeDroid(name: String) -> Friend {
          return Friend(unsafeResultMap: ["__typename": "Droid", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The name of the character
        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class HeroAndFriendsNamesWithFragmentQuery: GraphQLQuery {
  public let operationDefinition =
    "query HeroAndFriendsNamesWithFragment($episode: Episode) {\n  hero(episode: $episode) {\n    __typename\n    name\n    ...FriendsNames\n    friends {\n      __typename\n      name\n    }\n  }\n}"

  public var queryDocument: String { return operationDefinition.appending(FriendsNames.fragmentDefinition) }

  public var episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("hero", arguments: ["episode": GraphQLVariable("episode")], type: .object(Hero.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(hero: Hero? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "hero": hero.flatMap { (value: Hero) -> ResultMap in value.resultMap }])
    }

    public var hero: Hero? {
      get {
        return (resultMap["hero"] as? ResultMap).flatMap { Hero(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "hero")
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let possibleTypes = ["Human", "Droid"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(FriendsNames.self),
        GraphQLField("friends", type: .list(.object(Friend.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The name of the character
      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// The friends of the character, or an empty list if they have none
      public var friends: [Friend?]? {
        get {
          return (resultMap["friends"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Friend?] in value.map { (value: ResultMap?) -> Friend? in value.flatMap { (value: ResultMap) -> Friend in Friend(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Friend?]) -> [ResultMap?] in value.map { (value: Friend?) -> ResultMap? in value.flatMap { (value: Friend) -> ResultMap in value.resultMap } } }, forKey: "friends")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var friendsNames: FriendsNames {
          get {
            return FriendsNames(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct Friend: GraphQLSelectionSet {
        public static let possibleTypes = ["Human", "Droid"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeHuman(name: String) -> Friend {
          return Friend(unsafeResultMap: ["__typename": "Human", "name": name])
        }

        public static func makeDroid(name: String) -> Friend {
          return Friend(unsafeResultMap: ["__typename": "Droid", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The name of the character
        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class HeroNameQuery: GraphQLQuery {
  public let operationDefinition =
    "query HeroName($episode: Episode) {\n  hero(episode: $episode) {\n    __typename\n    name\n  }\n}"

  public var episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("hero", arguments: ["episode": GraphQLVariable("episode")], type: .object(Hero.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(hero: Hero? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "hero": hero.flatMap { (value: Hero) -> ResultMap in value.resultMap }])
    }

    public var hero: Hero? {
      get {
        return (resultMap["hero"] as? ResultMap).flatMap { Hero(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "hero")
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let possibleTypes = ["Human", "Droid"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public static func makeHuman(name: String) -> Hero {
        return Hero(unsafeResultMap: ["__typename": "Human", "name": name])
      }

      public static func makeDroid(name: String) -> Hero {
        return Hero(unsafeResultMap: ["__typename": "Droid", "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The name of the character
      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class HeroNameWithIdQuery: GraphQLQuery {
  public let operationDefinition =
    "query HeroNameWithID($episode: Episode) {\n  hero(episode: $episode) {\n    __typename\n    id\n    name\n  }\n}"

  public var episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("hero", arguments: ["episode": GraphQLVariable("episode")], type: .object(Hero.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(hero: Hero? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "hero": hero.flatMap { (value: Hero) -> ResultMap in value.resultMap }])
    }

    public var hero: Hero? {
      get {
        return (resultMap["hero"] as? ResultMap).flatMap { Hero(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "hero")
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let possibleTypes = ["Human", "Droid"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public static func makeHuman(id: GraphQLID, name: String) -> Hero {
        return Hero(unsafeResultMap: ["__typename": "Human", "id": id, "name": name])
      }

      public static func makeDroid(id: GraphQLID, name: String) -> Hero {
        return Hero(unsafeResultMap: ["__typename": "Droid", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The ID of the character
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The name of the character
      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class HeroNameWithFragmentQuery: GraphQLQuery {
  public let operationDefinition =
    "query HeroNameWithFragment($episode: Episode) {\n  hero(episode: $episode) {\n    __typename\n    ...HeroName\n  }\n}"

  public var queryDocument: String { return operationDefinition.appending(HeroName.fragmentDefinition) }

  public var episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("hero", arguments: ["episode": GraphQLVariable("episode")], type: .object(Hero.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(hero: Hero? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "hero": hero.flatMap { (value: Hero) -> ResultMap in value.resultMap }])
    }

    public var hero: Hero? {
      get {
        return (resultMap["hero"] as? ResultMap).flatMap { Hero(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "hero")
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let possibleTypes = ["Human", "Droid"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(HeroName.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public static func makeHuman(name: String) -> Hero {
        return Hero(unsafeResultMap: ["__typename": "Human", "name": name])
      }

      public static func makeDroid(name: String) -> Hero {
        return Hero(unsafeResultMap: ["__typename": "Droid", "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var heroName: HeroName {
          get {
            return HeroName(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class CreateReviewForEpisodeMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation CreateReviewForEpisode($episode: Episode!, $review: ReviewInput!) {\n  createReview(episode: $episode, review: $review) {\n    __typename\n    stars\n    commentary\n  }\n}"

  public var episode: Episode
  public var review: ReviewInput

  public init(episode: Episode, review: ReviewInput) {
    self.episode = episode
    self.review = review
  }

  public var variables: GraphQLMap? {
    return ["episode": episode, "review": review]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createReview", arguments: ["episode": GraphQLVariable("episode"), "review": GraphQLVariable("review")], type: .object(CreateReview.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createReview: CreateReview? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createReview": createReview.flatMap { (value: CreateReview) -> ResultMap in value.resultMap }])
    }

    public var createReview: CreateReview? {
      get {
        return (resultMap["createReview"] as? ResultMap).flatMap { CreateReview(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createReview")
      }
    }

    public struct CreateReview: GraphQLSelectionSet {
      public static let possibleTypes = ["Review"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("stars", type: .nonNull(.scalar(Int.self))),
        GraphQLField("commentary", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(stars: Int, commentary: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Review", "stars": stars, "commentary": commentary])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The number of stars this review gave, 1-5
      public var stars: Int {
        get {
          return resultMap["stars"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "stars")
        }
      }

      /// Comment about the movie
      public var commentary: String? {
        get {
          return resultMap["commentary"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "commentary")
        }
      }
    }
  }
}

public final class CreateAwesomeReviewMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation CreateAwesomeReview {\n  createReview(episode: JEDI, review: {stars: 10, commentary: \"This is awesome!\"}) {\n    __typename\n    stars\n    commentary\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createReview", arguments: ["episode": "JEDI", "review": ["stars": 10, "commentary": "This is awesome!"]], type: .object(CreateReview.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createReview: CreateReview? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createReview": createReview.flatMap { (value: CreateReview) -> ResultMap in value.resultMap }])
    }

    public var createReview: CreateReview? {
      get {
        return (resultMap["createReview"] as? ResultMap).flatMap { CreateReview(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createReview")
      }
    }

    public struct CreateReview: GraphQLSelectionSet {
      public static let possibleTypes = ["Review"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("stars", type: .nonNull(.scalar(Int.self))),
        GraphQLField("commentary", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(stars: Int, commentary: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Review", "stars": stars, "commentary": commentary])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The number of stars this review gave, 1-5
      public var stars: Int {
        get {
          return resultMap["stars"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "stars")
        }
      }

      /// Comment about the movie
      public var commentary: String? {
        get {
          return resultMap["commentary"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "commentary")
        }
      }
    }
  }
}

public struct FriendsNames: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment FriendsNames on Character {\n  __typename\n  friends {\n    __typename\n    name\n  }\n}"

  public static let possibleTypes = ["Human", "Droid"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("friends", type: .list(.object(Friend.selections))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public static func makeHuman(friends: [Friend?]? = nil) -> FriendsNames {
    return FriendsNames(unsafeResultMap: ["__typename": "Human", "friends": friends.flatMap { (value: [Friend?]) -> [ResultMap?] in value.map { (value: Friend?) -> ResultMap? in value.flatMap { (value: Friend) -> ResultMap in value.resultMap } } }])
  }

  public static func makeDroid(friends: [Friend?]? = nil) -> FriendsNames {
    return FriendsNames(unsafeResultMap: ["__typename": "Droid", "friends": friends.flatMap { (value: [Friend?]) -> [ResultMap?] in value.map { (value: Friend?) -> ResultMap? in value.flatMap { (value: Friend) -> ResultMap in value.resultMap } } }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The friends of the character, or an empty list if they have none
  public var friends: [Friend?]? {
    get {
      return (resultMap["friends"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Friend?] in value.map { (value: ResultMap?) -> Friend? in value.flatMap { (value: ResultMap) -> Friend in Friend(unsafeResultMap: value) } } }
    }
    set {
      resultMap.updateValue(newValue.flatMap { (value: [Friend?]) -> [ResultMap?] in value.map { (value: Friend?) -> ResultMap? in value.flatMap { (value: Friend) -> ResultMap in value.resultMap } } }, forKey: "friends")
    }
  }

  public struct Friend: GraphQLSelectionSet {
    public static let possibleTypes = ["Human", "Droid"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public static func makeHuman(name: String) -> Friend {
      return Friend(unsafeResultMap: ["__typename": "Human", "name": name])
    }

    public static func makeDroid(name: String) -> Friend {
      return Friend(unsafeResultMap: ["__typename": "Droid", "name": name])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The name of the character
    public var name: String {
      get {
        return resultMap["name"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }
  }
}

public struct HeroName: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment HeroName on Character {\n  __typename\n  name\n}"

  public static let possibleTypes = ["Human", "Droid"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public static func makeHuman(name: String) -> HeroName {
    return HeroName(unsafeResultMap: ["__typename": "Human", "name": name])
  }

  public static func makeDroid(name: String) -> HeroName {
    return HeroName(unsafeResultMap: ["__typename": "Droid", "name": name])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The name of the character
  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }
}