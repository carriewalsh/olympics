# Olympics - Final Individual Project
by Carrie Walsh

Deployed site: https://olympics-final.appspot.com

This app is an API for a large set of Olympics data from Summer 2016. Its intended purpose is to be adapted as a live Olympics website for Summer 2020. Examples of return values include summaries of all olympians, olympians by team, olympic stats, summary of medalists by event, and summary of medalists by team. Summaries of medals also return the link to the medal image for frontend ease.

## Endpoints
- GET '/api/v1/olympians'
Response:
```javascript
{
  "olympians":
    [
      {
        "name": "Maha Abdalsalam",
        "team": "Egypt",
        "age": 18,
        "sport": "Diving"
        "total_medals_won": 0
      },
      {
        "name": "Ahmad Abughaush",
        "team": "Jordan",
        "age": 20,
        "sport": "Taekwondo"
        "total_medals_won": 1
      },
      {...}
    ]
}
```

- GET '/api/v1/olympians?age=youngest'
Response:
```javascript
{
  [
    {
      "name": "Ana Iulia Dascl",
      "team": "Romania",
      "age": 13,
      "sport": "Swimming"
      "total_medals_won": 0
    }
  ]
}
```

- GET '/api/v1/olympians?age=oldest'
Response:
```javascript
{
  [
    {
      "name": "Julie Brougham",
      "team": "New Zealand",
      "age": 62,
      "sport": "Equestrianism"
      "total_medals_won": 0
    }
  ]
}
```

- GET '/api/v1/olympians?age=[AGE]'
Response:
```javascript
{
  "olympians": [
    {
      "name": "Ai Yanhan",
      "team": "China",
      "age": 14,
      "sport": "Swimming",
      "total_medals_won": 0
    },
    {
      "name": "Fatim Alkrmova",
      "team": "Azerbaijan",
      "age": 14,
      "sport": "Swimming",
      "total_medals_won": 0
    },
    {
      "name": "Siri Arun Budcharern",
      "team": "Laos",
      "age": 14,
      "sport": "Swimming",
      "total_medals_won": 0
    }
  ]
}
```

- GET '/api/v1/olympian_stats'
Response:
```javascript
{
  "olympian_stats": {
    "total_competing_olympians": 3120
    "average_weight:" {
      "unit": "kg",
      "male_olympians": 75.4,
      "female_olympians": 70.2
    }
    "average_age:" 26.2
  }
}
```

- GET '/api/v1/events'
Response:
```javascript
{
  "events":
    [
      {
        "sport": "Archery",
        "events": [
          "Archery Men's Individual",
          "Archery Men's Team",
          "Archery Women's Individual",
          "Archery Women's Team"
        ]
      },
      {
        "sport": "Badminton",
        "events": [
          "Badminton Men's Doubles",
          "Badminton Men's Singles",
          "Badminton Women's Doubles",
          "Badminton Women's Singles",
          "Badminton Mixed Doubles"
        ]
      },
      {...}
    ]
}
```

- GET '/api/v1/events/:sport_id'
Response:
```javascript
{
  "sport": "Archery",
  "events": [
    "Archery Men's Individual",
    "Archery Men's Team",
    "Archery Women's Individual",
    "Archery Women's Team"
  ]
}
```

- GET '/api/v1/events/:event_id/medalists'
Response:
```javascript
{
  "event": "Badminton Mixed Doubles",
  "medalists": [
      {
        "name": "Tontowi Ahmad",
        "team": "Indonesia-1",
        "age": 29,
        "medal": "Gold",
        "medal_url": "https://yourdatastories.eu/wp-content/uploads/2016/08/Rio_Gold.png"
      },
      {
        "name": "Chan Peng Soon",
        "team": "Malaysia",
        "age": 28,
        "medal": "Silver",
        "medal_url": "https://yourdatastories.eu/wp-content/uploads/2016/08/Rio_Silver.png"
      }
    ]
}
```

- GET '/api/v1/teams'
Response:
```javascript
{
  "teams":
    [
      {
        "team": "Albania",
        "olympians": [
          "Name 1",
          "Name 2",
          "Name 3",
          "Name 4"
        ]
      },
      {
        "team": "Andorra",
        "olympians": [
           "Name 1",
          "Name 2",
          "Name 3",
          "Name 4"
        ]
      },
      {...}
    ]
}
```

- GET '/api/v1/teams/:id/medalists'
Response:
```javascript
{
  "country": "Germany",
  "medalists": [
      {
        "name": "Tontowi Ahmad",
        "event": "Archery Men's Individual",
        "age": 29,
        "medal": "Gold",
        "medal_url": "https://yourdatastories.eu/wp-content/uploads/2016/08/Rio_Gold.png"
      },
      {
        "name": "Chan Peng Soon",
        "event": "Archery Men's Individual",
        "age": 28,
        "medal": "Silver",
        "medal_url": "https://yourdatastories.eu/wp-content/uploads/2016/08/Rio_Silver.png"
      }
    ]
}
```

- GET '/api/v1/percentage_wins'
Response:
```javascript
{
  "teams":
    [
      {
      "team": "Croatia",
      "percentage_medals": 20.0
     },
    {
      "team": "Cuba",
      "percentage_medals": 14.3
    },
      {...}
    ]
}
```

- GET '/api/v1/popularity'
Response:
```javascript
{
  "popularity": [
      {
        "event": "Football Men's Football",
        "olympians": 69
      },
      {
        "event": "Football Women's Football",
        "olympians": 54
      },
      {...}
      ]
}
```

## Getting Started

### Requirements

Requires Ruby 2.6.3, Rails 5.2.3, Bundler 2.0.1

### Setup

Clone down the repo and bundle:

`$ git clone https://github.com/carriewalsh/olympics.git`
`$ bundle`

Set up the database:

`$ rails import:medals`
`$ rails import:raw`
`$ rails populate:teams`
`$ rails populate:sports`
`$ rails populate:events`
`$ rails populate:olympians`
`$ rails populate:olympian_events`

For slower databases, the final rake task as been split into chunks:

`$ rails clear:olympian_events`
`$ rails populate:olympian_events_winners`
`$ rails populate:olympian_events_na1`
`$ rails populate:olympian_events_na2`

## Schema

![Olympics Schema](/schema.jpg?raw=true "Olympics Schema")

## Author

At the time of this project I am finishing up my last week (tear!) at Turing School of Software & Design.

https://alumni.turing.io/alumni/carrie-walsh
