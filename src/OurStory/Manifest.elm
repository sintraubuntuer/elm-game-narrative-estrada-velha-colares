module OurStory.Manifest exposing (characters, items, locations, playerId)

import Components exposing (..)
import GpsUtils exposing (Direction(..))



{- Here is where you define your manifest -- all of the items, characters, and locations in your story. You can add what ever components you wish to each entity.  Note that the first argument to `entity` is the id for that entity, which is the id you must refer to in your rules.
   In the current theme, the description in the display info component is only used as a fallback narrative if a rule does not match with a more specific narrative when interacting with that story object.
-}


{-| make sure this is the same as defined below on characters
-}
playerId : String
playerId =
    "playerOne"


items : List Entity
items =
    [ entity "gameStateItem"
    , entity "gps"
        |> addDisplayInfo "GPSr" "Magical Instrument that helps you navigate"
        |> addLgDisplayInfo "pt" "GPSr" "Instrumento mágico que te ajuda a navegar no terreno."
        |> addNeedsGpsInfo True
    , entity "notasSabias"
        |> addDisplayInfo "wise notes" "some notes you wrote on a piece of paper while listening to Sintra Wise Man helpful advice"
        |> addLgDisplayInfo "pt" "notas sábias" "apontamentos recolhidos durante a conversa com o sábio"
    , entity "questionAtVillaRoma"
        |> addDisplayInfo "question" "Who built Villa Roma ?"
        |> addLgDisplayInfo "pt" "questão" "Quem construiu Villa Roma ?"
    , entity "questionAtSeteaisAboutVillaRoma"
        |> addDisplayInfo "question2" "Who lived in Villa Roma ?"
        |> addLgDisplayInfo "pt" "questão2" "Quem viveu em Villa Roma ?"
    , entity "sinalCuidadoComOGato"
        |> addDisplayInfo "warning signal" "Curious warning signal : \nBeware of The Cat"
        |> addLgDisplayInfo "pt" "sinal" "Curioso Sinal com o seguinte aviso : \nCuidado com o Gato"
    , entity "tinCan"
        |> addDisplayInfo "tincan" "a common tincan"
        |> addLgDisplayInfo "pt" "Lata" "Uma simples lata"
    , entity "pinholeCamera"
        |> addDisplayInfo "pinhole camera" "pinhole camera"
        |> addLgDisplayInfo "pt" "Camara Estenopeica" "Camara Estenopeica"
        |> addLgDisplayInfo "vi" "suspicious device" "a very suspicious device"
    , entity "totem"
        |> addDisplayInfo "Totem" "Curious 24,5ft high and 10ft wide wood sculpture , which has been cretaed with a chainsaw"
        |> addLgDisplayInfo "pt" "Totem" "Curiosa escultura em madeira com 7,5m de altura e 3m de diâmetro médio, esculpida com motosserra"
    , entity "birdsNest"
        |> addDisplayInfo "Bird's nest" "Bird's nest carved on some very fine materials"
        |> addLgDisplayInfo "pt" "Casa ninho de pássaro" "Casa ninho de pássaro muito bem trabalhado com vários materiais"
    , entity "waterContainer"
        |> addDisplayInfo "water canteen" "water canteen - pay attention to the water quality info displayed on the fountains"
        |> addLgDisplayInfo "pt" "Cantil" "cantil - atenção à informação apresentada nas fontes sobre a qualidade da água"
    , entity "questionAtFonteMataAlva"
        |> addDisplayInfo "question" "What year was the fountain restored ?"
        |> addLgDisplayInfo "pt" "questão" "Em que ano foi restaurada a Fonte de Mata-Alva ?"
    , entity "byronsPoem"
        |> addDisplayInfo "Poem" "Childe Harold's Pilgrimage Byron Poem about Monserrate"
        |> addLgDisplayInfo "pt" "poema" "poema de Byron sobre Monserrate"
    , entity "infoPanelMonserrate"
        |> addDisplayInfo "Info" "Panel with information about Parque e Palácio de Monserrate"
        |> addLgDisplayInfo "pt" "Info" "Painel informativo sobre o Parque e Palácio de Monserrate"
    , entity "cameraAndPhotography1Sintra1914"
        |> addDisplayInfo "Pinhole Camera with  negative" "Pinhole Camera with photography negative inside"
        |> addLgDisplayInfo "pt" "Camara estenopeica com negativo" "camara estenopeica com um negativo no seu interior"
        |> addLgDisplayInfo "vi" "suspicious device" "a very suspicious device"
        |> addLgDisplayInfo "vw" "work of art" "artist managed to depict the truth in a simple tiny paper"
    , entity "photography2Fonte1914"
        |> addDisplayInfo "photography" "A very creative photography obtained with the pinhole camera"
        |> addLgDisplayInfo "pt" "Fotografia" "Uma fotografia obtida com a camara estenopeica"
    , entity "questionSaoMartinhoColares1"
        |> addDisplayInfo "question" "What's the name and date on Leve Colares No Coracao sign"
        |> addLgDisplayInfo "pt" "questão" "Qual o nome e data indicados no placard Leve Colares No Coração"
    , entity "questionSaoMartinhoColares2"
        |> addDisplayInfo "question2" "What's the name and date on the road signs "
        |> addLgDisplayInfo "pt" "questão2" "Qual o nome e data indicados nas placas toponímicas"
    , entity "photography1QuintaVinagre"
        |> addDisplayInfo "a photography" "Quinta do Vinagre photography obtained with the pinhole camera"
        |> addLgDisplayInfo "pt" "Fotografia" "Uma fotografia obtida com a camara estenopeica"
    , entity "bocagePoemsBook"
        |> addDisplayInfo "Bocage Poem Book" "Ancient Poems Book by Bocage"
        |> addLgDisplayInfo "pt" "Livro de Poemas de Bocage" "Antigo livro de poemas de Bocage em bom estado de conservação !"
    , entity "creditsInfo"
        |> addDisplayInfo "Credits" "some persons or institutions that directly or indirectly have helped ( or where some information was gathered from )  to produce  the marvelous Mistério da Estrada Velha de Colares !"
        |> addLgDisplayInfo "pt" "Credits" "algumas pessoas ou instituições que directa ou indirectamente auxiliaram ( ou de onde informação foi recolhida ) a produzir o fantástico Mistério da Estrada Velha de Colares !"
    , entity "questionColares"
        |> addDisplayInfo "Final Question" "What do you think is the answer ?"
        |> addLgDisplayInfo "pt" "Questão Final" "Qual é a resposta"
    , entity "photosEstradaVelhaColares"
        |> addDisplayInfo "photos" "photos of Estrada Velha de Colares"
        |> addLgDisplayInfo "pt" "fotografias" "Fotografias da Estrada Velha de Colares"
    , entity "finalPieceOfPaper"
        |> addDisplayInfo "piece of Paper" "An ancient piece of paper with something written in it : "
        |> addLgDisplayInfo "pt" "Papel antigo" "Um papel antigo com algo escrito : "
    ]


characters : List Entity
characters =
    [ entity "playerOne"
        |> addDisplayInfo "investigator" "relentless investigator searching for the Truth ..."
        |> addLgDisplayInfo "pt" "investigador" "investigador determinado  em busca da Verdade ..."
    , entity "sintraWiseMan"
        |> addDisplayInfo "Sintra Wise Man" "residente de Sintra. Conhecedor da região"
        |> addLgDisplayInfo "pt" "Sábio de Sintra" "residente de Sintra. Conhecedor da região"
        |> addLgDisplayInfo "vi" "Crazy man pretending to be a Wise Man" "Man with crazy revolutionary ideas"
        |> addLgDisplayInfo "vw" "Sintra Enlightened Man" "the Sintra Enlightened Man"
    , entity "turistsBarbosaduBocage"
        |> addDisplayInfo "turists" "Group of turists visiting Sintra"
        |> addLgDisplayInfo "pt" "turistas" "grupo de turistas em visita a Sintra"
    , entity "catOne"
        |> addDisplayInfo "cat" "a pretty cat"
        |> addLgDisplayInfo "pt" "gato" "Bonito gato"
    , entity "turistOne"
        |> addDisplayInfo "a turist" "a turist visiting Sintra"
        |> addLgDisplayInfo "pt" "um turista" "Um turista em visita a Sintra"
    , entity "photographer"
        |> addDisplayInfo "photographer" "a photographer"
        |> addLgDisplayInfo "pt" "um fotógrafo" "Um fotógrafo"
        |> addLgDisplayInfo "vi" "Witch pretending to be a photographer" "weird looking guy"
        |> addLgDisplayInfo "vw" "Light Specialist aka photographer" "specialist on matters of the Light"
    , entity "totemShaper"
        |> addDisplayInfo "totemShaper" "artist that carves wood with a chainsaw"
        |> addLgDisplayInfo "pt" "Escultora de madeira" "artista que esculpe em Madeira com motoserra."
    , entity "severalAnimals"
        |> addDisplayInfo "several animals" "several animals from Quintinha de Monserrate - donkey , goat  , sheep , cock , chicken ..."
        |> addLgDisplayInfo "pt" "vários animais" "vários animais da Quintinha de Monserrate - Burros , cabras , galos , galinhas ..."
    , entity "turistTwo"
        |> addDisplayInfo "Visitor" "Turist entering Parque de Monserrate"
        |> addLgDisplayInfo "pt" "Visitante" "Turista a entrar no Parque de Monserrate"
    , entity "turistThree"
        |> addDisplayInfo "Turist" "Turist checking her turist guide"
        |> addLgDisplayInfo "pt" "Turista" "Turista a consultar um guia turístico"
    , entity "geocacher"
        |> addDisplayInfo "Geocacher" "a geocacher researching the area"
        |> addLgDisplayInfo "pt" "Geocacher" "Um geocacher em reconhecimento da zona"
        |> addLgDisplayInfo "vi" "Polluter that calls himself a geocacher" "person who pollutes the environment with suspicious looking devices"
    , entity "wiseManColares"
        |> addDisplayInfo "Colares Wise Man" "Colares Wise Man, collector of antiques and pinhole camera photography , and bearer of a lot of the region's secrets"
        |> addLgDisplayInfo "pt" "Sabio de Colares" "Sábio de Colares, coleccionador de antiguidades e fotografia estenopeica , e conhecedor de segredos da região"

    --|> addLgDisplayInfo  "vi"  "Crazy man pretending to be a Wise Man" "Man with crazy revolutionary ideas"
    --|> addLgDisplayInfo  "vw"  "Colares Enlightened Man"  "the Colares Enlightened Man"
    ]


locations : List Entity
locations =
    [ entity "largoDrCarlosFranca"
        |> addDisplayInfo "Largo Dr. Carlos Franca" "O Largo em que a acção se inicia"
        |> addConnectingLocations [ ( West, "ruaBarbosaDoBocageInicio" ) ]
        |> addNeedsToBeInGpsZone False 38.79503 -9.39289 Nothing
        |> addClassName "largoCarlosFranca"
    , entity "ruaBarbosaDoBocageInicio"
        |> addDisplayInfo "Rua Barbosa do Bocage" "A famosa estrada que segue para Oeste em direcção a Colares"
        |> addConnectingLocations [ ( East, "largoDrCarlosFranca" ), ( West, "villaRoma" ) ]
        |> addNeedsToBeInGpsZone True 38.79501 -9.39421 Nothing
        |> addClassName "ruaBarbosadoBocage"
    , entity "villaRoma"
        |> addDisplayInfo "Villa Roma" "Bonita quinta em frente à Quinta da Regaleira"
        |> addConnectingLocations [ ( East, "ruaBarbosaDoBocageInicio" ), ( NorthWest, "ruaTrindadeCoelho" ), ( West, "palacioSeteais" ) ]
        |> addNeedsToBeInGpsZone True 38.79652 -9.3959 Nothing
        |> addClassName "villaRoma"
    , entity "ruaTrindadeCoelho"
        |> addDisplayInfo "Rua Trindade Coelho" "Rua estreita em ziguezague em direcção à Casa do Fauno , Caminho dos Frades e Caminho dos Castanhais"
        |> addConnectingLocations [ ( NorthEast, "villaRoma" ) ]
        |> addNeedsToBeInGpsZone True 38.7991 -9.39965 Nothing
        |> addClassName "ruaTrindadeCoelho"
    , entity "palacioSeteais"
        |> addDisplayInfo "Seteais" "Bonitos jardins e palácio"
        |> addConnectingLocations [ ( East, "villaRoma" ), ( SouthWest, "quintaPenhaVerde" ) ]
        |> addNeedsToBeInGpsZone True 38.79618 -9.39839 Nothing
        |> addClassName "seteais"
    , entity "quintaPenhaVerde"
        |> addDisplayInfo "Quinta da Penha Verde" "Bonita quinta e arco sobre a estrada. Proximo da Fonte d'el Rei"
        |> addConnectingLocations [ ( NorthEast, "palacioSeteais" ), ( SouthWest, "desvioQuintaSequoias" ) ]
        |> addNeedsToBeInGpsZone True 38.7937 -9.40305 Nothing
        |> addClassName "quintaPenhaVerde"
    , entity "desvioQuintaSequoias"
        |> addDisplayInfo "desvio para a Quinta das Sequoias" "Desvio para a Quinta das Sequoias"
        |> addConnectingLocations [ ( NorthEast, "quintaPenhaVerde" ), ( West, "quintinhaMonserrate" ) ]
        |> addNeedsToBeInGpsZone True 38.79043 -9.40558 Nothing
        |> addClassName "desvioQuintaSequoias"
    , entity "quintinhaMonserrate"
        |> addDisplayInfo "Quintinha de Monserrate" "Quintinha de Monserrate"
        |> addConnectingLocations [ ( East, "desvioQuintaSequoias" ), ( West, "fonteDeMataAlva" ) ]
        |> addNeedsToBeInGpsZone True 38.79075 -9.41006 Nothing
        |> addClassName "quintinhaMonserrate"
    , entity "fonteDeMataAlva"
        |> addDisplayInfo "Fonte de Mata-Alva" "Fonte de Mata-Alva"
        |> addConnectingLocations [ ( East, "quintinhaMonserrate" ), ( NorthWest, "parquePalacioMonserrate" ) ]
        |> addNeedsToBeInGpsZone True 38.79005 -9.41584 Nothing
        |> addClassName "fonteDeMataAlva"
    , entity "parquePalacioMonserrate"
        |> addDisplayInfo "Parque e Palácio de Monserrate" "Parque e Palácio de Monserrate"
        |> addConnectingLocations [ ( SouthEast, "fonteDeMataAlva" ), ( West, "fonteDosLadroes" ) ]
        |> addNeedsToBeInGpsZone True 38.7919 -9.41923 Nothing
        |> addClassName "parquePalacioMonserrate"
    , entity "fonteDosLadroes"
        |> addDisplayInfo "Fonte dos Ladrões" "Fonte dos Ladrões"
        |> addConnectingLocations [ ( East, "parquePalacioMonserrate" ), ( West, "sintra1914" ) ]
        |> addNeedsToBeInGpsZone True 38.79159 -9.42446 Nothing
        |> addClassName "fonteDosLadroes"
    , entity "sintra1914"
        |> addDisplayInfo "Sintra 1914" "Sintra 1914"
        |> addLgDisplayInfo "pt" "Sintra 1914" "Sintra 1914"
        |> addConnectingLocations [ ( East, "fonteDosLadroes" ), ( NorthWest, "limiteSaoMartinhoColares" ) ]
        |> addNeedsToBeInGpsZone True 38.79315 -9.42684 Nothing
        |> addClassName "sintra1914"
    , entity "limiteSaoMartinhoColares"
        |> addDisplayInfo "Limite Freguesia Sao Martinho - Colares" "Aqui termina a freguesia de São Martinho e se inicia a freguesia de Colares"
        |> addConnectingLocations [ ( East, "sintra1914" ), ( NorthWest, "eugaria" ) ]
        |> addNeedsToBeInGpsZone True 38.79395 -9.4276 Nothing
        |> addClassName "limiteSaoMartinhoColares"
    , entity "eugaria"
        |> addDisplayInfo "Eugaria" "Eugaria"
        |> addConnectingLocations [ ( SouthEast, "limiteSaoMartinhoColares" ), ( West, "quintaDoVinagre" ) ]
        |> addNeedsToBeInGpsZone True 38.79497 -9.43413 Nothing
        |> addClassName "eugaria"
    , entity "quintaDoVinagre"
        |> addDisplayInfo "Rio das Maçãs in Quinta do Vinagre" "Rio das Maçãs in Quinta do Vinagre"
        |> addLgDisplayInfo "pt" "Rio das Maçãs na Quinta do Vinagre" "Rio das Maçãs na Quinta do Vinagre"
        |> addConnectingLocations [ ( East, "eugaria" ), ( West, "colares" ) ]
        |> addNeedsToBeInGpsZone True 38.79811 -9.43735 Nothing
        |> addClassName "quintaDoVinagre"
    , entity "colares"
        |> addDisplayInfo "Colares" "Colares"
        |> addConnectingLocations [ ( East, "quintaDoVinagre" ) ]
        |> addNeedsToBeInGpsZone True 38.7995 -9.44462 Nothing
        |> addClassName "colares"
    ]
