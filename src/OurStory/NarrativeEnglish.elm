module OurStory.NarrativeEnglish exposing (..)

--import ClientTypes exposing (..)
--import Dict exposing (Dict)
{- Here is where you can write all of your story text for the english language, which keeps the Rules.elm file a little cleaner.
   The narrative that you add to a rule will be shown when that rule matches if english language is selected
   .  If you give a list of strings, each time the rule matches, it will show the next narrative in the list, which is nice for adding variety and texture to your story.
   I sometimes like to write all my narrative content first, then create the rules they correspond to.
   Note that you can use **markdown** in your text!
-}


interactingWithPlayerOneEn : List String
interactingWithPlayerOneEn =
    [ """
relentless investigator searching for the Truth ...
      """
    ]


leavingWithoutGpsEn : List String
leavingWithoutGpsEn =
    [ """
Oh dear investigator , don't leave without your gps . You might get lost
    """
    ]


leavingWithoutInteractingSabioSintraEn : List String
leavingWithoutInteractingSabioSintraEn =
    [ """
It's not advisable to move on without first talking to the Wise man and carefully listening to all he has to say ...
His precious advice will  be very helpful along the way ...
"""
    ]


returningToLargoCarlosFrancaEn : List String
returningToLargoCarlosFrancaEn =
    [ """
ahhh !!!  Nothing like returning to the starting point !
"""
    ]


enteringVillaRomaEn : List String
enteringVillaRomaEn =
    [ """
![pic500](img/villaRoma2.png)

on the sintra-colares road we find a house built in the middle of the XIX th century .
The location was mainly chosen because of the magnificent view
that made the propietary's fiancee fall in love with the place


Villa Roma was idealized and built by Carlos Morato Roma , having become Summer residence of several members of his family

In this house lived :

- Carlos Morato Roma , which was once public treasury director

- Dr. José Vicente Barbosa du Bocage , teacher , Foreign Affairs Minister and Kingdom Peer

- Carlos Roma du Bocage General , which towards the end of his career was nominated Foreign Affairs Minister of D.Manuel II , house representative and Kingdom Peer

- Dr. António Maria Barbosa , physician and an Academia Real das Ciências associate.

- Dr. José Inácio Machado de Faria e Maia , Judge , Crown Prosecution Service secretary ...
      """
    ]


getEnteringPalacioSeteaisStringEn : String
getEnteringPalacioSeteaisStringEn =
    """
![pic500](img/seteais.png)


Located in Sintra  , Seteais Palace (World Heritage Site ) , once a neoclassical palace is now  a luxury hotel and turist attraction.

It stands on a place from which you can spot the Atlantic Ocean and Serra de Sintra , namely Palácio da Pena and Castelo dos Mouros .

The palace was built on the border of what is called "Campo de Seteais" given this was a public space prior to being rented to  Diogo V. M. C. , 5th Marquis of Marialva.


It was then established  that the terrain would not be used for anything else other than public walk and/or  use  by His/Her Majestys Cavalry Guard when the Royal Family visited  Sintra .

That explains the existance of the big lawn between the entrance and the Palace !
    """


enteringPalacioSeteaisEn : List String
enteringPalacioSeteaisEn =
    [ getEnteringPalacioSeteaisStringEn ]


enteringPalacioSeteaisFromPenhaVerdeEn : List String
enteringPalacioSeteaisFromPenhaVerdeEn =
    [ "Colares is in the opposite direction" ++ "  \n  \n" ++ getEnteringPalacioSeteaisStringEn ]


warnNeedVillaRomaQuestionCorrectlyAnsweredEn : List String
warnNeedVillaRomaQuestionCorrectlyAnsweredEn =
    [ """
You need to answer the question at Villa Roma to be allowed to move on ...
    """
    ]


warnNeedSeteaisVillaRomaQuestionCorrectlyAnsweredEn : List String
warnNeedSeteaisVillaRomaQuestionCorrectlyAnsweredEn =
    [ """
You need to answer the question at Seteais about Villa Roma to be allowed to move on ...
    """
    ]


viewQuestionAtVillaRomaEn : List String
viewQuestionAtVillaRomaEn =
    [ """
Who built Villa Roma ?

A - General Carlos Roma du Bocage

B - Carlos Morato Roma
    """
    ]


viewQuestionAtSeteaisAboutVillaRomaEn : List String
viewQuestionAtSeteaisAboutVillaRomaEn =
    [ """
about Villa Roma ...

Which person of the Bocage Family lived in Villa Roma ?

A - Dr. José Vicente Barbosa du Bocage

B - Manuel Maria Barbosa du Bocage
    """
    ]


enteringRuaTrindadeCoelhoEn : List String
enteringRuaTrindadeCoelhoEn =
    [ """
![pic500](img/ruaTrindadeCoelho.png)

narrow road surrounded by farms and very old trees , some of them centenary
, that heads down towards Casa do Fauno , Caminho dos Frades e Caminho dos Castanhais

![pic500](img/ruaTrindadeCoelho2.png)
        """
    ]


playWithCatAtRuaTrindadeCoelhoEn : List String
playWithCatAtRuaTrindadeCoelhoEn =
    [ """
You should have paid attention to the sign . The cat was friendly and playfull but he also picked up your gps receiver and left with it !
You have to go back to the starting point in order to get a new one !
        """
    ]


getEnteringQuintaPenhaVerdeEn : String
getEnteringQuintaPenhaVerdeEn =
    """
![pic500](img/penhaVerde1.png)


Founded by D. João de Castro and later augmented by Alto de Santa Catarina
it was once called Tapada da Quinta da Penha Verde  , to which it belonged and connected by an Arc over the road ...

![pic500](img/penhaVerde2.png)


Several  artists have admired both the beauty of this Road and Quinta da Penha Verde by depicting the  Quinta Gates and Arc over the Road in their paintings and/or sketches ...

Quinta da Penha Verde is referenced for instance by Eça de Queirós in "O Primo Basílio", 1878 : " (…) as sestas quentes, nas sombras da Penha Verde, ouvindo o rumor fresco e gotejante das águas que vão de pedra em pedra (…) " .
    """


enteringQuintaPenhaVerdeEn : List String
enteringQuintaPenhaVerdeEn =
    [ getEnteringQuintaPenhaVerdeEn ]


enteringQuintaPenhaVerdeFromDesvioQuintaDasSequoiasEn : List String
enteringQuintaPenhaVerdeFromDesvioQuintaDasSequoiasEn =
    [ "Colares is in the opposite direction" ++ "\n\n" ++ getEnteringQuintaPenhaVerdeEn ]


getEnteringDesvioQuintaSequoiasEn : String
getEnteringDesvioQuintaSequoiasEn =
    """
To the left is the road that leads to Quinta das Sequoías ( which is well worth a visit )
You should nevertheless remain on Estrada Velha de Colares  and keep going west towards Colares .

![pic500](img/desvioSequoias.png)

On the other side of the road , near a beautiful waterfall, you see a photographer practicing his art.

![pic500](img/desvioSequoias2.png)
        """


enteringDesvioQuintaSequoiasEn : List String
enteringDesvioQuintaSequoiasEn =
    [ getEnteringDesvioQuintaSequoiasEn ]


enteringQuintinhaMonserrateEn : List String
enteringQuintinhaMonserrateEn =
    [ """
![pic500](img/quintinhaMonserrate3.png)

Quintinha de Monserrate is a pedagogical farm , less than 3 km far from  Sintra  ,
where the region's traditional agricultural environment is recreated to teach and share the local cultural heritage


![pic500](img/quintinhaMonserrate12.png)

It was once a small rural exploration to the use of Parque e Palácio de Monserrate ( a property  located next to it )
    """
    ]


enteringFonteDeMataAlvaEn : List String
enteringFonteDeMataAlvaEn =
    [ """
![](img/fonteDeMataAlva.png)

Curious looking fountain , built on the XVIII century and remodeled  in 1875 by Sir Francis Cook.


It got a new look in  ... (year it was restored by City Hall ) due to the embedded tile panels in its walls and main body.
    """
    ]


viewQuestionAtFonteMataAlvaEn : List String
viewQuestionAtFonteMataAlvaEn =
    [ """
What year was the Fountain restored ?
( you may proceed without answering but you won't be able to terminate the game without doing so ... )
    """
    ]


enteringParquePalacioMonserrateEn : List String
enteringParquePalacioMonserrateEn =
    [ """
![](img/palacioMonserrate_.png)


"Four kilometres from Sintra’s historic centre, and bearing witness to the eclectic tastes of the 19th century, are the peerless Palace and Park of Monserrate, where the exotic vegetal motifs of the building’s interior decoration extend harmoniously to the gardens outside."


![](img/parqueMonserrate.png)

"The lawn in front of the palace offers you the chance to enjoy a well-earned rest as you set about discovering one of the richest botanical gardens and one of the most beautiful Romantic landscapes ever created in Portugal."
    """
    ]


infoParquePalacioMonserrateEn : List String
infoParquePalacioMonserrateEn =
    [ """
![](img/infoParquePalacioMonserrate.png)


"The estate of Monserrate was rented by Gerard de Visme (1789), a wealthy English merchant, who built a house there in the neo-Gothic style. William Beckford then subleased Monserrate in 1793-1794, but, in 1809, when Lord Byron visited the property, the house was already in ruins. The estate’s sublime appearance was a source of inspiration for the poet, who sang of the beauty of Monserrate in his poem Childe Harold’s Pilgrimage, after which it became obligatory for foreign travellers to visit the property. This was especially true for English visitors, who made vivid descriptions of Monserrate in their countless travel reports and illustrated it in many engravings.


One of the most famous visitors was Francis Cook, another extremely wealthy English industrialist, who was later decorated by King Luís with the title of Viscount of Monserrate and subrogated the estate in 1856. The effective acquisition of the property took place in 1863, with the architect James Knowles beginning the work of transforming what remained of the house built by de Visme. Displaying distinctly medieval and oriental-style influences, the decoration of the Palace of Monserrate makes it, along with the Palace of Pena, one of the most important examples of Romantic architecture in Portugal.


Over the years, the surrounding gardens have welcomed plant species from all over the world. Organised according to geographical areas (perhaps most notably that of Mexico), the gardens reflect the diverse origins of the plants, composing different scenic effects along the paths that lead you through ruins and hidden nooks and crannies, past lakes and waterfalls. It was, therefore, thanks to the intervention of the painter William Stockdale and the master gardener Francis Burt, but above all the romantic spirit of Francis Cook, that the Park of Monserrate grew to become what it is today. In the various gardens, as you walk along winding paths and commune with spontaneously growing species from the region (such as strawberry trees, holly bushes and imposing cork-trees), you will find surprisingly contrasting scenery, with the sudden appearance of age-old araucarias and palm-trees, and tree ferns from Australia and New Zealand, as well as agaves and yuccas recreating a corner of Mexico. This walk through the botanical delights of five continents also offers you camellias, azaleas, rhododendrons and bamboos, evoking memories of a Japanese garden.


The Park and Palace of Monserrate were classified as a Property of Public Interest in 1993, and were included in the Cultural Landscape of Sintra, which has been classified by UNESCO as World Heritage since 1995."
    """
    ]


enteringFonteDosLadroesEn : List String
enteringFonteDosLadroesEn =
    [ """
![](img/fonteDosLadroes.png)


Fonte e Cascata dos Ladrões -  Named after the fact ( or rumours ) that  supposedly , long time ago, some merchants were ambushed near this place when on their way to Colares.

Date of origin is unknown.

Restored in 1988 , a lot of effort and research has been made in order to keep its original form unaltered.


It is a relatively small fountain with running water all over the year ( the flow is reduced to a small stream in the summer  )


The  Royal Coat of Arms of D.Maria I is engraved near the top of the fountain.


![](img/cascataDosLadroes.png)

    """
    ]


enteringSintra1914En : List String
enteringSintra1914En =
    [ """
To the south , among the bushes , you see what looks like a ventilation shaft , or an ancient fountain , dated 1914 ...
    """
    ]


hintForPlayerOneSintra1914NoPhotoEn : List String
hintForPlayerOneSintra1914NoPhotoEn =
    [ """
You wonder why there's no photo of this place on your portfolio ...
1914 ? about one century ago  ... The date reminds you of something ...
    """
    ]


enteringSintra1914CameraWithPhotoInsideOnTheGroundEn : List String
enteringSintra1914CameraWithPhotoInsideOnTheGroundEn =
    [ """
Sintra 1914 ! You notice a previously used pinhole camara on the ground !
    """
    ]


enteringSintra1914PhotographyAppearsEn : List String
enteringSintra1914PhotographyAppearsEn =
    [ """
Sintra 1914. You notice a pinhole camera on a long exposure . This seems to be a good time to cover the orifice and terminate the exposure !
    """
    ]


settingUpPinholeCameraAtSintra1914En : List String
settingUpPinholeCameraAtSintra1914En =
    [ """
This seems to be a good place to set up the pinhole camera for a long exposure shot
    """
    ]


enteringLimiteSaoMartinhoColaresEn : List String
enteringLimiteSaoMartinhoColaresEn =
    [ """
![](img/estradaVelhaColares__.png)

São Martinho -  Colares parish  borders  !

![img500](img/limiteSaoMartinhoColares.png)

Road signs indicate Rua Barbosa du Bocage to the East and Estrada Nova da Rainha to the West !
    """
    ]


viewQuestionOneAtLimiteSaoMartinhoColaresEn : List String
viewQuestionOneAtLimiteSaoMartinhoColaresEn =
    [ """
Please write down the name and the date (year) engraved
on the bottom right of 'Leve Colares no Coração' tile
( Exemplo : Barbosa Bocage 1980)
( you may proceed without answering but you won't be able to terminate the game without doing so ... )
    """
    ]


viewQuestionTwoAtLimiteSaoMartinhoColaresEn : List String
viewQuestionTwoAtLimiteSaoMartinhoColaresEn =
    [ """
What are the name and date painted on the bottom right  of the road signs  'Rua Barbosa du Bocage' e 'Estrada Nova da Rainha' ?
( you may proceed without answering but you won't be able to terminate the game without doing so ... )
    """
    ]


enteringEugariaEn : List String
enteringEugariaEn =
    [ """
![](img/eugaria.png)


Small rustic village located on the north slope of Serra de Sintra ,
someone once described as "one of the last True villages of Lisbon area".


Here is located the artistic "Casal dos Olhos" of Pancho Guedes or Casal da Serrana where Alfredo Keil lived.


To the south one can find Caminho de Rio de Milho which goes up towards Gigarós , Convento (Quinta) do Carmo  and Caminho do Rio Velho


![](img/eugaria2.png)
    """
    ]


enteringQuintaDoVinagreEn : List String
enteringQuintaDoVinagreEn =
    [ """
![](img/rioMacasQuintaVinagre.png)

Rio das Macas running through Quinta do Vinagre !

![](img/rioMacasQuintaVinagre2.png)
    """
    ]


enteringColaresEn : List String
enteringColaresEn =
    [ """
Colares !
    """
    ]


leavingLargoCarlosFrancaEn : List String
leavingLargoCarlosFrancaEn =
    [ """
![](img/ruaBarbosaduBocage.png)


You leave largo Carlos França heading west and quickly find yourself in a narrow road with walls on both sides.


To the left you see  an impressive waterfall and a bit  ahead is Quinta da Regaleira !

![](img/cascataPisoes.png)
"""
    ]


returningToRuaBarbosaDoBocageInicioEn : List String
returningToRuaBarbosaDoBocageInicioEn =
    [ """
![](img/ruaBarbosaduBocageBack.png)


Colares is in the opposite direction.

You are now on a narrow road with walls on both sides. To your right is Quinta da Regaleira
and a bit ahead is an impressive waterfall !
      """
    ]


talkToSintraWiseManEn : List String
talkToSintraWiseManEn =
    [ """

Sintra Wise Man is known for being an expert about this region , so you decide to ask him  :
"Do you know wether this Rua Barbosa du Bocage that starts over here is the famous Estrada Velha de Colares ? ..."
      """
    , """
Wise Man answers : "Yes , this is in fact the road that heads to  Colares and is known as Estrada Velha de Colares ...."
     """
    , """
It was built by Marquês de Pombal and had an enormous impact in the Sintra - Colares travels.

It is a quite amazing ancient road ,  surrounded by beautiful farms and a breathtaking landscape  ....
     """
    , """
It is certainly worth a long and calm walk/bike ride to enjoy all it has to offer !
Go on foot or by bike and don't be on a hurry . Think calmly about each of the intermediate points you go through
and always listen carefully ( and to the end ) to what  people tell you .
    """
    ]


helpfulNotesAppearEn : List String
helpfulNotesAppearEn =
    [ """
You notice you already wrote an entire piece of paper while listening to Sintra Wise Man's helpful advice

     """
    , " "
    ]


talkToTuristAtPalacioSeteaisEn : List String
talkToTuristAtPalacioSeteaisEn =
    [ """
Turist is kind and seems very happy about his  Sintra Village visit. He kindly greets you and after a short chat goes on his way.
    """
    ]


talkToPhotographerEn : List String
talkToPhotographerEn =
    [ """
The photographer knows the region  well due to photographing here quite a lot

He reveals some of Serra de Sintra secrets that he learnt over the years
and some of the techniques he uses on his photography ....
      """
    , """
One of the types of photo he creates leaves you positively stunned : the pinhole camera photography
   """
    , """
"photo cameras are pretty much all alike ... They're simply a box with a piece of sensitive film ( or a sensor if we're talking about a digital camera  ) on an end and a small opening on the other"


"This opening is designed in a way that allows  Light to enter the box , hitting the chemically sensitive film ( or sensor ) . That is the way photography is created.
All cameras , from the simpler  to the more complex ones , operate this way ."
   """
    , """
He also tells you about Colares wise man , born about a century ago , bearer of a lot of the region's secrets and a collector of antiques and pinhole camera photography.
   """
    ]


viewTotemAtQuintinhaMonserrateEn : List String
viewTotemAtQuintinhaMonserrateEn =
    [ """
![](img/totem.png)

24.5ft high and 10ft wide Sculpture , carved with chainsaw in a dying eucalyptus body

Serra de Sintra natural values depicted in the Totem:

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

Native Forest
    """
    ]


talkToTotemShaperQuintinhaMonserrateEn : List String
talkToTotemShaperQuintinhaMonserrateEn =
    [ """
Curious Welsh artist , named Nansi Hemming , gives you a detailed  explanation of the difficult art on sculpting wood with a chainsaw ,
and the way she worked for 10 days on the 100 years old Eucalyptus body.
      """
    , """
Really impressive the Quintinha de Monserrate Totem that  represents some
of the principal  Serra de Sintra Natural Values  .
     """
    ]


viewSeveralAnimalsAtQuintinhaMonserrateEn : List String
viewSeveralAnimalsAtQuintinhaMonserrateEn =
    [ """
![pic500](img/animaisMonserrate.png)

several animals from Quintinha de Monserrate
    """
    ]


birdsNestOfferedByTotemShaperEn : List String
birdsNestOfferedByTotemShaperEn =
    [ """
When the sculptor realizes you are walking the Estrada Velha de Colares from Sintra to Colares she offers you a bird's nest/house
giving you detailed info on how to find a proper place to install the nest.
     """
    , """
      """
    ]


talkToGeocacherEugariaEn : List String
talkToGeocacherEugariaEn =
    [ """
geocacher is researching the area and tells you that he is looking for a long time ago hidden cache
that is yet to be found. Gossip says only Colares wise Man can inform on its whereabouts ...

geocacher is also a studious and enthusiast of bird watching and dedicates quite a bit of time photographing them on their natural habitats.
     """
    ]


offerBirdsNestToGeocacherEn : List String
offerBirdsNestToGeocacherEn =
    [ """
After you realize the geocacher is a bird watcher/researcher you decide he is the
right person to install the house/nest


You hand him the nest saying you have total confidence on his ability to chose the right spot to set it up ...


Geocacher is grateful and decides to offer you a Bocage Poems Book.

Although he knows perfectly well that the 'Estrada Velha de Colares' road name  refers to another Bocage
he usually carries the book when he comes near this region .
     """
    ]


talkToWiseManColaresEn : List String
talkToWiseManColaresEn =
    [ """
Welcome to my humble home young investigator ...
      """
    ]


offerCameraAndPhotography1Sintra1914ToWiseManColaresEn : List String
offerCameraAndPhotography1Sintra1914ToWiseManColaresEn =
    [ """Wise Man shows his appreciation for your kind offer ...
He has been collecting this kind of photos for a very long time

He then proceeds to explain why he likes so much this kind of photo :
"You know , it's not that i don't like modern day photography , i do , i think digital
cameras allowed millions of people to experiment and enjoy photography
but in a certain way it also makes people click away in a sort of thoughtless , automated way ...
with pinhole camera photography , for instance ,  people thought a lot more
before taking a picture . In a sort of way it more closely resembles painting a canvas ."
      """
    ]


offerPoemsBookToWiseManColaresEn : List String
offerPoemsBookToWiseManColaresEn =
    [ """
The Wise man shows his appreciation for your kind offer !
      """
    ]


wiseManTalksAboutSintraEn : List String
wiseManTalksAboutSintraEn =
    [ """
Colares Wise Man was by then in an excellent mood and started talking enthusiastically
about Sintra :

"You know Sintra was one of the centre spots of  Romanticism and was also a place
where a lot of people from diferent origins and cultures interacted and in their own way
influenced this place. It is not difficult to imagine that Big passions ,
alliances , treasons ,  here took place ... therefore generating a lot of secrets"
"""
    , """
You answer : " yes , I know , I'm really enjoying your enthusiastic description of Sintra
, and want to listen to everything you have to say ...

but i would like your help regarding a  particular mistery ...

The road i just travelled has three different names :
-  Estrada Velha de Colares
-  Rua Barbosa du Bocage
-  Estrada Nova da Rainha
...
"""
    , """
"Ohhh ... that's what you really want ?? You don't need my help to solve that mistery .
Who creates and posts those signs ??  If you want my advice : Don't worry too much about it .
As you well know there's this fabulous system that makes possible to uniquely identify each
square inch on the face of the Earth by its latitude and longitude coordinates .
Be it GPS, Glonass  , Beidou, IRNSS , GALILEO  ,
you know what i'm talking about right ?
Focus on that and forget about street names ...
"""
    , """
"... but given that you enjoy road related misterys i'm going to present to you a Final Puzzle ...

I will show you some pictures and also reveal to you the point of view of some persons
( or groups of persons ) regarding your recent journey on Estrada Velha de Colares (  settings - language )

If you find the solution ( a word ) i will reveal to you  the location of a very special treasure hidden in Serra de Sintra
"""
    , """
...
     """
    ]


wiseManShowsFinalQuestionEn : List String
wiseManShowsFinalQuestionEn =
    [ """
wise Man presents you the final puzzle ...
      """
    ]


viewQuestionAtColaresEn : List String
viewQuestionAtColaresEn =
    [ """
Think carefully about everything that has been revealed to you
and write what you think is the answer on that piece of paper ...
      """
    ]


talkToWiseManAfterQuestionColaresAppearsEn : List String
talkToWiseManAfterQuestionColaresAppearsEn =
    [ """
"Think carefully about everything that has been revealed to you
and write what you think is the answer on that piece of paper " ...
      """
    ]


talkToWiseManAfterQuestionColaresCorrectlyAnsweredEn : List String
talkToWiseManAfterQuestionColaresCorrectlyAnsweredEn =
    [ """
"Congratulations ! You proved to be a really perceptive and intelligent person !

Here's a piece of paper with some important info ...

Good Luck on your Quest  ! "
      """
    ]


takeGpsEn : List String
takeGpsEn =
    [ """
You carefully pick up and store the gps receiver !
     """ ]


lookAtGpsEn : List String
lookAtGpsEn =
    [ """
You look at your gps receiver device :
    """ ]


lookAtWiseNotesEn : List String
lookAtWiseNotesEn =
    [ """
Some notes you wrote on a piece of paper while listening to Sintra Wise Man helpful advice :

- Go West towards Colares. In Colares you should meet the local Wise Man. If you get him in a good mood he'll certainly help you on your quest ! I heard is an antiques collector ...

- Interact with other people and listen carefully ( and to the end ) to what they have to say . That will be very helpful on your quest ...

- You will find some questions along the way : Think carefully before answering because you have a limited number of tries to get the answer right.

- if the maximum number of tries is reached before you provide a correct answer you will have to restart the game ( because you have to answer every question correctly in order to be able to finish the game)

- do not press the browser's back or forward button . Narrative (game) takes place on a single page . If you leave game will be restarted when you return .
      """
    ]


findingPinholeCameraEn : List String
findingPinholeCameraEn =
    [ """
What looked like a common tincan  was in fact one of the pinhole cameras that the photographer usually sets up in several places.

You send a message to the photographer asking if you can borrow the camera for a few hours and he gives you permission for that .
    """
    ]


byronsPoemMonserrateEn : List String
byronsPoemMonserrateEn =
    [ """
Byron's Poem about Monserrate ( in Childe Harold's Pilgrimage ) :



On sloping mounds, or in the vale beneath,

Are domes where whilome kings did make repair:

But now the wild flowers round them only breathe;

Yet ruin'd splendour still is lingering there.

And yonder towers the Prince's palace fair:

There thou too, Vathek! England's wealthiest son,

Once form'd thy Paradise, as not aware

When wanton Wealth her mightiest deeds hath done,

Meek Peace voluptuous lures was ever wont to shun.



Here didst thou dwell, here schemes of pleasure plan,

Beneath yon mountain's ever beauteous brow;

But now, as if a thing unblest by man,

Thy fairy dwelling is as lone as thou!

Here giant weeds a passage scarce allow

To halls deserted, portals gaping wide;

Fresh lessons to the thinking bosom, how

Vain are the pleasaunces on earth supplied;

Swept into wrecks anon by Time's ungentle tide!
    """
    ]


gameHasEndedEn : List String
gameHasEndedEn =
    [ """
Game has Ended ! You can take a look at your inventory items ( but game has ended ) ! Have Fun !
      """
    ]
