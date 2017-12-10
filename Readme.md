# Elm Game Narrative - Misterio da Estrada Velha de Colares

Estrada Velha de Colares and the different names it assumes between Sintra and Colares constitutes a brain cracking mystery that puzzled several brilliant minds throughout the ages ...

Could you be the one that solves the mistery ?  :)


# Elm Game Narrative Starter

Elm game/narrative Engine and story starter
adds several extensions to the original Elm Narrative Engine by Jeff Schomay  :
[elm-interactive-story-starter](https://github.com/jschomay/elm-interactive-story-starter)
that were implemented by Nuno Torres


- The ability to pose questions to the player , and the ability for the player to answer those questions
Answers can be checked using just this Elm project or  making  requests to backend APIs

- The ability to add attributes to Interactables , like for instance counters that can be used
to track several different stuff , like for instance the number of times the player enters a location or interacts with another character ...

- the ability to get geoLocation information  , like for instance gps coordinates , and to associate
gps Zones ( circles centered on a given gps coords point with a given radius ) to Locations
and require ( if so desired , its not mandatory ) that the player be located in a given gps Zone
before being allowed to enter a game/narrative location

- support for Several Languages : besides allowing the narrative to reach a greater audience ,
There's almost always several versions/narratives/points of view
around one Single Truth , right  ;)  ...

- several tests to prevent  creating Rules that try to create interactions with non-existant interactables ( characters , items , locations )

- the ability to save/load the interaction history list to Local Storage



# Interactive Story Starter

just like the original Elm Narrative Engine , this project can be (re)used to start your own project.
You just have to rewrite the configuration files  Narrative.elm , Rules.elm and Manifest.elm ( and maybe NarrativeEnglish.elm , etc if you want support for more than one language )

For security reasons the file __InfoForBkendApiRequests.elm__ was left out of git
so you'll have to create it on the __src__ directory with something like ( it could be just blank strings if you don't need it of course )

```Elm
module InfoForBkendApiRequests exposing (backendAnswerCheckerUrl, getApiKey)

backendAnswerCheckerUrl : String
backendAnswerCheckerUrl =
    "http://127.0.0.1:8000/questions/"

getApiKey : String
getApiKey =
    "someAPIKey"
```




Enjoy playing Mistério da Estrada Velha de Colares
[Misterio da Estrada Velha de Colares - Sintra](https://sintraubuntuer.github.io/pages/misterio-da-estrada-velha-de-colares.html)
and enjoy creating your interactive story!
