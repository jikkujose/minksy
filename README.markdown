# Minksy

Project to make Ruby work from a shared hosting provider (say Hostgator) without the need of nearly any configuration.

# API Documentation

API location: `http://qucentis.net/labs/minksy/api/v1`

## Matches

End point                         | Notes
--------------------------------- | -----------------------------------
[`/matches`][random]              | Random length array of matches
[`/matches?number=7`][non_random] | Array of length `number` of matches

## Sample JSON format

``` json
{"error":null,"data":[{"id":7,"photo":"http://qucentis.net/labs/linksy/images/621x621/07.jpg"},{"id":6,"photo":"http://qucentis.net/labs/linksy/images/621x621/06.jpg"}]}
```

[random]: http://qucentis.net/labs/minksy/api/v1/matches/
[non_random]: http://qucentis.net/labs/minksy/api/v1/matches/?number=7
