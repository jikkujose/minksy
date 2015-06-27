# Minksy

Project to make Ruby work from a shared hosting provider (say Hostgator) without the need of nearly any configuration.

# API Documentation

API location: `http://qucentis.com/labs/minksy/`

## Matches

End point                                | Notes
---------------------------------------- | -----------------------------------
[`/api/v1/matches`][random]              | Random length array of matches
[`/api/v1/matches?number=7`][non_random] | Array of length `number` of matches

## Sample JSON format

``` js
[{"id":2,"photo":"http://qucentis.com/labs/linksy/images/621x621/2.jpg"},{"id":11,"photo":"http://qucentis.com/labs/linksy/images/621x621/11.jpg"},{"id":1,"photo":"http://qucentis.com/labs/linksy/images/621x621/1.jpg"}]
```

[random]: http://qucentis.com/labs/minksy/api/v1/matches/
[non_random]: http://qucentis.com/labs/minksy/api/v1/matches/?number=7
