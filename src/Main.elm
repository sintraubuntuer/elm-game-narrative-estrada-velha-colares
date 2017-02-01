port module Main exposing (..)

import Engine exposing (..)
import Manifest exposing (..)
import Rules exposing (rulesData)
import Html exposing (..)
import Theme.TitlePage
import Theme.Layout
import ClientTypes exposing (..)
import Dict exposing (Dict)


type alias Model =
    { engineModel : Engine.Model
    , route : Route
    , loaded : Bool
    , storyLine : List StorySnippet
    }


main : Program Never Model ClientTypes.Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


stripAttributes : List ( Id, Attributes ) -> List Id
stripAttributes =
    List.map Tuple.first


pluckRules : Engine.Rules
pluckRules =
    let
        foldFn :
            RuleData Engine.Rule
            -> ( Int, Dict String Engine.Rule )
            -> ( Int, Dict String Engine.Rule )
        foldFn { interaction, conditions, changes } ( id, rules ) =
            ( id + 1
            , Dict.insert ((++) "rule" <| toString <| id + 1)
                { interaction = interaction
                , conditions = conditions
                , changes = changes
                }
                rules
            )
    in
        Tuple.second <| List.foldl foldFn ( 1, Dict.empty ) rulesData


pluckContent : Dict String Narrative
pluckContent =
    let
        foldFn :
            RuleData Engine.Rule
            -> ( Int, Dict String Narrative )
            -> ( Int, Dict String Narrative )
        foldFn { narrative } ( id, narratives ) =
            ( id + 1
            , Dict.insert ((++) "rule" <| toString <| id + 1)
                narrative
                narratives
            )
    in
        Tuple.second <| List.foldl foldFn ( 1, Dict.empty ) rulesData


init : ( Model, Cmd ClientTypes.Msg )
init =
    ( { engineModel =
            Engine.init
                { manifest =
                    { items = stripAttributes items
                    , locations = stripAttributes locations
                    , characters = stripAttributes characters
                    }
                , rules = (pluckRules)
                , startingScene = "learnOfMystery"
                , startingLocation = "Home"
                , setup =
                    [ moveItemToLocation "Umbrella" "Home"
                    , moveItemToLocationFixed "VegatableGarden" "Garden"
                    , addLocation "Home"
                    , addLocation "Garden"
                    , moveCharacterToLocation "Harry" "Garden"
                    , moveItemToLocation "Pint" "Pub"
                    ]
                }
      , route = TitlePage
      , loaded = False
      , storyLine =
            [ { interactableName = "Begin"
              , interactableCssSelector = ""
              , narrative = "Ahh, a brand new day.  I wonder what I will get up to.  There's no telling who I will meet, what I will find, where I will go..."
              }
            ]
      }
    , Cmd.none
    )


update :
    ClientTypes.Msg
    -> Model
    -> ( Model, Cmd ClientTypes.Msg )
update msg model =
    case msg of
        Interact interactableId ->
            let
                ( newEngineModel, maybeMatchedRuleId ) =
                    Engine.update interactableId model.engineModel

                narrative =
                    { interactableName = getAttributes interactableId |> .name
                    , interactableCssSelector = getAttributes interactableId |> .cssSelector
                    , narrative =
                        getNarrative maybeMatchedRuleId
                            |> Maybe.withDefault (getAttributes interactableId |> .description)
                    }
            in
                ( { model
                    | engineModel = newEngineModel
                    , storyLine = narrative :: model.storyLine
                  }
                , Cmd.none
                )

        StartGame ->
            ( { model | route = GamePage }
            , Cmd.none
            )

        Loaded ->
            ( { model | loaded = True }
            , Cmd.none
            )


port loaded : (Bool -> msg) -> Sub msg


subscriptions : Model -> Sub ClientTypes.Msg
subscriptions model =
    loaded <| always Loaded


getNarrative : Maybe String -> Maybe String
getNarrative ruleId =
    ruleId
        |> Maybe.andThen (flip Dict.get pluckContent)
        |> Maybe.andThen List.head


getAttributes : Id -> Attributes
getAttributes id =
    let
        interactables =
            Dict.fromList (items ++ locations ++ characters)
    in
        case Dict.get id interactables of
            Nothing ->
                Debug.crash <| "Cannot find an interactable for id " ++ id

            Just attrs ->
                attrs


view :
    Model
    -> Html ClientTypes.Msg
view model =
    case model.route of
        TitlePage ->
            Theme.TitlePage.view StartGame model.loaded

        GamePage ->
            let
                idAndAttrs : Id -> ( Id, Attributes )
                idAndAttrs id =
                    ( id, getAttributes id )

                displayState =
                    { currentLocation =
                        Engine.getCurrentLocation model.engineModel
                            |> idAndAttrs
                    , itemsInCurrentLocation =
                        Engine.getItemsInCurrentLocation model.engineModel
                            |> List.map idAndAttrs
                    , charactersInCurrentLocation =
                        Engine.getCharactersInCurrentLocation model.engineModel
                            |> List.map idAndAttrs
                    , locations =
                        Engine.getLocations model.engineModel
                            |> List.map idAndAttrs
                    , itemsInInventory =
                        Engine.getItemsInInventory model.engineModel
                            |> List.map idAndAttrs
                    , ending =
                        Engine.getEnding model.engineModel
                    , storyLine =
                        model.storyLine
                    }
            in
                Theme.Layout.view displayState
