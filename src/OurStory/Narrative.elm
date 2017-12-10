module OurStory.Narrative exposing (..)

import ClientTypes exposing (..)
import Dict exposing (Dict)
import OurStory.NarrativeEnglish exposing (..)
import OurStory.NarrativeObsOne as NarrativeObsOne
import OurStory.NarrativeObsTwo as NarrativeObsTwo


{- These are  the languages for which it is mandatory  to generate  narrative content regarding each interaction
   if  no narrative content exists some default is used
   like for instance the  entity description defined in the manifest
-}


desiredLanguages : List String
desiredLanguages =
    [ "pt", "en" ]



{- These are the languages that are displayed in the sidebar and the user can choose from
   These are  initial values , but they might eventually change along the narrative
-}


initialChoiceLanguages : Dict String String
initialChoiceLanguages =
    Dict.fromList
        [ ( "pt", "portuguese" )
        , ( "en", "english" )
        ]


{-| Info to be displayed on StartScreen
-}
startScreenInfo : StartScreenInfo
startScreenInfo =
    { mainImage = "estradaVelhaColares.png"
    , title_line1 = "O Mistério da Estrada Velha"
    , title_line2 = " de Colares"
    , byLine = "An Interactive Story by Sintra Ubuntuer"
    , smallIntro = """ Estrada Velha de Colares and the different names it assumes between Sintra and Colares
                       constitutes a brain cracking mystery that puzzled several brilliant minds
                       throughout the ages ...
                       Could this be the day ... ?
                     """
    , tboxNamePlaceholder = "investigator"
    }


endScreenInfo : EndScreenInfo
endScreenInfo =
    { mainImage = "finalImage.png"
    , congratsMessage1 = "Congratulations !!! "
    , congratsMessage2 = "Good Luck on your quest in Serra de Sintra :)"
    , endScreenText = """....
                        """
    }



{- Here is where you can write all of your story text, which keeps the Rules.elm file a little cleaner.
   The narrative that you add to a rule will be shown when that rule matches.  If you give a list of strings, each time the rule matches, it will show the next narrative in the list, which is nice for adding variety and texture to your story.
   I sometimes like to write all my narrative content first, then create the rules they correspond to.
   Note that you can use **markdown** in your text!
-}


{-| The text that will show when the story first starts, before the player interacts with anythin.
-}
startingNarrative : StorySnippet
startingNarrative =
    { interactableName = "Once upon a time..."
    , interactableId = "OnceUponAtime"
    , isWritable = False
    , interactableCssSelector = "opening"
    , narrative =
        """Todas as histórias têm um começo , ainda que por vezes não seja fácil determinar
          o momento exacto em que se iniciam ( ou terminam ) ...
           Assim parecia ser também o caso da Estrada Velha de Colares
           e os seus diferentes nomes entre Sintra e Colares ...
    """
    , mbAudio = Nothing
    , mbSuggestedInteractionId = Nothing
    , mbSuggestedInteractionName = Nothing
    , isLastInZipper = True
    }


startingNarrativeEn : StorySnippet
startingNarrativeEn =
    { interactableName = "Once upon a time..."
    , interactableId = "OnceUponAtime"
    , isWritable = False
    , interactableCssSelector = "opening"
    , mbSuggestedInteractionId = Nothing
    , mbSuggestedInteractionName = Nothing
    , narrative =
        """Every Story has a beginning , even though it's not allways easy to determine the exact moment
        in which it starts ( or ends ) . That  seemed to also be the case with Estrada Velha de Colares
        and its several different names between Sintra and Colares ...
"""
    , mbAudio = Nothing
    , isLastInZipper = True
    }


startingNarratives : Dict String (List StorySnippet)
startingNarratives =
    Dict.fromList
        [ ( "pt", [ startingNarrative ] )
        , ( "en", [ startingNarrativeEn ] )
        ]


interactingWithPlayerOneDict : Dict String (List String)
interactingWithPlayerOneDict =
    Dict.fromList
        [ ( "pt", interactingWithPlayerOne )
        , ( "en", interactingWithPlayerOneEn )
        ]


interactingWithPlayerOne : List String
interactingWithPlayerOne =
    [ """
investigador determinado  em busca da Verdade ...
      """
    ]


leavingWithoutGpsDict : Dict String (List String)
leavingWithoutGpsDict =
    Dict.fromList [ ( "pt", leavingWithoutGps ), ( "en", leavingWithoutGpsEn ) ]


leavingWithoutGps : List String
leavingWithoutGps =
    [ """
Caríssimo investigador , não parta sem o seu GPSr . Pode perder-se !
"""
    ]


leavingWithoutInteractingSabioSintraDict : Dict String (List String)
leavingWithoutInteractingSabioSintraDict =
    Dict.fromList
        [ ( "pt", leavingWithoutInteractingSabioSintra )
        , ( "en", leavingWithoutInteractingSabioSintraEn )
        ]


leavingWithoutInteractingSabioSintra : List String
leavingWithoutInteractingSabioSintra =
    [ """
Nao e aconselhavel prosseguires sem antes falares com o Sábio e ouvires tudo o que tem a dizer
Os seus conselhos irão  revelar-se muito úteis ao longo do percurso ...
"""
    ]


returningToLargoCarlosFrancaDict : Dict String (List String)
returningToLargoCarlosFrancaDict =
    Dict.fromList
        [ ( "pt", returningToLargoCarlosFranca )
        , ( "en", returningToLargoCarlosFrancaEn )
        ]


returningToLargoCarlosFranca : List String
returningToLargoCarlosFranca =
    [ """
Nada como voltar ao ponto inicial ...
    """
    ]


enteringVillaRomaDict : Dict String (List String)
enteringVillaRomaDict =
    Dict.fromList
        [ ( "pt", enteringVillaRoma )
        , ( "en", enteringVillaRomaEn )
        ]


enteringVillaRoma : List String
enteringVillaRoma =
    [ """
![pic500](img/villaRoma2.png)

Situada na estrada que liga a vila de Sintra a Colares , encontramos uma casa construída em meados do século XIX.

O local escolhido prende-se com a magnífica vista que dele podemos disfrutar
e que apaixonou completamente a então prometida do futuro proprietário."



Vila Roma foi idealizada e construída por Carlos Morato Roma , tendo-se tornado residência de Verão dos principais membros da família
  , muitos dos quais ( a começar pelo autor da casa), grandes vultos da política portuguesa.
Nesta casa viveram figuras como:

- Carlos Morato Roma (conselheiro), que foi director do tesouro público ,

- Dr. José Vicente Barbosa du Bocage, professor, Ministro do Ultramar e dos Estrangeiros e Par do Reino.

- General Carlos Roma du Bocage, que no fim da sua vida foi Ministro dos Estrangeiros de El-rei D. Manuel II , deputado e Par do Reino.

- Dr. António Maria Barbosa, médico do Paço e sócio da Academia Real da Ciências.

- Dr. José Inácio Machado de Faria e Maia, foi Delegado, Juíz de Direito , Secretário da Procuradoria Geral da Coroa e Auditor dos Conselhos de Guerra em Lisboa."
      """
    ]


enteringPalacioSeteaisDict : Dict String (List String)
enteringPalacioSeteaisDict =
    Dict.fromList
        [ ( "pt", enteringPalacioSeteais )
        , ( "en", enteringPalacioSeteaisEn )
        ]


getEnteringPalacioSeteaisString : String
getEnteringPalacioSeteaisString =
    """
![pic500](img/seteais.png)


Localizado em Sintra,  ergue-se este palácio , património mundial ( palácio de origem neoclássica utitlizado hoje em dia como Hotel de luxo e atracção turística  ) no meio de um terreno acidentado
, de onde se pode avistar o oceano Atlântico e a Serra de Sintra, nomeadamente com vista para o Palácio da Pena e o castelo dos Mouros.

O palácio em si encontra-se edificado ao fundo do chamado "Campo de Seteais" uma vez que este era logradouro público até ser aforado por Diogo V. M. C. , 5º Marquês de Marialva.

Ficou estabelecido nesse aforamento que o terreno não seria usado para outros fins que não de passeio público e que seria ocupado pela cavalaria da Guarda de Suas Majestades nas visitas da Família Real a Sintra, assim se justifica o generoso relvado que separa o palácio das principais entradas
    """


enteringPalacioSeteais : List String
enteringPalacioSeteais =
    [ getEnteringPalacioSeteaisString ]


enteringPalacioSeteaisFromPenhaVerdeDict : Dict String (List String)
enteringPalacioSeteaisFromPenhaVerdeDict =
    Dict.fromList
        [ ( "pt", enteringPalacioSeteaisFromPenhaVerde )
        , ( "en", enteringPalacioSeteaisFromPenhaVerdeEn )
        ]


enteringPalacioSeteaisFromPenhaVerde : List String
enteringPalacioSeteaisFromPenhaVerde =
    [ "Colares fica na direcção oposta" ++ "\n\n" ++ getEnteringPalacioSeteaisString ]


warnNeedVillaRomaQuestionCorrectlyAnsweredDict : Dict String (List String)
warnNeedVillaRomaQuestionCorrectlyAnsweredDict =
    Dict.fromList
        [ ( "pt", warnNeedVillaRomaQuestionCorrectlyAnswered )
        , ( "en", warnNeedVillaRomaQuestionCorrectlyAnsweredEn )
        ]


warnNeedVillaRomaQuestionCorrectlyAnswered : List String
warnNeedVillaRomaQuestionCorrectlyAnswered =
    [ """
Necessitas  responder à questão apresentada em Villa Roma por forma a poder prosseguir ....
    """
    ]


viewQuestionAtVillaRomaDict : Dict String (List String)
viewQuestionAtVillaRomaDict =
    Dict.fromList
        [ ( "pt", viewQuestionAtVillaRoma )
        , ( "en", viewQuestionAtVillaRomaEn )
        ]


viewQuestionAtVillaRoma : List String
viewQuestionAtVillaRoma =
    [ """
Quem construiu Villa Roma ?

A - General Carlos Roma du Bocage

B - Carlos Morato Roma
    """
    ]


questionAtVillaRomaAdditionalTextDict : Dict String String
questionAtVillaRomaAdditionalTextDict =
    Dict.fromList
        [ ( "pt", "Muito Bem ! Villa Roma foi construida por Carlos Morato Roma." )
        , ( "en", "Very Good ! Villa Roma was in fact built by Carlos Morato Roma." )
        ]


viewQuestionAtSeteaisAboutVillaRomaDict : Dict String (List String)
viewQuestionAtSeteaisAboutVillaRomaDict =
    Dict.fromList
        [ ( "pt", viewQuestionAtSeteaisAboutVillaRoma )
        , ( "en", viewQuestionAtSeteaisAboutVillaRomaEn )
        ]


viewQuestionAtSeteaisAboutVillaRoma : List String
viewQuestionAtSeteaisAboutVillaRoma =
    [ """

Ainda sobre Villa Roma ...

Que elementos da família Bocage viveram em Villa Roma ?

A -  Dr. José Vicente Barbosa du Bocage

B - Manuel Maria Barbosa du Bocage
    """
    ]



{-
   takeRespostaAatVillaRoma : List String
   takeRespostaAatVillaRoma =
       ["""
   Resposta Errada ! Tens de Voltar ao ponto inicial !
       """
       ]

   takeRespostaBatVillaRoma : List String
   takeRespostaBatVillaRoma =
           ["""
   Correcto. Villa Roma foi idealizada e construída por Carlos Morato Roma
           """
           ]
-}


enteringRuaTrindadeCoelhoDict : Dict String (List String)
enteringRuaTrindadeCoelhoDict =
    Dict.fromList
        [ ( "pt", enteringRuaTrindadeCoelho )
        , ( "en", enteringRuaTrindadeCoelhoEn )
        ]


enteringRuaTrindadeCoelho : List String
enteringRuaTrindadeCoelho =
    [ """
![pic500](img/ruaTrindadeCoelho.png)

Rua estreita ladeada por Quintas e árvores centenárias , que segue em direcção à Casa do Fauno ,  Caminho dos Frades e Caminho dos Castanhais"

![pic500](img/ruaTrindadeCoelho2.png)
        """
    ]


playWithCatAtRuaTrindadeCoelhoDict : Dict String (List String)
playWithCatAtRuaTrindadeCoelhoDict =
    Dict.fromList
        [ ( "pt", playWithCatAtRuaTrindadeCoelho )
        , ( "en", playWithCatAtRuaTrindadeCoelhoEn )
        ]


playWithCatAtRuaTrindadeCoelho : List String
playWithCatAtRuaTrindadeCoelho =
    [ """
Devias ter prestado atenção ao sinal. O gato era bastante simpático e brincalhão mas num momento de distracção pegou no teu gps e fugiu com ele !
Terás que voltar ao ponto inicial para obter novo gps !
        """
    ]


warnNeedSeteaisVillaRomaQuestionCorrectlyAnsweredDict : Dict String (List String)
warnNeedSeteaisVillaRomaQuestionCorrectlyAnsweredDict =
    Dict.fromList
        [ ( "pt", warnNeedSeteaisVillaRomaQuestionCorrectlyAnswered )
        , ( "en", warnNeedSeteaisVillaRomaQuestionCorrectlyAnsweredEn )
        ]


warnNeedSeteaisVillaRomaQuestionCorrectlyAnswered : List String
warnNeedSeteaisVillaRomaQuestionCorrectlyAnswered =
    [ """
Necessitas  responder à questão apresentada em Seteais sobre Villa Roma por forma a poder prosseguir ....
    """
    ]


enteringQuintaPenhaVerdeDict : Dict String (List String)
enteringQuintaPenhaVerdeDict =
    Dict.fromList
        [ ( "pt", enteringQuintaPenhaVerde )
        , ( "en", enteringQuintaPenhaVerdeEn )
        ]


getEnteringQuintaPenhaVerde : String
getEnteringQuintaPenhaVerde =
    """
![pic500](img/penhaVerde1.png)


Fundada por D. João de Castro e mais tarde acrescentada por mais um pedaço o Alto de Santa Catarina
foi outrora designada Tapada da Quinta da Penha Verde, a que pertencia, e à qual se liga , por um arco muito elegante, que passa sobre a estrada.

![pic500](img/penhaVerde2.png)


Muitos artistas admiraram a beleza desta estrada e a aproximação do portão da quinta da Penha Verde, expressando-o na sua pintura ou traçado.

A Quinta da Penha Verde é referenciada por exemplo por Eça de Queirós em “O Primo Basílio”, 1878, que localizava, “ (…) as sestas quentes, nas sombras da Penha Verde, ouvindo o rumor fresco e gotejante das águas que vão de pedra em pedra (…) ”.
    """


enteringQuintaPenhaVerde : List String
enteringQuintaPenhaVerde =
    [ getEnteringQuintaPenhaVerde ]


enteringQuintaPenhaVerdeFromDesvioQuintaDasSequoiasDict : Dict String (List String)
enteringQuintaPenhaVerdeFromDesvioQuintaDasSequoiasDict =
    Dict.fromList
        [ ( "pt", enteringQuintaPenhaVerdeFromDesvioQuintaDasSequoias )
        , ( "en", enteringQuintaPenhaVerdeFromDesvioQuintaDasSequoiasEn )
        ]


enteringQuintaPenhaVerdeFromDesvioQuintaDasSequoias : List String
enteringQuintaPenhaVerdeFromDesvioQuintaDasSequoias =
    [ "Colares fica na direcção oposta" ++ "\n\n" ++ getEnteringQuintaPenhaVerde ]


enteringDesvioQuintaSequoiasDict : Dict String (List String)
enteringDesvioQuintaSequoiasDict =
    Dict.fromList
        [ ( "pt", enteringDesvioQuintaSequoias )
        , ( "en", enteringDesvioQuintaSequoiasEn )
        , ( "vi", NarrativeObsOne.enteringDesvioQuintaSequoiasVi )
        , ( "vw", NarrativeObsTwo.enteringDesvioQuintaSequoiasVw )
        ]


getEnteringDesvioQuintaSequoias : String
getEnteringDesvioQuintaSequoias =
    """
À tua esquerda fica o desvio para a Quinta das Sequoías ( que bem merece  uma visita ).
Deves no entanto seguir em frente em direcção a Colares.

![pic500](img/desvioSequoias.png)

Do outro lado da estrada , junto a uma bonita cascata , vês um  fotógrafo na prática da sua arte !

![pic500](img/desvioSequoias2.png)
        """


enteringDesvioQuintaSequoias : List String
enteringDesvioQuintaSequoias =
    [ getEnteringDesvioQuintaSequoias ]


enteringQuintinhaMonserrateDict : Dict String (List String)
enteringQuintinhaMonserrateDict =
    Dict.fromList
        [ ( "pt", enteringQuintinhaMonserrate )
        , ( "en", enteringQuintinhaMonserrateEn )
        , ( "vi", NarrativeObsOne.enteringQuintinhaMonserrateVi )
        , ( "vw", NarrativeObsTwo.enteringQuintinhaMonserrateVw )
        ]


enteringQuintinhaMonserrate : List String
enteringQuintinhaMonserrate =
    [ """
![pic500](img/quintinhaMonserrate3.png)


A Quintinha de Monserrate é uma quinta pedagógica, situada a menos de três quilómetros do centro histórico de Sintra, em que se recria o tradicional e pitoresco ambiente agrícola da região para dar a conhecer a herança cultural local.


![pic500](img/quintinhaMonserrate11.png)

Foi, em tempos, uma pequena exploração rural que serviu o Parque e Palácio de Monserrate, propriedade de que é adjacente.
    """
    ]


enteringFonteDeMataAlvaDict : Dict String (List String)
enteringFonteDeMataAlvaDict =
    Dict.fromList
        [ ( "pt", enteringFonteDeMataAlva )
        , ( "en", enteringFonteDeMataAlvaEn )
        ]


enteringFonteDeMataAlva : List String
enteringFonteDeMataAlva =
    [ """
![pic500](img/fonteDeMataAlva.png)

Fonte de aspecto curioso , construída no sec. XVIII e remodelada em 1875 por Sir Francis Cook.


Restaurada pela câmara municipal em ... adquiriu um aspecto diferente devido essencialmente aos painéis de azulejos incrustados no alçado e muros que a compõem.
    """
    ]


viewQuestionAtFonteMataAlvaDict : Dict String (List String)
viewQuestionAtFonteMataAlvaDict =
    Dict.fromList
        [ ( "pt", viewQuestionAtFonteMataAlva )
        , ( "en", viewQuestionAtFonteMataAlvaEn )
        ]


viewQuestionAtFonteMataAlva : List String
viewQuestionAtFonteMataAlva =
    [ """
Em que ano foi restaurada a Fonte de Mata-Alva ?
( podes prosseguir sem responder mas não poderás terminar o jogo sem o fazer ...)
    """
    ]


enteringParquePalacioMonserrateDict : Dict String (List String)
enteringParquePalacioMonserrateDict =
    Dict.fromList
        [ ( "pt", enteringParquePalacioMonserrate )
        , ( "en", enteringParquePalacioMonserrateEn )
        ]


enteringParquePalacioMonserrate : List String
enteringParquePalacioMonserrate =
    [ """
![pic500](img/palacioMonserrate_.png)


"A quatro quilómetros do centro histórico de Sintra, situam-se o Palácio e o Parque de Monserrate, testemunhos ímpares dos ecletismos do século XIX, onde os motivos exóticos e vegetalistas da decoração interior se prolongam harmoniosamente no exterior."


![](img/parqueMonserrate.png)

"O relvado fronteiro ao palácio permite o descanso merecido, durante a descoberta de um dos mais ricos jardins botânicos portugueses e uma das mais belas criações paisagísticas do Romantismo em Portugal."

     """
    ]


infoParquePalacioMonserrateDict : Dict String (List String)
infoParquePalacioMonserrateDict =
    Dict.fromList
        [ ( "pt", infoParquePalacioMonserrate )
        , ( "en", infoParquePalacioMonserrateEn )
        ]


infoParquePalacioMonserrate : List String
infoParquePalacioMonserrate =
    [ """
![pic500](img/infoParquePalacioMonserrate.png)


"A Quinta de Monserrate foi arrendada por Gerard de Visme (1789), rico comerciante inglês, que aí construiu uma casa em estilo neogótico. William Beckford subarrendou Monserrate em 1793-1794 mas, em 1809, quando Lord Byron visita a propriedade, a casa já estava em ruínas. O aspeto sublime da propriedade foi fonte de inspiração para o poeta, que cantou Monserrate na sua obra Childe Harold’s Pilgrimage, após o que a quinta se tornou num local de visita obrigatória de viajantes estrangeiros, sobretudo ingleses, que o descreveram em inúmeros relatos de viagens e o ilustraram em gravuras.


Um dos visitantes famosos foi Francis Cook ... A aquisição efetiva da propriedade acontece em 1863, iniciando, com o arquiteto James Knowles, a transformação do que restava da casa de De Visme. O Palácio de Monserrate, que exibe, na sua decoração, influências medievais e orientalizantes, é, com o Palácio da Pena, um dos mais importantes exemplos da arquitetura romântica em Portugal."



"Os jardins circundantes receberam espécies vindas de todo o mundo e foram organizados por áreas geográficas, de que se salienta o do México, refletindo as diversas origens das plantas e compondo cenários ao longo de caminhos, por entre ruínas, recantos, lagos e cascatas. É assim, graças à intervenção do pintor William Stockdale e do mestre jardineiro Francis Burt e, acima de tudo, ao espírito romântico de Francis Cook, que podemos hoje encontrar o Parque de Monserrate tal como ele é. Nos diversos jardins encontram-se cenários contrastantes onde – ao longo de caminhos sinuosos e em convívio com espécies espontâneas da região (como os medronheiros de porte arbóreo, os azevinhos e os imponentes sobreiros) – surgem ancestrais araucárias e palmeiras, fetos arbóreos de Austrália e Nova Zelândia e agaves e yuccas que recriam um cenário do México. Neste passeio pelos cinco continentes através da botânica também se destacam as camélias, azáleas, rododendros e bambus, evocando um jardim do Japão.


O Parque e Palácio de Monserrate foram classificados como Imóvel de Interesse Público em 1975, integrando-se na Paisagem Cultural de Sintra, classificada pela UNESCO como Património Mundial da Humanidade desde 1995."
    """
    ]


enteringFonteDosLadroesDict : Dict String (List String)
enteringFonteDosLadroesDict =
    Dict.fromList
        [ ( "pt", enteringFonteDosLadroes )
        , ( "en", enteringFonteDosLadroesEn )
        , ( "vi", NarrativeObsOne.enteringFonteDosLadroesVi )
        ]


enteringFonteDosLadroes : List String
enteringFonteDosLadroes =
    [ """
![pic500](img/fonteDosLadroes.png)

Fonte e Cascata dos Ladrões - " O nome deriva do facto ( ou dos rumores )  de em  tempos idos aqui supostamente terem acontecido emboscadas aos mercadores que se deslocavam a Colares com as suas mercadorias.

Desconhece-se a data da sua origem.

Quando foi restaurada em 1988 foi encontrada a sua fonte original tendo o projecto inicial sofrido certas alterações a fim de manter intactas a sua forma original e fazer o restauro e posterior enquadramento. É uma fonte relativamente pequena que tem água o ano inteiro apesar de no Verão apenas correr um fiozinho de água. Em cima tem o brasão Real de D. Maria I em pedra."


![](img/cascataDosLadroes.png)
    """
    ]


enteringSintra1914Dict : Dict String (List String)
enteringSintra1914Dict =
    Dict.fromList
        [ ( "pt", enteringSintra1914 )
        , ( "en", enteringSintra1914En )

        --  , ("vi" , NarrativeObsOne.enteringSintra1914Vi )
        --  , ("vw" , NarrativeObsTwo.enteringSintra1914Vw )
        ]


enteringSintra1914 : List String
enteringSintra1914 =
    [ """
Um pouco para Sul , no meio da vegetação , vês algo que parece um respiradouro , ou antiga fonte , datado de 1914 ...
    """
    ]


hintForPlayerOneSintra1914NoPhotoDict : Dict String (List String)
hintForPlayerOneSintra1914NoPhotoDict =
    Dict.fromList
        [ ( "pt", hintForPlayerOneSintra1914NoPhoto )
        , ( "en", hintForPlayerOneSintra1914NoPhotoEn )
        ]


hintForPlayerOneSintra1914NoPhoto : List String
hintForPlayerOneSintra1914NoPhoto =
    [ """
Interrogas-te porque motivo o teu portfolio não contem nenhuma foto deste local ...
1914 ? Cerca de um século atrás ... Esta data recorda-te de algo ...
    """
    ]


enteringSintra1914CameraWithPhotoInsideOnTheGroundDict : Dict String (List String)
enteringSintra1914CameraWithPhotoInsideOnTheGroundDict =
    Dict.fromList
        [ ( "pt", enteringSintra1914CameraWithPhotoInsideOnTheGround )
        , ( "en", enteringSintra1914CameraWithPhotoInsideOnTheGroundEn )
        ]


enteringSintra1914CameraWithPhotoInsideOnTheGround : List String
enteringSintra1914CameraWithPhotoInsideOnTheGround =
    [ """
Sintra 1914 ! Reparas numa camara estenopeica previamente utilizada  no chao
    """
    ]


enteringSintra1914PhotographyAppearsDict : Dict String (List String)
enteringSintra1914PhotographyAppearsDict =
    Dict.fromList
        [ ( "pt", enteringSintra1914PhotographyAppears )
        , ( "en", enteringSintra1914PhotographyAppearsEn )
        ]


enteringSintra1914PhotographyAppears : List String
enteringSintra1914PhotographyAppears =
    [ """
Sintra 1914. Reparas numa  camara estenopeica em exposição prolongada. Parece altura apropriada para tapar o pequeno orificio e terminar a exposição.
    """
    ]


settingUpPinholeCameraAtSintra1914Dict : Dict String (List String)
settingUpPinholeCameraAtSintra1914Dict =
    Dict.fromList
        [ ( "pt", settingUpPinholeCameraAtSintra1914 )
        , ( "en", settingUpPinholeCameraAtSintra1914En )
        , ( "vi", NarrativeObsOne.settingUpPinholeCameraAtSintra1914Vi )
        , ( "vw", NarrativeObsTwo.settingUpPinholeCameraAtSintra1914Vw )
        ]


settingUpPinholeCameraAtSintra1914 : List String
settingUpPinholeCameraAtSintra1914 =
    [ """
Este parece ser um bom local para deixar a camera estenopeica em exposição prolongada ...
    """
    ]


enteringLimiteSaoMartinhoColaresDict : Dict String (List String)
enteringLimiteSaoMartinhoColaresDict =
    Dict.fromList
        [ ( "pt", enteringLimiteSaoMartinhoColares )
        , ( "en", enteringLimiteSaoMartinhoColaresEn )
        ]


enteringLimiteSaoMartinhoColares : List String
enteringLimiteSaoMartinhoColares =
    [ """
![](img/estradaVelhaColares__.png)

Final da Freguesia de São Martinho e início da freguesia de Colares ( e vice-versa) !

![pic500](img/limiteSaoMartinhoColares.png)

É possível observar as placas toponímicas que indicam Rua Barbosa du Bocage para Este e Estrada Nova da Rainha para Oeste !
    """
    ]


viewQuestionOneAtLimiteSaoMartinhoColaresDict : Dict String (List String)
viewQuestionOneAtLimiteSaoMartinhoColaresDict =
    Dict.fromList
        [ ( "pt", viewQuestionOneAtLimiteSaoMartinhoColares )
        , ( "en", viewQuestionOneAtLimiteSaoMartinhoColaresEn )
        ]


viewQuestionOneAtLimiteSaoMartinhoColares : List String
viewQuestionOneAtLimiteSaoMartinhoColares =
    [ """
No placard 'Leve Colares no Coração' no canto inferior direito está indicado o autor do placard e uma data (ano).
Indique o nome e a data. ( Exemplo : Barbosa Bocage 1980)

( podes prosseguir sem responder mas não poderás terminar o jogo sem o fazer ...)
    """
    ]


viewQuestionTwoAtLimiteSaoMartinhoColaresDict : Dict String (List String)
viewQuestionTwoAtLimiteSaoMartinhoColaresDict =
    Dict.fromList
        [ ( "pt", viewQuestionTwoAtLimiteSaoMartinhoColares )
        , ( "en", viewQuestionTwoAtLimiteSaoMartinhoColaresEn )
        ]


viewQuestionTwoAtLimiteSaoMartinhoColares : List String
viewQuestionTwoAtLimiteSaoMartinhoColares =
    [ """
Nas placas toponímicas 'Rua Barbosa du Bocage' e 'Estrada Nova da Rainha' qual o nome e data ( ano )
indicados no canto inferior direito ( Exemplo : Barbosa Bocage 1980)

( podes prosseguir sem responder mas não poderás terminar o jogo sem o fazer ...)
    """
    ]


viewQuestionWhenNotAtTheRightLocationDict : Dict String (List String)
viewQuestionWhenNotAtTheRightLocationDict =
    Dict.fromList
        [ ( "pt", [ "Por Favor diriga-se para o local onde a pergunta originalmente se encontra por forma a poder responder !" ] )
        , ( "en", [ "Please move to the point where the question is located in order to be able to answer it !" ] )
        ]


enteringEugariaDict : Dict String (List String)
enteringEugariaDict =
    Dict.fromList
        [ ( "pt", enteringEugaria )
        , ( "en", enteringEugariaEn )
        ]


enteringEugaria : List String
enteringEugaria =
    [ """
![pic500](img/eugaria.png)

Pequena aldeia rústica na encosta Norte da Serra , que alguem descreveu como "uma das ultimas aldeias genuínas da área de Lisboa"

Aqui fica localizado o artístico Casal dos Olhos de Pancho Guedes  ou o Casal da Serrana onde viveu Alfredo Keil


À esquerda fica o Caminho de Rio de Milho que sobe em direcção a Gigarós , Convento (Quinta) do Carmo  e o Caminho do Rio Velho

![](img/eugaria2.png)
    """
    ]


enteringQuintaDoVinagreDict : Dict String (List String)
enteringQuintaDoVinagreDict =
    Dict.fromList
        [ ( "pt", enteringQuintaDoVinagre )
        , ( "en", enteringQuintaDoVinagreEn )
        ]


enteringQuintaDoVinagre : List String
enteringQuintaDoVinagre =
    [ """
![pic500](img/rioMacasQuintaVinagre.png)

Rio das Macas na Quinta do Vinagre !

![pic500](img/rioMacasQuintaVinagre2.png)
    """
    ]


enteringColaresDict : Dict String (List String)
enteringColaresDict =
    Dict.fromList
        [ ( "pt", enteringColares )
        , ( "en", enteringColaresEn )
        ]


enteringColares : List String
enteringColares =
    [ """
Colares !
    """
    ]


leavingLargoCarlosFrancaDict : Dict String (List String)
leavingLargoCarlosFrancaDict =
    Dict.fromList
        [ ( "pt", leavingLargoCarlosFranca )
        , ( "en", leavingLargoCarlosFrancaEn )
        ]


leavingLargoCarlosFranca : List String
leavingLargoCarlosFranca =
    [ """
![pic500](img/ruaBarbosaduBocage.png)


Abandonas o largo Carlos França em direcção a Oeste e rapidamente te encontras numa estreita rua ladeada de muros.


À esquerda vês uma bela cascata e um pouco mais à frente a Quinta da Regaleira

![pic500](img/cascataPisoes.png)
"""
    ]


returningToRuaBarbosaDoBocageInicioDict : Dict String (List String)
returningToRuaBarbosaDoBocageInicioDict =
    Dict.fromList
        [ ( "pt", returningToRuaBarbosaDoBocageInicio )
        , ( "en", returningToRuaBarbosaDoBocageInicioEn )
        ]


returningToRuaBarbosaDoBocageInicio : List String
returningToRuaBarbosaDoBocageInicio =
    [ """
![](img/ruaBarbosaduBocageBack.png)


Colares fica na direcção oposta.

Encontras-te agora numa rua estreita ladeada de muros. À tua direita fica a Quinta da Regaleira
e um pouco mais à frente uma impressionante cascata !
       """
    ]


talkToSintraWiseManDict : Dict String (List String)
talkToSintraWiseManDict =
    Dict.fromList
        [ ( "pt", talkToSintraWiseMan )
        , ( "en", talkToSintraWiseManEn )
        , ( "vi", NarrativeObsOne.talkToSintraWiseManVi )
        , ( "vw", NarrativeObsTwo.talkToSintraWiseManVw )
        ]


talkToSintraWiseMan : List String
talkToSintraWiseMan =
    [ """O Sábio de Sintra é naturalmente um conhecedor da região , pelo que lhe perguntas :  Sabe se esta Rua Barbosa du Bocage que aqui se inicia é a 'famosa' "Estrada Velha de Colares" ? .... """
    , "O Sábio responde Sim com efeito esta é a estrada que segue em direcção a Colares e é conhecida como Estrada Velha de Colares ...."
    , """Foi mandada construir pelo Marquês de Pombal e teve uma enorme importância nas ligações entre Sintra e Colares.

É uma bela estrada , bastante antiga , rodeada de belas quintas e com uma deslumbrante paisagem .... """
    , """Merece seguramente um calmo e longo passeio para apreciar tudo aquilo que tem a oferecer !

Segue a pé ou de bicicleta e não tenhas pressa ... Reflecte sobre cada um dos pontos por onde passares e presta sempre muita atenção ao que as pessoas te dizem"""
    ]


helpfulNotesAppearDict : Dict String (List String)
helpfulNotesAppearDict =
    Dict.fromList
        [ ( "pt", helpfulNotesAppear )
        , ( "en", helpfulNotesAppearEn )
        ]


helpfulNotesAppear : List String
helpfulNotesAppear =
    [ """
Reparas que  praticamente já preencheste uma folha inteira com apontamentos valiosos .... !
    """
    , " "
    ]


talkToTuristAtPalacioSeteaisDict : Dict String (List String)
talkToTuristAtPalacioSeteaisDict =
    Dict.fromList
        [ ( "pt", talkToTuristAtPalacioSeteais )
        , ( "en", talkToTuristAtPalacioSeteaisEn )
        ]


talkToTuristAtPalacioSeteais : List String
talkToTuristAtPalacioSeteais =
    [ """
O turista parece bastante simpático e muito contente por visitar a Bonita Vila de Sintra. Cumprimenta-te cordialmente e após uma pequena conversa segue o seu caminho.
    """
    ]


talkToPhotographerDict : Dict String (List String)
talkToPhotographerDict =
    Dict.fromList
        [ ( "pt", talkToPhotographer )
        , ( "en", talkToPhotographerEn )
        , ( "vi", NarrativeObsOne.talkToPhotographerVi )
        , ( "vw", NarrativeObsTwo.talkToPhotographerVw )
        ]


talkToPhotographer : List String
talkToPhotographer =
    [ """
O fotógrafo é habitual na região onde passa semanalmente muitas horas a fotografar.
Conta-te muitos segredos sobre a fantástica Serra de Sintra e algumas das técnicas que utiliza ! ....
      """
    , """
Um dos tipos de Fotografia sobre o qual te fala , deixa-te positivamente surpreendido : A fotografia estenopeica ....
       """
    , """
"A concepção das camaras fotográficas é sempre similar. Trata-se simplesmente de uma caixa, com um pedaço de filme ( ou um sensor no caso das digitais ) numa face e uma abertura na outra.
Esta abertura é construída de forma a permitir que a luz entre na caixa, atingindo a superfície quimicamente sensível do filme ( ou do sensor ). É assim que se produz a fotografia. Todas as câmaras, da mais  primitiva à mais sofisticada funcionam dessa forma."
       """
    , """
Conta-te ainda sobre o sábio de Colares , nascido há cerca de um século , conhecedor de muitos segredos da região , e um grande coleccionador de antiguidades e de fotografia estenopeica
       """
    ]


viewTotemAtQuintinhaMonserrateDict : Dict String (List String)
viewTotemAtQuintinhaMonserrateDict =
    Dict.fromList
        [ ( "pt", viewTotemAtQuintinhaMonserrate )
        , ( "en", viewTotemAtQuintinhaMonserrateEn )
        ]


viewTotemAtQuintinhaMonserrate : List String
viewTotemAtQuintinhaMonserrate =
    [ """
![](img/totem.png)

Escultura com 7,5m de altura e 3m de diâmetro médio, esculpida com motosserra a partir de um tronco de um Eucalipto monumental que teve que ser abatido.

Valores naturais da Serra de Sintra representados no totem:

Águia-de-bonelli (Aquila fasciata)

Coruja-do-mato (Strix aluco)

Bufo-real (Bubo bubo)

Morcego-de-ferradura-pequeno (Rhinolophus hipposideros)

Geneta (Genetta genetta)

Aranha-vespa (Argiope bruennichi)

Fritilária-dos-pântanos (Euphydryas aurinia)

Saca-rabos (Herpestes ichneumon)

Víbora-cornuda (Vipera latastei)

Vaca-loura (Lucanus cervus)

Salamandra-de-pintas-amarelas (Salamandra salamandra)

Texugo (Meles meles)

Floresta nativa
    """
    ]


viewSeveralAnimalsAtQuintinhaMonserrateDict : Dict String (List String)
viewSeveralAnimalsAtQuintinhaMonserrateDict =
    Dict.fromList
        [ ( "pt", viewSeveralAnimalsAtQuintinhaMonserrate )
        , ( "en", viewSeveralAnimalsAtQuintinhaMonserrateEn )
        ]


viewSeveralAnimalsAtQuintinhaMonserrate : List String
viewSeveralAnimalsAtQuintinhaMonserrate =
    [ """
![pic500](img/animaisMonserrate.png)

vários animais da Quintinha de Monserrate
    """
    ]


talkToTotemShaperQuintinhaMonserrateDict : Dict String (List String)
talkToTotemShaperQuintinhaMonserrateDict =
    Dict.fromList
        [ ( "pt", talkToTotemShaperQuintinhaMonserrate )
        , ( "en", talkToTotemShaperQuintinhaMonserrateEn )
        , ( "vi", NarrativeObsOne.talkToTotemShaperQuintinhaMonserrateVi )
        , ( "vw", NarrativeObsTwo.talkToTotemShaperQuintinhaMonserrateVw )
        ]


talkToTotemShaperQuintinhaMonserrate : List String
talkToTotemShaperQuintinhaMonserrate =
    [ """
Curiosa artista galesa , de seu nome Nansi Hemming ,  faz-te uma descrição detalhada da trabalhosa arte de esculpir madeira com uma moto-serra ,
e da forma como trabalhou durante 10 dias no tronco do eucalipto com cerca de 100 anos
      """
    , """
impressionante o Totem da Quintinha de Monserrate que representa agora alguns dos principais valores naturais da Serra de Sintra.
     """
    ]


birdsNestOfferedByTotemShaperDict : Dict String (List String)
birdsNestOfferedByTotemShaperDict =
    Dict.fromList
        [ ( "pt", birdsNestOfferedByTotemShaper )
        , ( "en", birdsNestOfferedByTotemShaperEn )
        ]


birdsNestOfferedByTotemShaper : List String
birdsNestOfferedByTotemShaper =
    [ """
Ao aperceber-se que estás em caminhada pela Estrada Velha de Colares a escultora oferece-te um ninho de pássaro
dando-te indicações sobre como encontrar um local propício onde deverás instalar o ninho !  ....
     """
    , """
       """
    ]


talkToGeocacherEugariaDict : Dict String (List String)
talkToGeocacherEugariaDict =
    Dict.fromList
        [ ( "pt", talkToGeocacherEugaria )
        , ( "en", talkToGeocacherEugariaEn )
        , ( "vi", NarrativeObsOne.talkToGeocacherEugariaVi )
        , ( "vw", NarrativeObsTwo.talkToGeocacherEugariaVw )
        ]


talkToGeocacherEugaria : List String
talkToGeocacherEugaria =
    [ """
O geocacher está em reconhecimento do terreno e informa-te que procura uma cache há muito escondida
por estes lados e nunca encontrada por ninguém. Circulam rumores de que apenas o sábio de Colares
poderá dar mais indicações sobre o seu paradeiro !

O geocacher é também um grande entusiasta do estudo e  observação de aves dedicando largas horas a fotografá-las no seu habitat natural !
     """
    ]


offerBirdsNestToGeocacherDict : Dict String (List String)
offerBirdsNestToGeocacherDict =
    Dict.fromList
        [ ( "pt", offerBirdsNestToGeocacher )
        , ( "en", offerBirdsNestToGeocacherEn )
        ]


offerBirdsNestToGeocacher : List String
offerBirdsNestToGeocacher =
    [ """
Ao aperceberes-te de que o geocacher é um estudioso de aves decides que ele será a pessoa mais indicada para a instalacao do ninho.

Entregas-lhe o ninho dizendo que tens total confiança na sua capacidade de escolher um bom spot para o instalar.

O geocacher mostra-se agradecido e em troca decide entregar-te um livro de poemas de Bocage.
Ainda que saiba perfeitamente que o Bocage a que se refere a estrada não é o poeta , costuma sempre trazer o livro na sua mochila quando vem para estes lados !
     """
    ]


talkToWiseManColaresDict : Dict String (List String)
talkToWiseManColaresDict =
    Dict.fromList
        [ ( "pt", talkToWiseManColares )
        , ( "en", talkToWiseManColaresEn )
        ]


talkToWiseManColares : List String
talkToWiseManColares =
    [ """
Bem vindo a minha casa jovem investigador !
      """
    ]


talkToWiseManColaresWhenNotInColaresDict : Dict String (List String)
talkToWiseManColaresWhenNotInColaresDict =
    Dict.fromList
        [ ( "pt", [ "Por favor dirige-te para Colares por forma a poderes falar com o Sábio de Colares" ] )
        , ( "en", [ "Please move to Colares in order to be able to speak with wiseManColares" ] )
        ]


offerCameraAndPhotography1Sintra1914ToWiseManColaresDict : Dict String (List String)
offerCameraAndPhotography1Sintra1914ToWiseManColaresDict =
    Dict.fromList
        [ ( "pt", offerCameraAndPhotography1Sintra1914ToWiseManColares )
        , ( "en", offerCameraAndPhotography1Sintra1914ToWiseManColaresEn )
        , ( "vi", NarrativeObsOne.offerCameraAndPhotography1Sintra1914ToWiseManColaresVi )
        , ( "vw", NarrativeObsTwo.offerCameraAndPhotography1Sintra1914ToWiseManColaresVw )
        ]


offerCameraAndPhotography1Sintra1914ToWiseManColares : List String
offerCameraAndPhotography1Sintra1914ToWiseManColares =
    [ """O sábio mostra-se muito agradecido pela tua oferta. Há muitos anos que coleciona este tipo de fotografia.

De seguida explica porque motivo tanto gosta deste tipo de fotografia :
"Sabes , não se trata de não apreciar a fotografia moderna, porque de facto aprecio
, penso que as camaras digitais possibilitaram a milhões de pessoas experimentar
e divertirem-se com a Fotografia
mas de uma certa forma também faz com que as pessoas clickem de forma indiscriminada, automatizada ...
com a fotografia estenopeica , por exemplo , as pessoas pensavam bastante mais antes de tirar uma fotografia
. É de certa forma mais parecido com a actividade de pintar uma tela ! "
      """
    ]


offerPoemsBookToWiseManColaresDict : Dict String (List String)
offerPoemsBookToWiseManColaresDict =
    Dict.fromList
        [ ( "pt", offerPoemsBookToWiseManColares )
        , ( "en", offerPoemsBookToWiseManColaresEn )
        ]


offerPoemsBookToWiseManColares : List String
offerPoemsBookToWiseManColares =
    [ """
O sábio mostra-se muito agradecido pela tua oferta.
      """
    ]


wiseManTalksAboutSintraDict : Dict String (List String)
wiseManTalksAboutSintraDict =
    Dict.fromList
        [ ( "pt", wiseManTalksAboutSintra )
        , ( "en", wiseManTalksAboutSintraEn )
        , ( "vi", NarrativeObsOne.wiseManTalksAboutSintraVi )
        , ( "vw", NarrativeObsTwo.wiseManTalksAboutSintraVw )
        ]


wiseManTalksAboutSintra : List String
wiseManTalksAboutSintra =
    [ """
O sábio de Colares estava por esta altura num excelente estado de espírito e
começa a falar animadamente sobre Sintra :

"Sabes que Sintra foi um palco priveligiado do Romantismo e  foi também um local
por onde passaram e conviveram muito diferentes pessoas e culturas , que há sua maneira ,
umas mais outras menos marcaram este lugar . Não é assim difícil de imaginar que por aqui
tenham existido grandes Paixões , Alianças , Traições ... e consequentemente .... Segredos ........ "
   """
    , """

respondes : " sim , eu sei ,  estou a gostar muito de o ouvir , e quero escutar tudo o que tem para dizer ...

 mas há um mistério em particular para o qual gostaria de contar com a sua ajuda ?

Esta estrada que acabei de percorrer parece ter três designações distintas :
  - Estrada Velha de Colares
  - Rua Barbosa du Bocage
  - Estrada Nova da Rainha

...
  "
      """
    , """
"Ohhh ... apenas isso ? Não precisas da minha ajuda para solucionar esse mistério ... Quem cria e afixa essas placas toponímicas ???
. És Inteligente . A tua explicação é tão boa como a minha . Se queres o meu conselho : Não te preocupes muito com isso .
Como sabes e bem conheces existe um sistema fabuloso que permite identificar inequivocamente cada
palmo à face da Terra pelas suas coordenadas de latitude e longitude ... Seja ele  GPS , Glonass , Beidou, IRNSS , GALILEO  , sabes do que estou a falar ....
concentra-te nisso e esquece nomes de Ruas ...  "
      """
    , """
"... mas já que gostas de mistérios de alguma forma relacionados com Estradas vou então apresentar-te um Enigma final.


Vou mostrar-te algumas fotografias bem como dar-te acesso ao ponto de vista de algumas pessoas ( ou grupos de pessoas )
sobre a tua jornada de hoje na Estrada Velha de Colares ! (  settings - linguagem )

Se adivinhares correctamente qual a solução do puzzle ( uma palavra ) partilharei contigo a localização de um tesouro muito especial escondido na Serra ... "
      """
    , """
...
      """
    ]


wiseManShowsFinalQuestionDict : Dict String (List String)
wiseManShowsFinalQuestionDict =
    Dict.fromList
        [ ( "pt", wiseManShowsFinalQuestion )
        , ( "en", wiseManShowsFinalQuestionEn )
        ]


wiseManShowsFinalQuestion : List String
wiseManShowsFinalQuestion =
    [ """
O sábio apresenta-te o puzzle final ...
      """
    ]


viewPhotosEstradaVelhaColaresDict : Dict String (List String)
viewPhotosEstradaVelhaColaresDict =
    Dict.fromList
        [ ( "pt", viewPhotosEstradaVelhaColares )
        , ( "en", viewPhotosEstradaVelhaColares )

        --, ("vi" , viewPhotosEstradaVelhaColares  )
        --, ("vw" , viewPhotosEstradaVelhaColares  )
        ]


viewPhotosEstradaVelhaColares : List String
viewPhotosEstradaVelhaColares =
    [ """
![pic600](img/estradaVelhaDeColaresCollage1.png)

Algumas fotografias da Estrada Velha de Colares

![pic600](img/estradaVelhaDeColaresCollage2.png)
      """
    ]


viewQuestionAtColaresDict : Dict String (List String)
viewQuestionAtColaresDict =
    Dict.fromList
        [ ( "pt", viewQuestionAtColares )
        , ( "en", viewQuestionAtColaresEn )
        ]


viewQuestionAtColares : List String
viewQuestionAtColares =
    [ """
Pensa cuidadosamente sobre tudo o que te foi revelado
e escreve na folha de papel  a resposta ...
      """
    ]


questionAtColaresAdditionalTextDict : Dict String String
questionAtColaresAdditionalTextDict =
    -- we're going to write only on the backend and then it will get written to the storyLine via additionalTextDict
    Dict.fromList
        [ ( "pt", "" )
        , ( "en", "" )
        ]


talkToWiseManAfterQuestionColaresAppearsDict : Dict String (List String)
talkToWiseManAfterQuestionColaresAppearsDict =
    Dict.fromList
        [ ( "pt", talkToWiseManAfterQuestionColaresAppears )
        , ( "en", talkToWiseManAfterQuestionColaresAppearsEn )
        ]


talkToWiseManAfterQuestionColaresAppears : List String
talkToWiseManAfterQuestionColaresAppears =
    [ """
Pensa cuidadosamente sobre tudo o que te foi revelado
e escreve na folha de papel  a resposta ...
      """
    ]


talkToWiseManAfterQuestionColaresCorrectlyAnsweredButStillSomeTasksToDoDict : Dict String (List String)
talkToWiseManAfterQuestionColaresCorrectlyAnsweredButStillSomeTasksToDoDict =
    Dict.fromList
        [ ( "pt", talkToWiseManAfterQuestionColaresCorrectlyAnsweredButStillSomeTasksToDo )
        , ( "en", talkToWiseManAfterQuestionColaresCorrectlyAnsweredButStillSomeTasksToDo )
        ]


talkToWiseManAfterQuestionColaresCorrectlyAnsweredButStillSomeTasksToDo : List String
talkToWiseManAfterQuestionColaresCorrectlyAnsweredButStillSomeTasksToDo =
    [ """
"Gostaria de te entregar um Papel Antigo mas penso que ainda tens algumas questões a responder ao longo do percurso ..."
      """
    ]


talkToWiseManAfterQuestionColaresCorrectlyAnsweredDict : Dict String (List String)
talkToWiseManAfterQuestionColaresCorrectlyAnsweredDict =
    Dict.fromList
        [ ( "pt", talkToWiseManAfterQuestionColaresCorrectlyAnswered )
        , ( "en", talkToWiseManAfterQuestionColaresCorrectlyAnsweredEn )
        ]


talkToWiseManAfterQuestionColaresCorrectlyAnswered : List String
talkToWiseManAfterQuestionColaresCorrectlyAnswered =
    [ """
"Parabéns ! Revelaste ser uma pessoa de imensa perspicácia e inteligência !

Aqui tens um papel com informação importante ...

Boa Sorte para a jornada que agora se inicia ! "
      """
    ]


takeGpsDict : Dict String (List String)
takeGpsDict =
    Dict.fromList
        [ ( "pt", takeGps )
        , ( "en", takeGpsEn )
        ]


takeGps : List String
takeGps =
    [ "Guardas cuidadosamente o Gps " ]


lookAtGpsDict : Dict String (List String)
lookAtGpsDict =
    Dict.fromList
        [ ( "pt", lookAtGps )
        , ( "en", lookAtGpsEn )
        ]


lookAtGps : List String
lookAtGps =
    [ "Consultas o receptor de gps : " ]


lookAtWiseNotesDict : Dict String (List String)
lookAtWiseNotesDict =
    Dict.fromList
        [ ( "pt", lookAtWiseNotes )
        , ( "en", lookAtWiseNotesEn )
        ]


lookAtWiseNotes : List String
lookAtWiseNotes =
    [ """
apontamentos recolhidos durante a conversa com o sábio :

- Viaja em direcção a Oeste. Em Colares deves procurar o Sábio local. Se o encontrares num bom estado de espírito certamente te ajudará na resolução do mistério ! Ouvi dizer que é um coleccionador de antiguidades ...

- Interage com outras pessoas  e ouve cuidadosamente  ( até ao final ) aquilo que te dizem . Revelar-se-à de grande utilidade na tua demanda ...

- Ao longo do caminho ser-te-ão colocadas algumas questões : pensa cuidadosamente antes de responder porque tens um número limitado de tentativas.

- se o número máximo de tentativas for atingido antes de responderes correctamente terás que reiniciar o jogo (  deves responder correctamente a todas as perguntas por forma a poder terminar o jogo )

- não pressiones botões do browser como back ou forward. A narrativa (jogo) decorre numa única página e se saires da mesma quando voltares a reentrar o jogo será reiniciado ...
    """
    ]


findingPinholeCameraDict : Dict String (List String)
findingPinholeCameraDict =
    Dict.fromList
        [ ( "pt", findingPinholeCamera )
        , ( "en", findingPinholeCameraEn )
        ]


findingPinholeCamera : List String
findingPinholeCamera =
    [ """
O que parecia ser uma vulgar lata era afinal uma das camaras estenopeicas que o fotógrafo costuma espalhar pelo terreno !

Envias uma mensagem ao fotógrafo a perguntar se podes levar a 'camara' emprestada durante algumas horas ao que este responde afirmativamente.
    """
    ]


byronsPoemMonserrateDict : Dict String (List String)
byronsPoemMonserrateDict =
    Dict.fromList
        [ ( "pt", byronsPoemMonserrate )
        , ( "en", byronsPoemMonserrateEn )
        ]


byronsPoemMonserrate : List String
byronsPoemMonserrate =
    [ """
Poema de Byron sobre Monserrate ( em Childe Harold's Pilgrimage ) :



Nos montes em declive , ou em baixo no vale

Há castelos de outrora, onde habitaram reis ;

Embora em derredor só vivam plantas bravas,

Lá persistem sinais do passado esplendor.

E eis no alto , ó Vathek , a mansão principesca ,

onde tu, o mais rico herdeiro de Inglaterra,

Formaste um breve paraíso, mal sabendo

Que onde a fútil riqueza esbanja sem medida

Nunca a paz acompanha as delícias da vida ,



Aqui moraste , e aqui sonhaste ser feliz

Vendo ao longe a montanha : a beleza imutável

Agora, este local parece amaldiçoado :

Teu palácio está só como tu próprio és só.

Um matagal enorme a custo dá passagem

Às salas sem ninguém , com seus portais abertos :

Aqui, mais uma vez, se aprende, meditando,

Como são frágeis sempre os luxos deste mundo,

Que o tempo, em seu caudal, arrasta para o fundo.
    """
    ]


theCreditsInformationDict : Dict String (List String)
theCreditsInformationDict =
    Dict.fromList
        [ ( "pt", creditsInformation )
        , ( "en", creditsInformation )
        ]


creditsInformation : List String
creditsInformation =
    [ """
### Location Info : ###

www.serradesintra.net

riodasmacas.blogspot.com

Professora Teresa Ferreira do Amaral

Parques de Sintra
(www.parquesdesintra.pt)

www.geocaching.com

### Elm Language and package ecosystem ###

Evan Czaplicki ,  Richard Feldman , Werner de Groot , Dave Keen ...

### Elm Narrative Engine : ###

Jeff Schomay

( the persons above in no way endorse this particular extension or narrative)

### extensions to the Narrative Engine : ###

Nuno Torres


### Mistério da Estrada Velha de Colares Game-Narrative ###

Nuno Torres

    """
    ]


gameHasEndedDict : Dict String (List String)
gameHasEndedDict =
    Dict.fromList
        [ ( "pt", gameHasEnded )
        , ( "en", gameHasEndedEn )
        ]


gameHasEnded : List String
gameHasEnded =
    [ """
Este jogo acabou ! Podes consultar todos os items no teu inventário ,
mas o jogo chegou ao fim ! Diverte-te !
      """
    ]
