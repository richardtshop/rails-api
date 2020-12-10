# Rails Beer Api

This api is used to create and return information about local breweries and their beers.

## What you can do with this Api

- POST `/breweries`
  Creates a new brewery

- PUT `/breweries/:id`
  Updates an existing brewery

- GET `/breweries`
  Retrieves a list of all breweries

- GET `/breweries/:id`
  Retrieves a single brewery and the beers it makes

- DELETE `/breweries/:id`
  Deletes a brewery

- POST `/beers`
  Creates a new beer

- PUT `/beers/:id`
  Updates an existing beer

- GET `/beers`
  Retrieves a list of all beers

- GET `/beers/:id`
  Retrieves a single beer

- DELETE `/beers/:id`
  Deletes a beer

## Brewery properties

|                                               |                                                                                              |
| --------------------------------------------- | -------------------------------------------------------------------------------------------- |
| name <small><br>(REQUIRED)(UNIQUE)</small>    | "name": "Example Brewery" <br>The name of a brewery                                          |
| address <small><br>(REQUIRED)</small>         | "address": "123 Fake street" <br>The street address of the brewery                           |
| city <small><br>(REQUIRED)</small>            | "city": "Ottawa" <br>The city address of a brewery                                           |
| website <small><br>(REQUIRED)(UNIQUE)</small> | "website": "https://example-brewery.com"<br>The brewery's website                            |
| taproom <small><br>(REQUIRED)</small>         | "taproom": true <br>If the brewery has a taproom                                             |
| restaurant <small><br>(REQUIRED)</small>      | "restaurant": false <br>If the brewery has a restaurant                                      |
| total_beers <small><br>(READ ONLY)</small>    | "total_beers": 12 <br>Total beers sold at the brewery                                        |
| beers <small><br>(REQUIRED)</small>           | _See Beer Properties_<br>Detailed list of beers (only available on a single brewery response |

## Beer properties

|                                                                  |                                                                                         |
| ---------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| name <small><br>(REQUIRED)(UNIQUE COMBINED WITH BREWERY)</small> | "name": "Hops away" <br>Beer name                                                       |
| style <small><br>(REQUIRED)</small>                              | "style": "IPA" <br>Beer style                                                           |
| ibu <small><br>(REQUIRED)</small>                                | "ibu": 100 <br>IBU (International Bitterness Units) of the beer                         |
| abv <small><br>(REQUIRED)</small>                                | "abv": "6%" <br>ABV (Alchohol By Volume) of the beer                                    |
| brewery_id <small><br>(REQUIRED)</small>                         | "brewery_id": 1 <br>ID of the brewery that makes the beer                               |
| brewery <small><br>(READ ONLY)</small>                           | _See Brewery Properties_ <br>Brewery Details (only available on a single beer response) |

## Endpoints

POST `/breweries`

Creates a new brewery

```
{
  "brewery": {
    "name": "testing brewery",
    "address": "123 Fake street",
    "city": "Ottawa",
    "website": "https://test.com",
    "taproom": true,
    "restaurant": true
  }
}
```

<details>
<summary>View response</summary>

```
HTTP/1.1 201 CREATED

{
  "brewery": {
    "name": "testing brewery",
    "address": "123 Fake street",
    "city": "Ottawa",
    "website": "https://test.com",
    "taproom": true,
    "restaurant": true
  }
}
```

</details>
<hr/>

PUT `/breweries/:id`

Updates an existing brewery

```
{
  "brewery": {
    "name": "testing brewery 2",
  }
}
```

<details>
<summary>View response</summary>

```
HTTP/1.1 200 OK

{
  "brewery": {
    "name": "testing brewery 2",
    "address": "123 Fake street",
    "city": "Ottawa",
    "website": "https://test.com",
    "taproom": true,
    "restaurant": true
    }
}
```

</details>
<hr/>

GET `/breweries`

Retrieves a list of all breweries

<details>
<summary>View response</summary>

```

HTTP/1.1 200 OK

{
  breweries: [
    {
      "id": 2,
      "name": "mueller-wintheiser",
      "address": "739 Dee Throughway",
      "city": "Huemouth",
      "website": "http://gleichner.net/kyle",
      "taproom": true,
      "restaurant": false,
      "total_beers": 7
    },
    {
      "id": 3,
      "name": "zulauf, toy and koss",
      "address": "8213 Junita Tunnel",
      "city": "Donnieton",
      "website": "http://schoen.io/hilario",
      "taproom": false,
      "restaurant": true,
      "total_beers": 16
    },
    {
      "id": 4,
      "name": "huels, prosacco and cormier",
      "address": "901 Shirleen Trafficway",
      "city": "Carolton",
      "website": "http://haag.co/brice",
      "taproom": false,
      "restaurant": false,
      "total_beers": 8
    },
    {
      "id": 5,
      "name": "dominiozn city brewing co.",
      "address": "673 Zachery Oval",
      "city": "East Florentinomouth",
      "website": "http://ernserabshire.net/cyril",
      "taproom": false,
      "restaurant": true,
      "total_beers": 9
    },
    {
      "id": 6,
      "name": "nienow inc",
      "address": "86897 Purdy Extensions",
      "city": "West Brycemouth",
      "website": "http://hand.net/davis.hamill",
      "taproom": true,
      "restaurant": false,
      "total_beers": 10
    },
    {
      "id": 7,
      "name": "morar-walker",
      "address": "82207 Schmitt Crossroad",
      "city": "New Romeo",
      "website": "http://hoppe.io/lionel_renner",
      "taproom": true,
      "restaurant": false,
      "total_beers": 16
    },
    {
      "id": 8,
      "name": "witting, wolf and gulgowski",
      "address": "9072 Christiansen Walks",
      "city": "New Lean",
      "website": "http://klocko.org/barbara",
      "taproom": true,
      "restaurant": false,
      "total_beers": 6
    },
    {
      "id": 9,
      "name": "wisozk-wiegand",
      "address": "68389 Barton Road",
      "city": "Jacobsshire",
      "website": "http://townepurdy.name/louella",
      "taproom": false,
      "restaurant": true,
      "total_beers": 6
    },
    ...
  ]
}
```

</details>
<hr/>

GET `/breweries/:id`

Retrieves a single brewery and the beers it makes

<details>
<summary>View response</summary>

```
HTTP/1.1 200 OK

{
  "brewery": {
    "id": 1,
    "name": "dominion city brewing co.",
    "address": "5510 Canotek Rd Unit 15, Gloucester",
    "city": "Ottawa",
    "website": "https://www.dominioncity.ca/pages/our-beer",
    "taproom": true,
    "restaurant": true,
    "beers": [
      {
        "id": 1,
        "name": "trouble in the fields",
        "style": "laurentian adjust lager",
        "ibu": 70,
        "abv": "4.5%",
        "brewery": "dominion city brewing co.",
        "brewery_id": 1
      },
      {
        "id": 9,
        "name": "hopslam ale#7",
        "style": "Bock",
        "ibu": 47,
        "abv": "9.8%",
        "brewery": "dominion city brewing co.",
        "brewery_id": 1
      },
      {
        "id": 16,
        "name": "trappistes rochefort 10#14",
        "style": "German Wheat And Rye Beer",
        "ibu": 44,
        "abv": "2.6%",
        "brewery": "dominion city brewing co.",
        "brewery_id": 1
      },
      {
        "id": 25,
        "name": "hopslam ale#23",
        "style": "German Wheat And Rye Beer",
        "ibu": 53,
        "abv": "5.0%",
        "brewery": "dominion city brewing co.",
        "brewery_id": 1
      },
      {
        "id": 53,
        "name": "westmalle trappist tripel#51",
        "style": "Belgian And French Ale",
        "ibu": 25,
        "abv": "8.2%",
        "brewery": "dominion city brewing co.",
        "brewery_id": 1
      },
    ]
  }
}
```

</details>
<hr/>

DELETE `/breweries/:id`

Deletes a brewery

<details>
<summary>View response</summary>

```
HTTP/1.1 200 OK

{
  "status": "deleted",
  "brewery": {
    "id": 1,
    "name": "dominion city brewing co.",
    "address": "5510 Canotek Rd Unit 15, Gloucester",
    "city": "Ottawa",
    "website": "https://www.dominioncity.ca/pages/our-beer",
    "taproom": true,
    "restaurant": true,
    "total_beers": 0
  }
}
```

</details>
<hr/>

POST `/beers`

Creates a new beer

```
{
  "beer": {
    "name": "test beer",
    "style": "ale",
    "ibu": 80,
    "abv": "5%",
    "brewery_id": 1
  }
}
```

<details>
<summary>View response</summary>

```
HTTP/1.1 201 CREATED

{
  "beer": {
    "name": "test beer",
    "style": "ale",
    "ibu": 80,
    "abv": "5%",
    "brewery_id": 1
  }
}
```

</details>
<hr/>

PUT `/beers/:id`

Updates an existing beer

```
{
  "beer": {
    "name": "test beer renamed",
  }
}
```

<details>
<summary>View response</summary>

```
HTTP/1.1 200 OK

{
  "beer": {
    "name": "test beer renamed",
    "style": "ale",
    "ibu": 80,
    "abv": "5%",
    "brewery_id": 1
  }
}
```

</details>
<hr/>

GET `/beers`

Retrieves a list of all beers

<details>
<summary>View response</summary>

```
HTTP/1.1 200 OK

{
  beers: [
    {
      "id": 2,
      "name": "chocolate st#0",
      "style": "Belgian And French Ale",
      "ibu": 78,
      "abv": "2.5%",
      "brewery": "doyle, parker and shanahan",
      "brewery_id": 14
    },
    {
      "id": 3,
      "name": "samuel smith’s oatmeal stout#1",
      "style": "India Pale Ale",
      "ibu": 92,
      "abv": "9.3%",
      "brewery": "ullrich inc",
      "brewery_id": 23
    },
    {
      "id": 4,
      "name": "edmund fitzgerald porter#2",
      "style": "Light Lager",
      "ibu": 45,
      "abv": "5.9%",
      "brewery": "wiza, gerhold and predovic",
      "brewery_id": 13
    },
  ]
}
```

</details>
<hr/>

GET `/beers/:id`

Retrieves a single beer

<details>
<summary>View response</summary>

```

HTTP/1.1 200 OK

{
  "beer": {
    "id": 3,
    "name": "samuel smith’s oatmeal stout#1",
    "style": "India Pale Ale",
    "ibu": 92,
    "abv": "9.3%",
    "brewery": {
      "id": 23,
      "name": "ullrich inc",
      "address": "406 Arnoldo Wells",
      "city": "Bartonshire",
      "website": "http://kemmer.name/emmitt.ledner",
      "taproom": true,
      "restaurant": false,
      "total_beers": 12
    }
}
```

</details>
<hr/>

DELETE `/beers/:id`

Deletes a beer

<details>
<summary>View response</summary>

```
HTTP/1.1 200 OK

{
  "status": "deleted",
  "beer": {
    "name": "test beer",
    "style": "ale",
    "ibu": 80,
    "abv": "5%",
    "brewery_id": 1
  }
}
```

</details>
<hr/>
