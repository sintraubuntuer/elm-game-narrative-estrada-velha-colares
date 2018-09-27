module OurStory.Rules exposing (rule, ruleWithAudioContent, ruleWithQuasiChange, rules, startingState)

--import Audio

import ClientTypes exposing (AudioFileInfo)
import Components exposing (..)
import Dict exposing (Dict)
import Engine exposing (..)
import InfoForBkendApiRequests exposing (backendAnswerCheckerUrl)
import OurStory.Narrative as Narrative



--import Types exposing (..)


{-| This specifies the initial story world model. At a minimum, you need to set a starting location with the `moveTo` command. You may also want to place various items and characters in different locations. You can also specify a starting scene if required.
-}
startingState : List Engine.ChangeWorldCommand
startingState =
    [ moveTo "largoDrCarlosFranca"
    , moveItemToLocation "gps" "largoDrCarlosFranca"
    , moveItemToLocationFixed "questionAtVillaRoma" "villaRoma"
    , moveItemToLocationFixed "questionAtSeteaisAboutVillaRoma" "palacioSeteais"
    , moveItemToLocationFixed "questionAtFonteMataAlva" "fonteDeMataAlva"
    , makeItemWritable "questionAtFonteMataAlva"
    , moveItemToLocationFixed "questionSaoMartinhoColares1" "limiteSaoMartinhoColares"
    , makeItemWritable "questionSaoMartinhoColares1"
    , moveItemToLocationFixed "questionSaoMartinhoColares2" "limiteSaoMartinhoColares"
    , makeItemWritable "questionSaoMartinhoColares2"
    , makeItemWritable "questionColares"
    , moveCharacterToLocation "playerOne" "largoDrCarlosFranca"
    , moveCharacterToLocation "sintraWiseMan" "largoDrCarlosFranca"
    , moveCharacterToLocation "turistsBarbosaduBocage" "ruaBarbosaDoBocageInicio"
    , moveCharacterToLocation "catOne" "ruaTrindadeCoelho"
    , moveCharacterToLocation "turistOne" "palacioSeteais"
    , moveCharacterToLocation "photographer" "desvioQuintaSequoias"
    , moveCharacterToLocation "totemShaper" "quintinhaMonserrate"
    , moveCharacterToLocation "severalAnimals" "quintinhaMonserrate"
    , moveCharacterToLocation "turistTwo" "parquePalacioMonserrate"
    , moveCharacterToLocation "turistThree" "parquePalacioMonserrate"
    , moveCharacterToLocation "geocacher" "eugaria"
    , moveCharacterToLocation "wiseManColares" "colares"
    , moveItemToLocationFixed "sinalCuidadoComOGato" "ruaTrindadeCoelho"
    , moveItemToLocationFixed "totem" "quintinhaMonserrate"
    , moveItemToLocationFixed "byronsPoem" "parquePalacioMonserrate"
    , moveItemToLocationFixed "infoPanelMonserrate" "parquePalacioMonserrate"
    , moveItemToLocationFixed "creditsInfo" "colares"
    , moveItemToLocation "waterContainer" "fonteDeMataAlva"
    , createCounterIfNotExists "nrTimesTalkTo" "sintraWiseMan"
    , createAttributeIfNotExists (abool False) "gameHasEnded" "gameStateItem"
    , createCounterIfNotExists "nrPhotographiesCreated" "pinholeCamera"
    , createCounterIfNotExists "nrPhotographiesCreatedInSintra1914" "pinholeCamera"
    , createCounterIfNotExists "nrPhotographiesCreatedInQuintaVinagre" "pinholeCamera"
    , createCounterIfNotExists "nrTimesTalkTo" "totemShaper"
    , createCounterIfNotExists "nrInteractionsWiseManAfterOffers" "wiseManColares"
    ]
        ++ [ createAmultiChoice (Dict.fromList [ ( "pt", [ ( "General Carlos Roma du Bocage", "A" ), ( "Carlos Morato Roma", "B" ) ] ), ( "en", [ ( "General Carlos Roma du Bocage", "A" ), ( "Carlos Morato Roma", "B" ) ] ) ]) "questionAtVillaRoma"
           , createAmultiChoice (Dict.fromList [ ( "pt", [ ( "Dr. José Vicente Barbosa du Bocage", "A" ), ( "Manuel Maria Barbosa du Bocage", "B" ) ] ), ( "en", [ ( "Dr. José Vicente Barbosa du Bocage", "A" ), ( "Manuel Maria Barbosa du Bocage", "B" ) ] ) ]) "questionAtSeteaisAboutVillaRoma"
           ]


{-| A simple helper for making rules, since I want all of my rules to include RuleData and Narrative components.
-}
rule : String -> Engine.Rule_ -> Dict String (List String) -> Entity
rule id ruleData narratives =
    entity id
        |> addRuleData (completeTheRule ruleData)
        |> addLanguageNarratives narratives


ruleWithQuasiChange : String -> Engine.Rule -> Dict String (List String) -> Entity
ruleWithQuasiChange id ruleData narratives =
    entity id
        |> addRuleData ruleData
        |> addLanguageNarratives narratives


ruleWithAudioContent : String -> Engine.Rule_ -> Dict String (List String) -> Dict String ClientTypes.AudioFileInfo -> Entity
ruleWithAudioContent id ruleData narratives audiodict =
    rule id ruleData narratives
        |> addAllLanguagesAudio audiodict


{-| All of the rules that govern your story. The first parameter to `rule` is an id for that rule. It must be unique, but generally isn't used directly anywhere else (though it gets returned from `Engine.update`, so you could do some special behavior if a specific rule matches). I like to write a short summary of what the rule is for as the id to help me easily identify them.
Also, order does not matter, but I like to organize the rules by the story objects they are triggered by. This makes it easier to ensure I have set up the correct criteria so the right rule will match at the right time.
Note that the ids used in the rules must match the ids set in `Manifest.elm`.
-}
rules : Dict String Components
rules =
    Dict.fromList <|
        []
            ++ [ rule "interacting with playerOne"
                    { interaction = with "playerOne"
                    , conditions =
                        []
                    , changes =
                        []
                    }
                    Narrative.interactingWithPlayerOneDict
               ]
            ++ -- largo Carlos Franca
               [ rule "voltar ao largo Carlos Franca"
                    { interaction = with "largoDrCarlosFranca"
                    , conditions =
                        [ currentLocationIsNot "largoDrCarlosFranca"
                        ]
                    , changes =
                        [ moveTo "largoDrCarlosFranca"
                        , moveCharacterToLocation "playerOne" "largoDrCarlosFranca"
                        ]
                    }
                    Narrative.returningToLargoCarlosFrancaDict
               ]
            ++ -- residente de sintra
               [ rule "talking to the sintraWiseMan after 3 interactions Notas sabias appear"
                    { interaction = with "sintraWiseMan"
                    , conditions =
                        [ currentLocationIs "largoDrCarlosFranca"
                        , characterIsInLocation "sintraWiseMan" "largoDrCarlosFranca"
                        , characterIsInLocation "playerOne" "largoDrCarlosFranca"
                        , counterGreaterThenOrEqualTo 3 "nrTimesTalkTo" "sintraWiseMan"
                        , itemIsOffScreen "notasSabias"
                        ]
                    , changes =
                        [ moveItemToLocation "notasSabias" "largoDrCarlosFranca"
                        , increaseCounter "nrTimesTalkTo" "sintraWiseMan"
                        ]
                    }
                    Narrative.helpfulNotesAppearDict
               , rule "talking to the sintraWiseMan in the largoDrCarlosFranca"
                    { interaction = with "sintraWiseMan"
                    , conditions =
                        [ currentLocationIs "largoDrCarlosFranca"
                        , characterIsInLocation "sintraWiseMan" "largoDrCarlosFranca"

                        --, itemIsNotInCharacterInventory "playerOne" "notasSabias"
                        ]
                    , changes =
                        [ --moveItemToLocation  "notasSabias" "largoDrCarlosFranca"
                          increaseCounter "nrTimesTalkTo" "sintraWiseMan"
                        ]
                    }
                    Narrative.talkToSintraWiseManDict
               ]
            ++ -- ruaBarbosaDoBocageInicio
               [ rule "leaving largoDrCarlosFranca without gps"
                    { interaction = with "ruaBarbosaDoBocageInicio"
                    , conditions =
                        [ currentLocationIs "largoDrCarlosFranca"
                        , itemIsNotInCharacterInventory "playerOne" "gps"
                        ]
                    , changes =
                        []
                    }
                    Narrative.leavingWithoutGpsDict
               , rule "leaving largoDrCarlosFranca without interacting Sabio"
                    { interaction = with "ruaBarbosaDoBocageInicio"
                    , conditions =
                        [ currentLocationIs "largoDrCarlosFranca"
                        , hasNotPreviouslyInteractedWith "sintraWiseMan"
                        ]
                    , changes =
                        []
                    }
                    Narrative.leavingWithoutInteractingSabioSintraDict
               , rule "leaving the largoDrCarlosFranca"
                    { interaction = with "ruaBarbosaDoBocageInicio"
                    , conditions =
                        [ currentLocationIs "largoDrCarlosFranca"
                        , itemIsInCharacterInventory "playerOne" "gps"
                        , hasPreviouslyInteractedWith "sintraWiseMan"

                        --, itemIsInCharacterInventory "playerOne" "basket"
                        ]
                    , changes =
                        [ moveTo "ruaBarbosaDoBocageInicio"
                        , moveCharacterToLocation "playerOne" "ruaBarbosaDoBocageInicio"
                        ]
                    }
                    Narrative.leavingLargoCarlosFrancaDict
               , rule "going from villaRoma to ruaBarbosaDoBocageInicio"
                    { interaction = with "ruaBarbosaDoBocageInicio"
                    , conditions =
                        [ currentLocationIs "villaRoma"
                        ]
                    , changes =
                        [ moveTo "ruaBarbosaDoBocageInicio"
                        , moveCharacterToLocation "playerOne" "ruaBarbosaDoBocageInicio"
                        ]
                    }
                    Narrative.returningToRuaBarbosaDoBocageInicioDict
               ]
            ++ -- Villa Roma
               [ rule "entering villaRoma from ruaBarbosaDoBocageInicio"
                    { interaction = with "villaRoma"
                    , conditions =
                        [ currentLocationIs "ruaBarbosaDoBocageInicio"
                        , characterIsInLocation "playerOne" "ruaBarbosaDoBocageInicio"
                        ]
                    , changes =
                        [ moveTo "villaRoma"
                        , moveCharacterToLocation "playerOne" "villaRoma"
                        ]
                    }
                    Narrative.enteringVillaRomaDict
               , rule "entering villaRoma from RuaTrindadeCoelho"
                    { interaction = with "villaRoma"
                    , conditions =
                        [ currentLocationIs "ruaTrindadeCoelho"
                        , characterIsInLocation "playerOne" "ruaTrindadeCoelho"
                        ]
                    , changes =
                        [ moveTo "villaRoma"
                        , moveCharacterToLocation "playerOne" "villaRoma"
                        ]
                    }
                    Narrative.enteringVillaRomaDict
               , rule "entering villaRoma from Seteais"
                    { interaction = with "villaRoma"
                    , conditions =
                        [ currentLocationIs "palacioSeteais"
                        , characterIsInLocation "playerOne" "palacioSeteais"
                        ]
                    , changes =
                        [ moveTo "villaRoma"
                        , moveCharacterToLocation "playerOne" "villaRoma"
                        ]
                    }
                    Narrative.enteringVillaRomaDict
               , ruleWithQuasiChange "view questionAtVillaRoma"
                    { interaction = with "questionAtVillaRoma"
                    , conditions =
                        [ characterIsInLocation "playerOne" "villaRoma"
                        , itemIsInLocation "questionAtVillaRoma" "villaRoma"
                        ]
                    , changes = []
                    , quasiChanges =
                        [ simpleCheck_IfAnswerCorrect
                            (listOfAnswersAndFunctions [ "Carlos Morato Roma" ] [])
                            Nothing
                            "questionAtVillaRoma"
                        ]
                    , quasiChangeWithBkend = noQuasiChangeWithBackend
                    }
                    Narrative.viewQuestionAtVillaRomaDict
               ]
            ++ -- RuaTrindadeCoelho
               [ rule "entering ruaTrindadeCoelho"
                    { interaction = with "ruaTrindadeCoelho"
                    , conditions =
                        [ currentLocationIs "villaRoma"
                        , characterIsInLocation "playerOne" "villaRoma"
                        ]
                    , changes =
                        [ moveTo "ruaTrindadeCoelho"
                        , moveCharacterToLocation "playerOne" "ruaTrindadeCoelho"
                        ]
                    }
                    Narrative.enteringRuaTrindadeCoelhoDict
               ]
            ++ -- cat at RuaTrindadeCoelho
               [ rule "playing with cat at ruaTrindadeCoelho"
                    { interaction = with "catOne"
                    , conditions =
                        [ currentLocationIs "ruaTrindadeCoelho"
                        , characterIsInLocation "catOne" "ruaTrindadeCoelho"
                        , itemIsInCharacterInventory "playerOne" "gps"
                        ]
                    , changes =
                        [ moveItemToLocation "gps" "largoDrCarlosFranca"
                        , moveCharacterOffScreen "catOne"
                        , moveTo "largoDrCarlosFranca"
                        , moveCharacterToLocation "playerOne" "largoDrCarlosFranca"
                        ]
                    }
                    Narrative.playWithCatAtRuaTrindadeCoelhoDict
               ]
            ++ -- Palacio Seteais
               [ rule "entering palacioSeteais without Correct answer at VillaRoma"
                    { interaction = with "palacioSeteais"
                    , conditions =
                        [ currentLocationIs "villaRoma"
                        , characterIsInLocation "playerOne" "villaRoma"
                        , itemIsNotCorrectlyAnswered "questionAtVillaRoma"
                        ]
                    , changes =
                        []
                    }
                    Narrative.warnNeedVillaRomaQuestionCorrectlyAnsweredDict
               , rule "entering palacioSeteais"
                    { interaction = with "palacioSeteais"
                    , conditions =
                        [ currentLocationIs "villaRoma"
                        , characterIsInLocation "playerOne" "villaRoma"
                        , itemIsCorrectlyAnswered "questionAtVillaRoma"
                        ]
                    , changes =
                        [ moveTo "palacioSeteais"
                        , moveCharacterToLocation "playerOne" "palacioSeteais"
                        ]
                    }
                    Narrative.enteringPalacioSeteaisDict
               , ruleWithQuasiChange "view questionAtSeteaisAboutVillaRoma"
                    { interaction = with "questionAtSeteaisAboutVillaRoma"
                    , conditions =
                        [ characterIsInLocation "playerOne" "palacioSeteais"
                        , itemIsInLocation "questionAtSeteaisAboutVillaRoma" "palacioSeteais"
                        ]
                    , changes = []
                    , quasiChanges =
                        [ simpleCheck_IfAnswerCorrect
                            (listOfAnswersAndFunctions [ "Dr. José Vicente Barbosa du Bocage" ] [])
                            Nothing
                            "questionAtSeteaisAboutVillaRoma"
                        ]
                    , quasiChangeWithBkend = noQuasiChangeWithBackend
                    }
                    Narrative.viewQuestionAtSeteaisAboutVillaRomaDict
               , rule "entering palacioSeteais from PenhaVerde"
                    { interaction = with "palacioSeteais"
                    , conditions =
                        [ currentLocationIs "quintaPenhaVerde"
                        , characterIsInLocation "playerOne" "quintaPenhaVerde"
                        ]
                    , changes =
                        [ moveTo "palacioSeteais"
                        , moveCharacterToLocation "playerOne" "palacioSeteais"
                        ]
                    }
                    Narrative.enteringPalacioSeteaisFromPenhaVerdeDict

               -- interaction with turist One
               , rule "talk To turist at palacioSeteais"
                    { interaction = with "turistOne"
                    , conditions =
                        [ currentLocationIs "palacioSeteais"
                        , characterIsInLocation "playerOne" "palacioSeteais"
                        , characterIsInLocation "turistOne" "palacioSeteais"
                        ]
                    , changes =
                        []
                    }
                    Narrative.talkToTuristAtPalacioSeteaisDict
               ]
            ++ -- Quinta da Penha Verde
               [ rule "entering quintaPenhaVerde without Correct answerT at VillaRoma"
                    { interaction = with "quintaPenhaVerde"
                    , conditions =
                        [ currentLocationIs "palacioSeteais"
                        , characterIsInLocation "playerOne" "palacioSeteais"
                        , itemIsNotCorrectlyAnswered "questionAtSeteaisAboutVillaRoma"
                        ]
                    , changes =
                        []
                    }
                    Narrative.warnNeedSeteaisVillaRomaQuestionCorrectlyAnsweredDict
               , rule "entering quintaPenhaVerde with question at palacioSeteais correctly answered"
                    { interaction = with "quintaPenhaVerde"
                    , conditions =
                        [ currentLocationIs "palacioSeteais"
                        , characterIsInLocation "playerOne" "palacioSeteais"
                        , itemIsCorrectlyAnswered "questionAtVillaRoma"
                        , itemIsCorrectlyAnswered "questionAtSeteaisAboutVillaRoma"
                        ]
                    , changes =
                        [ moveTo "quintaPenhaVerde"
                        , moveCharacterToLocation "playerOne" "quintaPenhaVerde"
                        ]
                    }
                    Narrative.enteringQuintaPenhaVerdeDict
               , rule "entering quintaPenhaVerde from desvioQuintaDasSequoias"
                    { interaction = with "quintaPenhaVerde"
                    , conditions =
                        [ currentLocationIs "desvioQuintaSequoias"
                        , characterIsInLocation "playerOne" "desvioQuintaSequoias"
                        ]
                    , changes =
                        [ moveTo "quintaPenhaVerde"
                        , moveCharacterToLocation "playerOne" "quintaPenhaVerde"
                        ]
                    }
                    Narrative.enteringQuintaPenhaVerdeFromDesvioQuintaDasSequoiasDict
               ]
            ++ -- desvio Quinta das Sequoias
               [ rule "entering desvioQuintaSequoias"
                    { interaction = with "desvioQuintaSequoias"
                    , conditions =
                        [ itemIsCorrectlyAnswered "questionAtVillaRoma"
                        , itemIsCorrectlyAnswered "questionAtSeteaisAboutVillaRoma"
                        ]
                    , changes =
                        [ moveTo "desvioQuintaSequoias"
                        , moveCharacterToLocation "playerOne" "desvioQuintaSequoias"
                        ]
                    }
                    Narrative.enteringDesvioQuintaSequoiasDict
               , rule "talk to photographer at desvioQuintaSequoias"
                    { interaction = with "photographer"
                    , conditions =
                        [ currentLocationIs "desvioQuintaSequoias"
                        , characterIsInLocation "playerOne" "desvioQuintaSequoias"
                        , characterIsInLocation "photographer" "desvioQuintaSequoias"
                        , itemIsCorrectlyAnswered "questionAtVillaRoma"
                        , itemIsCorrectlyAnswered "questionAtSeteaisAboutVillaRoma"
                        ]
                    , changes =
                        []
                    }
                    Narrative.talkToPhotographerDict
               ]
            ++ -- quintinhaMonserrate
               [ rule "entering quintinhaMonserrate make TinCan appear"
                    { interaction = with "quintinhaMonserrate"
                    , conditions =
                        [ itemIsCorrectlyAnswered "questionAtVillaRoma"
                        , itemIsCorrectlyAnswered "questionAtSeteaisAboutVillaRoma"
                        , hasNotPreviouslyInteractedWith "tinCan"
                        , hasPreviouslyInteractedWith "photographer"
                        ]
                    , changes =
                        [ moveTo "quintinhaMonserrate"
                        , moveCharacterToLocation "playerOne" "quintinhaMonserrate"
                        , moveItemToLocation "tinCan" "quintinhaMonserrate"
                        ]
                    }
                    Narrative.enteringQuintinhaMonserrateDict
               , rule "entering quintinhaMonserrate no tinCan"
                    { interaction = with "quintinhaMonserrate"
                    , conditions =
                        []
                    , changes =
                        [ moveTo "quintinhaMonserrate"
                        , moveCharacterToLocation "playerOne" "quintinhaMonserrate"
                        ]
                    }
                    Narrative.enteringQuintinhaMonserrateDict
               , rule "interact with tinCan at quintinha Monserrate"
                    { interaction = with "tinCan"
                    , conditions =
                        [ itemIsCorrectlyAnswered "questionAtVillaRoma"
                        , itemIsCorrectlyAnswered "questionAtSeteaisAboutVillaRoma"
                        , characterIsInLocation "playerOne" "quintinhaMonserrate"
                        , itemIsInLocation "tinCan" "quintinhaMonserrate"
                        ]
                    , changes =
                        [ moveItemOffScreen "tinCan"
                        , moveItemToCharacterInventory "playerOne" "pinholeCamera"
                        ]
                    }
                    Narrative.findingPinholeCameraDict
               , rule "talk to  totemShaper at quintinhaMonserrate"
                    { interaction = with "totemShaper"
                    , conditions =
                        [ itemIsCorrectlyAnswered "questionAtVillaRoma"
                        , itemIsCorrectlyAnswered "questionAtSeteaisAboutVillaRoma"
                        , characterIsInLocation "playerOne" "quintinhaMonserrate"
                        , characterIsInLocation "totemShaper" "quintinhaMonserrate"
                        ]
                    , changes =
                        [ increaseCounter "nrTimesTalkTo" "totemShaper"
                        ]
                    }
                    Narrative.talkToTotemShaperQuintinhaMonserrateDict
               , rule "talking to the totemShaper after 1 interaction birdsNest offered by TotemShaper"
                    { interaction = with "totemShaper"
                    , conditions =
                        [ currentLocationIs "quintinhaMonserrate"
                        , characterIsInLocation "totemShaper" "quintinhaMonserrate"
                        , characterIsInLocation "playerOne" "quintinhaMonserrate"
                        , counterGreaterThenOrEqualTo 1 "nrTimesTalkTo" "totemShaper"
                        , itemIsOffScreen "birdsNest"
                        ]
                    , changes =
                        [ moveItemToCharacterInventory "playerOne" "birdsNest"
                        , increaseCounter "nrTimesTalkTo" "totemShaper"
                        ]
                    }
                    Narrative.birdsNestOfferedByTotemShaperDict

               --viewTotemAtQuintinhaMonserrate
               , rule "view Totem AtQuintinhaMonserrate"
                    { interaction = with "totem"
                    , conditions =
                        [ characterIsInLocation "playerOne" "quintinhaMonserrate"
                        , itemIsInLocation "totem" "quintinhaMonserrate"
                        ]
                    , changes =
                        []
                    }
                    Narrative.viewTotemAtQuintinhaMonserrateDict
               , rule "view severalAnimals at  At QuintinhaMonserrate"
                    { interaction = with "severalAnimals"
                    , conditions =
                        [ characterIsInLocation "playerOne" "quintinhaMonserrate"
                        , characterIsInLocation "severalAnimals" "quintinhaMonserrate"
                        ]
                    , changes =
                        []
                    }
                    Narrative.viewSeveralAnimalsAtQuintinhaMonserrateDict
               ]
            ++ -- fonteDeMataAlva
               [ rule "entering fonteDeMataAlva"
                    { interaction = with "fonteDeMataAlva"
                    , conditions =
                        [ itemIsCorrectlyAnswered "questionAtVillaRoma"
                        , itemIsCorrectlyAnswered "questionAtSeteaisAboutVillaRoma"
                        ]
                    , changes =
                        [ moveTo "fonteDeMataAlva"
                        , moveCharacterToLocation "playerOne" "fonteDeMataAlva"
                        ]
                    }
                    Narrative.enteringFonteDeMataAlvaDict
               , ruleWithQuasiChange "view questionAtFonteMataAlva"
                    { interaction = with "questionAtFonteMataAlva"
                    , conditions =
                        [ characterIsInLocation "playerOne" "fonteDeMataAlva"
                        , itemIsInLocation "questionAtFonteMataAlva" "fonteDeMataAlva"
                        ]
                    , changes = []
                    , quasiChanges =
                        [ check_IfAnswerCorrect
                            (listOfAnswersAndFunctions [ "1988" ] [])
                            (checkAnswerData
                                (Just 5)
                                caseInsensitiveAnswer
                                answerSpacesDontMatter
                                headerAnswerAndCorrectIncorrect
                                Dict.empty
                                Dict.empty
                                []
                                []
                            )
                            "questionAtFonteMataAlva"
                        ]
                    , quasiChangeWithBkend = noQuasiChangeWithBackend
                    }
                    Narrative.viewQuestionAtFonteMataAlvaDict
               ]
            ++ -- parquePalacioMonserrate
               [ rule "entering parquePalacioMonserrate"
                    { interaction = with "parquePalacioMonserrate"
                    , conditions =
                        [ itemIsCorrectlyAnswered "questionAtVillaRoma"
                        , itemIsCorrectlyAnswered "questionAtSeteaisAboutVillaRoma"
                        ]
                    , changes =
                        [ moveTo "parquePalacioMonserrate"
                        , moveCharacterToLocation "playerOne" "parquePalacioMonserrate"
                        ]
                    }
                    Narrative.enteringParquePalacioMonserrateDict
               , rule "look at Byrons Poem about parquePalacioMonserrate"
                    { interaction = with "byronsPoem"
                    , conditions =
                        [ characterIsInLocation "playerOne" "parquePalacioMonserrate"
                        , itemIsInLocation "byronsPoem" "parquePalacioMonserrate"
                        ]
                    , changes =
                        []
                    }
                    Narrative.byronsPoemMonserrateDict
               , rule "look at Info Panel about parquePalacioMonserrate"
                    { interaction = with "infoPanelMonserrate"
                    , conditions =
                        [ characterIsInLocation "playerOne" "parquePalacioMonserrate"
                        , itemIsInLocation "infoPanelMonserrate" "parquePalacioMonserrate"
                        ]
                    , changes =
                        []
                    }
                    Narrative.infoParquePalacioMonserrateDict
               ]
            ++ -- fonteDosLadroes
               [ rule "entering fonteDosLadroes"
                    { interaction = with "fonteDosLadroes"
                    , conditions =
                        [ itemIsCorrectlyAnswered "questionAtVillaRoma"
                        , itemIsCorrectlyAnswered "questionAtSeteaisAboutVillaRoma"
                        ]
                    , changes =
                        [ moveTo "fonteDosLadroes"
                        , moveCharacterToLocation "playerOne" "fonteDosLadroes"
                        ]
                    }
                    Narrative.enteringFonteDosLadroesDict
               ]
            ++ -- sintra1914
               [ rule "entering sintra1914 pinholeCamera not on the ground, photography not on the ground"
                    { interaction = with "sintra1914"
                    , conditions =
                        [ itemIsCorrectlyAnswered "questionAtVillaRoma"
                        , itemIsCorrectlyAnswered "questionAtSeteaisAboutVillaRoma"
                        , itemIsNotInLocation "pinholeCamera" "sintra1914"
                        , itemIsNotInLocation "cameraAndPhotography1Sintra1914" "sintra1914"
                        ]
                    , changes =
                        [ moveTo "sintra1914"
                        , moveCharacterToLocation "playerOne" "sintra1914"
                        ]
                    }
                    Narrative.enteringSintra1914Dict
               , rule "entering sintra1914 pinholeCamera is on the ground no photography created before"
                    { interaction = with "sintra1914"
                    , conditions =
                        [ itemIsCorrectlyAnswered "questionAtVillaRoma"
                        , itemIsCorrectlyAnswered "questionAtSeteaisAboutVillaRoma"
                        , itemIsInLocation "pinholeCamera" "sintra1914"
                        , itemIsNotInLocation "cameraAndPhotography1Sintra1914" "sintra1914"
                        , itemIsOffScreen "cameraAndPhotography1Sintra1914"
                        ]
                    , changes =
                        [ increaseCounter "nrPhotographiesCreated" "pinholeCamera"
                        , increaseCounter "nrPhotographiesCreatedInSintra1914" "pinholeCamera"
                        , moveItemToLocation "cameraAndPhotography1Sintra1914" "sintra1914"
                        , moveItemOffScreen "pinholeCamera"
                        , moveCharacterToLocation "playerOne" "sintra1914"
                        , moveTo "sintra1914"
                        ]
                    }
                    Narrative.enteringSintra1914PhotographyAppearsDict
               , rule "entering sintra1914 cameraAndPhotography1Sintra1914 was created before and is on the ground"
                    { interaction = with "sintra1914"
                    , conditions =
                        [ itemIsCorrectlyAnswered "questionAtVillaRoma"
                        , itemIsCorrectlyAnswered "questionAtSeteaisAboutVillaRoma"
                        , itemIsInLocation "cameraAndPhotography1Sintra1914" "sintra1914"
                        ]
                    , changes =
                        [ moveCharacterToLocation "playerOne" "sintra1914"
                        , moveTo "sintra1914"
                        ]
                    }
                    Narrative.enteringSintra1914CameraWithPhotoInsideOnTheGroundDict
               , rule "droping pinholeCamera at sintra1914"
                    { interaction = with "pinholeCamera"
                    , conditions =
                        [ characterIsInLocation "playerOne" "sintra1914"
                        , itemIsInCharacterInventory "playerOne" "pinholeCamera"
                        ]
                    , changes =
                        [ moveItemToLocation "pinholeCamera" "sintra1914"
                        ]
                    }
                    Narrative.settingUpPinholeCameraAtSintra1914Dict
               , rule "interacting with playerOne Sintra1914 with no photo yet produced"
                    { interaction = with "playerOne"
                    , conditions =
                        [ characterIsInLocation "playerOne" "sintra1914"
                        , itemIsOffScreen "cameraAndPhotography1Sintra1914"
                        ]
                    , changes =
                        []
                    }
                    Narrative.hintForPlayerOneSintra1914NoPhotoDict
               ]
            ++ -- limite Freguesia Sao Martinho -Colares
               [ rule "entering limiteSaoMartinhoColares"
                    { interaction = with "limiteSaoMartinhoColares"
                    , conditions =
                        []
                    , changes =
                        [ moveTo "limiteSaoMartinhoColares"
                        , moveCharacterToLocation "playerOne" "limiteSaoMartinhoColares"
                        ]
                    }
                    Narrative.enteringLimiteSaoMartinhoColaresDict
               , ruleWithQuasiChange "view questionAtlimiteSaoMartinhoColares1"
                    { interaction = with "questionSaoMartinhoColares1"
                    , conditions =
                        [ characterIsInLocation "playerOne" "limiteSaoMartinhoColares"
                        , itemIsInLocation "questionSaoMartinhoColares1" "limiteSaoMartinhoColares"
                        ]
                    , changes = []
                    , quasiChanges = []
                    , quasiChangeWithBkend =
                        simpleCheck_IfAnswerCorrectUsingBackend
                            (backendAnswerCheckerUrl ++ "questionSaoMartinhoColares1/")
                            (Just 3)
                            "questionSaoMartinhoColares1"
                    }
                    Narrative.viewQuestionOneAtLimiteSaoMartinhoColaresDict
               , rule "view questionlimiteSaoMartinhoColaresOneNotAtCorrectLocation"
                    { interaction = with "questionSaoMartinhoColares1"
                    , conditions =
                        [ characterIsNotInLocation "playerOne" "limiteSaoMartinhoColares" ]
                    , changes = []
                    }
                    Narrative.viewQuestionWhenNotAtTheRightLocationDict
               , ruleWithQuasiChange "view questionAtlimiteSaoMartinhoColares2"
                    { interaction = with "questionSaoMartinhoColares2"
                    , conditions =
                        [ characterIsInLocation "playerOne" "limiteSaoMartinhoColares"
                        , itemIsInLocation "questionSaoMartinhoColares2" "limiteSaoMartinhoColares"
                        ]
                    , changes = []
                    , quasiChanges = []
                    , quasiChangeWithBkend =
                        simpleCheck_IfAnswerCorrectUsingBackend
                            (backendAnswerCheckerUrl ++ "questionSaoMartinhoColares2/")
                            (Just 3)
                            "questionSaoMartinhoColares2"
                    }
                    Narrative.viewQuestionTwoAtLimiteSaoMartinhoColaresDict
               , rule "view questionlimiteSaoMartinhoColaresTwoNotAtCorrectLocation"
                    { interaction = with "questionSaoMartinhoColares2"
                    , conditions =
                        [ characterIsNotInLocation "playerOne" "limiteSaoMartinhoColares" ]
                    , changes = []
                    }
                    Narrative.viewQuestionWhenNotAtTheRightLocationDict
               ]
            ++ -- Eugaria
               [ rule "entering eugaria"
                    { interaction = with "eugaria"
                    , conditions =
                        [ itemIsCorrectlyAnswered "questionAtVillaRoma"
                        , itemIsCorrectlyAnswered "questionAtSeteaisAboutVillaRoma"
                        ]
                    , changes =
                        [ moveTo "eugaria"
                        , moveCharacterToLocation "playerOne" "eugaria"
                        ]
                    }
                    Narrative.enteringEugariaDict
               , rule "talk to  geocacher eugaria"
                    { interaction = with "geocacher"
                    , conditions =
                        [ characterIsInLocation "playerOne" "eugaria"
                        , characterIsInLocation "geocacher" "eugaria"
                        ]
                    , changes =
                        []
                    }
                    Narrative.talkToGeocacherEugariaDict
               , rule "offer BirdsNest to geocacher at eugaria"
                    { interaction = with "birdsNest"
                    , conditions =
                        [ characterIsInLocation "playerOne" "eugaria"
                        , characterIsInLocation "geocacher" "eugaria"
                        , itemIsInCharacterInventory "playerOne" "birdsNest"
                        , hasPreviouslyInteractedWith "geocacher"
                        ]
                    , changes =
                        [ moveItemOffScreen "birdsNest"
                        , moveItemToCharacterInventory "playerOne" "bocagePoemsBook"
                        , createAttributeIfNotExists (abool True) "isOfferedToGeocacher" "birdsNest"
                        ]
                    }
                    Narrative.offerBirdsNestToGeocacherDict
               ]
            ++ -- quintaDoVinagre
               [ rule "entering quintaDoVinagre"
                    { interaction = with "quintaDoVinagre"
                    , conditions =
                        [ itemIsCorrectlyAnswered "questionAtVillaRoma"
                        , itemIsCorrectlyAnswered "questionAtSeteaisAboutVillaRoma"
                        ]
                    , changes =
                        [ moveTo "quintaDoVinagre"
                        , moveCharacterToLocation "playerOne" "quintaDoVinagre"
                        ]
                    }
                    Narrative.enteringQuintaDoVinagreDict
               ]
            ++ -- Colares
               [ rule "entering colares"
                    { interaction = with "colares"
                    , conditions =
                        [ itemIsCorrectlyAnswered "questionAtVillaRoma"
                        , itemIsCorrectlyAnswered "questionAtSeteaisAboutVillaRoma"
                        ]
                    , changes =
                        [ moveTo "colares"
                        , moveCharacterToLocation "playerOne" "colares"
                        ]
                    }
                    Narrative.enteringColaresDict
               , rule "talk to wiseMan colares"
                    { interaction = with "wiseManColares"
                    , conditions =
                        [ characterIsInLocation "playerOne" "colares" ]
                    , changes =
                        []
                    }
                    Narrative.talkToWiseManColaresDict
               , rule "talk to wiseMan colares when not in colares"
                    -- it could happen through a suggested interaction
                    { interaction = with "wiseManColares"
                    , conditions =
                        [ characterIsNotInLocation "playerOne" "colares" ]
                    , changes =
                        []
                    }
                    Narrative.talkToWiseManColaresWhenNotInColaresDict
               , rule "offer cameraAndPhotography1Sintra1914 to wiseMan Colares , poem book not yet offered"
                    { interaction = with "cameraAndPhotography1Sintra1914"
                    , conditions =
                        [ characterIsInLocation "playerOne" "colares"
                        , characterIsInLocation "wiseManColares" "colares"
                        , itemIsInCharacterInventory "playerOne" "cameraAndPhotography1Sintra1914"
                        ]
                    , changes =
                        [ moveItemOffScreen "cameraAndPhotography1Sintra1914"
                        , createAttributeIfNotExists (abool True) "isOfferedToWiseManColares" "cameraAndPhotography1Sintra1914"
                        ]
                    }
                    Narrative.offerCameraAndPhotography1Sintra1914ToWiseManColaresDict
               , rule "offer cameraAndPhotography1Sintra1914 to wiseMan Colares , poem book already offered"
                    { interaction = with "cameraAndPhotography1Sintra1914"
                    , conditions =
                        [ characterIsInLocation "playerOne" "colares"
                        , characterIsInLocation "wiseManColares" "colares"
                        , itemIsInCharacterInventory "playerOne" "cameraAndPhotography1Sintra1914"
                        , attrValueIsEqualTo (abool True) "isOfferedToWiseManColares" "bocagePoemsBook"
                        ]
                    , changes =
                        [ moveItemOffScreen "cameraAndPhotography1Sintra1914"
                        , setAttributeValue (astring "wiseManColares") "suggestedInteraction" "cameraAndPhotography1Sintra1914"
                        , createAttributeIfNotExists (abool True) "isOfferedToWiseManColares" "cameraAndPhotography1Sintra1914"
                        ]
                    }
                    Narrative.offerCameraAndPhotography1Sintra1914ToWiseManColaresDict
               , rule "offer poemsBook to wiseMan Colares , photography not yet offered"
                    { interaction = with "bocagePoemsBook"
                    , conditions =
                        [ characterIsInLocation "playerOne" "colares"
                        , characterIsInLocation "wiseManColares" "colares"
                        , itemIsInCharacterInventory "playerOne" "bocagePoemsBook"
                        ]
                    , changes =
                        [ moveItemOffScreen "bocagePoemsBook"
                        , createAttributeIfNotExists (abool True) "isOfferedToWiseManColares" "bocagePoemsBook"
                        ]
                    }
                    Narrative.offerPoemsBookToWiseManColaresDict
               , rule "offer poemsBook to wiseMan Colares , photography already offered"
                    { interaction = with "bocagePoemsBook"
                    , conditions =
                        [ characterIsInLocation "playerOne" "colares"
                        , characterIsInLocation "wiseManColares" "colares"
                        , itemIsInCharacterInventory "playerOne" "bocagePoemsBook"
                        , attrValueIsEqualTo (abool True) "isOfferedToWiseManColares" "cameraAndPhotography1Sintra1914"
                        ]
                    , changes =
                        [ moveItemOffScreen "bocagePoemsBook"
                        , createAttributeIfNotExists (abool True) "isOfferedToWiseManColares" "bocagePoemsBook"
                        , setAttributeValue (astring "wiseManColares") "suggestedInteraction" "bocagePoemsBook"
                        ]
                    }
                    Narrative.offerPoemsBookToWiseManColaresDict
               , rule "talk to wiseMan colares having fullfilled all tasks besides some questions but not enough nr interactions"
                    { interaction = with "wiseManColares"
                    , conditions =
                        [ characterIsInLocation "playerOne" "colares"
                        , characterIsInLocation "wiseManColares" "colares"
                        , itemIsCorrectlyAnswered "questionAtVillaRoma"
                        , itemIsCorrectlyAnswered "questionAtSeteaisAboutVillaRoma"
                        , attrValueIsEqualTo (abool True) "isOfferedToGeocacher" "birdsNest"
                        , attrValueIsEqualTo (abool True) "isOfferedToWiseManColares" "bocagePoemsBook"
                        , attrValueIsEqualTo (abool True) "isOfferedToWiseManColares" "cameraAndPhotography1Sintra1914"
                        , itemIsNotCorrectlyAnswered "questionColares"
                        , counterLessThen 4 "nrInteractionsWiseManAfterOffers" "wiseManColares"
                        ]
                    , changes =
                        [ increaseCounter "nrInteractionsWiseManAfterOffers" "wiseManColares"
                        ]
                    }
                    Narrative.wiseManTalksAboutSintraDict
               , rule "talk to wiseMan colares having fullfilled all tasks besides some questions and enough nr of interactions with wiseman"
                    { interaction = with "wiseManColares"
                    , conditions =
                        [ characterIsInLocation "playerOne" "colares"
                        , characterIsInLocation "wiseManColares" "colares"
                        , itemIsCorrectlyAnswered "questionAtVillaRoma"
                        , itemIsCorrectlyAnswered "questionAtSeteaisAboutVillaRoma"
                        , attrValueIsEqualTo (abool True) "isOfferedToGeocacher" "birdsNest"
                        , attrValueIsEqualTo (abool True) "isOfferedToWiseManColares" "bocagePoemsBook"
                        , attrValueIsEqualTo (abool True) "isOfferedToWiseManColares" "cameraAndPhotography1Sintra1914"
                        , itemIsNotCorrectlyAnswered "questionColares"
                        , itemIsOffScreen "questionColares"
                        , counterGreaterThenOrEqualTo 4 "nrInteractionsWiseManAfterOffers" "wiseManColares"
                        ]
                    , changes =
                        [ increaseCounter "nrInteractionsWiseManAfterOffers" "wiseManColares"
                        , addChoiceLanguage "vi" "viewer1"
                        , addChoiceLanguage "vw" "viewer2"
                        , moveItemToLocationFixed "questionColares" "colares"
                        , moveItemToLocationFixed "photosEstradaVelhaColares" "colares"
                        ]
                    }
                    Narrative.wiseManShowsFinalQuestionDict
               , rule "view photosEstradaVelhaColares"
                    { interaction = with "photosEstradaVelhaColares"
                    , conditions =
                        [ characterIsInLocation "playerOne" "colares"
                        , itemIsInLocation "photosEstradaVelhaColares" "colares"
                        ]
                    , changes =
                        []
                    }
                    Narrative.viewPhotosEstradaVelhaColaresDict
               , ruleWithQuasiChange "view questionColares"
                    { interaction = with "questionColares"
                    , conditions =
                        [ characterIsInLocation "playerOne" "colares"
                        , itemIsInLocation "questionColares" "colares"
                        ]
                    , changes = []
                    , quasiChanges = []
                    , quasiChangeWithBkend =
                        check_IfAnswerCorrectUsingBackend
                            --[ "RiodasMacas" ]
                            (backendAnswerCheckerUrl ++ "questionColares/")
                            (checkBkendAnswerData
                                (Just 5)
                                --caseInsensitiveAnswer
                                --answerSpacesDontMatter
                                headerAnswerAndCorrectIncorrect
                                [ ( "suggestedInteraction", astring "wiseManColares" ) ]
                                []
                            )
                            "questionColares"
                    }
                    Narrative.viewQuestionAtColaresDict
               , rule "view questionColaresNotAtCorrectLocation"
                    { interaction = with "questionColares"
                    , conditions =
                        [ characterIsNotInLocation "playerOne" "colares" ]
                    , changes = []
                    }
                    Narrative.viewQuestionWhenNotAtTheRightLocationDict
               , rule "talk to wiseMan colares after questionColares appears , questionColares not yet correctly answered"
                    { interaction = with "wiseManColares"
                    , conditions =
                        [ characterIsInLocation "playerOne" "colares"
                        , characterIsInLocation "wiseManColares" "colares"
                        , itemIsInLocation "questionColares" "colares"
                        , itemIsNotCorrectlyAnswered "questionColares"
                        ]
                    , changes =
                        []
                    }
                    Narrative.talkToWiseManAfterQuestionColaresAppearsDict
               , rule "talk to wiseMan colares after questionColares correctly answered somer questions not yet answered"
                    { interaction = with "wiseManColares"
                    , conditions =
                        [ characterIsInLocation "playerOne" "colares"
                        , characterIsInLocation "wiseManColares" "colares"
                        , itemIsInLocation "questionColares" "colares"
                        , itemIsCorrectlyAnswered "questionColares"
                        ]
                    , changes =
                        []
                    }
                    Narrative.talkToWiseManAfterQuestionColaresCorrectlyAnsweredButStillSomeTasksToDoDict
               , rule "talk to wiseMan colares after questionColares correctly answered and all other questions answered"
                    { interaction = with "wiseManColares"
                    , conditions =
                        [ characterIsInLocation "playerOne" "colares"
                        , characterIsInLocation "wiseManColares" "colares"
                        , itemIsCorrectlyAnswered "questionAtVillaRoma"
                        , itemIsCorrectlyAnswered "questionAtSeteaisAboutVillaRoma"
                        , itemIsCorrectlyAnswered "questionAtFonteMataAlva"
                        , itemIsCorrectlyAnswered "questionSaoMartinhoColares1"
                        , itemIsCorrectlyAnswered "questionSaoMartinhoColares2"
                        , attrValueIsEqualTo (abool True) "isOfferedToGeocacher" "birdsNest"
                        , attrValueIsEqualTo (abool True) "isOfferedToWiseManColares" "bocagePoemsBook"
                        , attrValueIsEqualTo (abool True) "isOfferedToWiseManColares" "cameraAndPhotography1Sintra1914"
                        , itemIsInLocation "questionColares" "colares"
                        , itemIsCorrectlyAnswered "questionColares"
                        ]
                    , changes =
                        [ setAttributeValue (abool True) "gameHasEnded" "gameStateItem"
                        , setAttributeValue (astring "finalPieceOfPaper") "suggestedInteraction" "wiseManColares"

                        --, writeForceTextToItemFromGivenItemAttr "bonusText" "questionColares" "finalPieceOfPaper"
                        , createOrSetAttributeValueFromOtherInterAttr "additionalTextDict" "bonusText" "questionColares" "finalPieceOfPaper"
                        , moveItemToLocation "finalPieceOfPaper" "colares"
                        ]
                    }
                    Narrative.talkToWiseManAfterQuestionColaresCorrectlyAnsweredDict
               , rule "game has ended"
                    { interaction =
                        withAnyLocationAnyCharacterAfterGameEnded

                    --withAnythingAfterGameEnded
                    , conditions =
                        [ attrValueIsEqualTo (abool True) "gameHasEnded" "gameStateItem"
                        ]
                    , changes =
                        [ endStory "notFreezingEnd" "The End"
                        , removeAttributeIfExists "suggestedInteraction" "wiseManColares"
                        , removeAttributeIfExists "suggestedInteraction" "questionColares"
                        ]
                    }
                    Narrative.gameHasEndedDict
               ]
            ++ -- gps and notas sabias
               [ rule "taking gps"
                    { interaction = with "gps"
                    , conditions =
                        [ characterIsInLocation "playerOne" "largoDrCarlosFranca"
                        , itemIsInLocation "gps" "largoDrCarlosFranca"
                        ]
                    , changes =
                        [ moveItemToCharacterInventory "playerOne" "gps" ]
                    }
                    Narrative.takeGpsDict
               , ruleWithQuasiChange "looking at gps"
                    { interaction = with "gps"
                    , conditions =
                        []
                    , changes = []
                    , quasiChanges =
                        [ write_GpsInfoToItem "gps" ]
                    , quasiChangeWithBkend = noQuasiChangeWithBackend
                    }
                    Narrative.lookAtGpsDict
               , rule "lookAtWiseNotesDict"
                    { interaction = with "notasSabias"
                    , conditions =
                        []
                    , changes =
                        [ moveItemToCharacterInventory "playerOne" "notasSabias" ]
                    }
                    Narrative.lookAtWiseNotesDict
               , rule "lookAtcreditsInfo"
                    { interaction = with "creditsInfo"
                    , conditions =
                        []
                    , changes =
                        []
                    }
                    Narrative.theCreditsInformationDict
               ]
