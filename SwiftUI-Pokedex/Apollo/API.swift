// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class PokemonResultsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query PokemonResults($limit: Int) {
      results: pokemon_v2_pokemon(limit: $limit) {
        __typename
        id
        name
        types: pokemon_v2_pokemontypes {
          __typename
          type: pokemon_v2_type {
            __typename
            name
          }
        }
      }
    }
    """

  public let operationName: String = "PokemonResults"

  public var limit: Int?

  public init(limit: Int? = nil) {
    self.limit = limit
  }

  public var variables: GraphQLMap? {
    return ["limit": limit]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("pokemon_v2_pokemon", alias: "results", arguments: ["limit": GraphQLVariable("limit")], type: .nonNull(.list(.nonNull(.object(Result.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(results: [Result]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "results": results.map { (value: Result) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "pokemon_v2_pokemon"
    public var results: [Result] {
      get {
        return (resultMap["results"] as! [ResultMap]).map { (value: ResultMap) -> Result in Result(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Result) -> ResultMap in value.resultMap }, forKey: "results")
      }
    }

    public struct Result: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["pokemon_v2_pokemon"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("pokemon_v2_pokemontypes", alias: "types", type: .nonNull(.list(.nonNull(.object(`Type`.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, name: String, types: [`Type`]) {
        self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemon", "id": id, "name": name, "types": types.map { (value: `Type`) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// An array relationship
      public var types: [`Type`] {
        get {
          return (resultMap["types"] as! [ResultMap]).map { (value: ResultMap) -> `Type` in `Type`(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: `Type`) -> ResultMap in value.resultMap }, forKey: "types")
        }
      }

      public struct `Type`: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemontype"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pokemon_v2_type", alias: "type", type: .object(`Type`.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(type: `Type`? = nil) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemontype", "type": type.flatMap { (value: `Type`) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var type: `Type`? {
          get {
            return (resultMap["type"] as? ResultMap).flatMap { `Type`(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "type")
          }
        }

        public struct `Type`: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_type"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_type", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

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
}
