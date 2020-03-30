# Everylwell backend code challenge

Search for experts based on headings on their personal website. 
Refer to https://github.com/EverlyWell/backend-challenge for more details.

- [Production](#production)
  - [Deployment](#deployment)
- [Development](#development)
  - [Design decisions](#design-decisions)
  - [API examples](#api-examples)
- [Road map](#road-map)
  - [API changes](#api-changes)
  - [Technical changes](#technical-changes)
  - [Additional discussions](#additional-discussions)

## Production

The API is located at https://protected-stream-56118.herokuapp.com/. The home route should display something similar to the following:

```json
{
  "name": "Experts Directory Search Tool",
  "description": "Search for experts based on headings on their personal website",
  "version": "0.1.0"
}
```

### Deployment

To deploy to production from your local machine, run the following from the project root directory:

    git push heroku master
    heroku run rake db:migrate

To view the logs:

    heroku logs

## Development

**System Requirements**

- Ruby 2.6.3
- Rails 6.0.2
- Heroku CLI

### Design decisions

1. Write user stories to make sure I understand the behavior of the system
1. Write documentation before/during/after writing code (to ensure it's always relevant)
1. Create a rapid prototype (no testing, no user authentication, very little refactoring, etc.)

### API examples

```sh
curl --location --request POST 'https://protected-stream-56118.herokuapp.com/users' \
--header 'Content-Type: application/json' \
--data-raw '{
    "first_name": "Sandi",
    "last_name": "Metz",
    "website_attributes": {
        "url": "https://www.sandimetz.com/blog"
    }
}'
```
```javascript
{
    "id": 9,
    "first_name": "Sandi",
    "last_name": "Metz",
    "website": {
        "url": "https://www.sandimetz.com/blog",
        "headers": [
            {
                "title": "Sandi Metz",
                "header_type": "h1"
            },
            {
                "title": "What Does OO Afford?",
                "header_type": "h1"
            },
            {
                "title": "Breaking Up the Behemoth",
                "header_type": "h1"
            },
            {
                "title": "Why We Argue: Style",
                "header_type": "h1"
            },
            {
                "title": "A Little Background",
                "header_type": "h2"
            },
            {
                "title": "Subscribe",
                "header_type": "h2"
            }
        ]
    }
}
```

## Road map

Below is a list of possible improvements, in no particular order. The order of development should be based on user priorities.
Without showing them this list, ask 3-5 ideal users what they feel is missing. 
Once a list is complete, ask them to rank the list in order of importance to them. 

### API changes

- [ ] Require user authentication (maybe allow guest users to view member profiles)
    - Use a Ruby gem like Devise for social login, password resets, etc.
- [ ] Version the API
- [ ] Paginate the users index
- [ ] Consider requiring an email address to make sure users are unique
- [ ] Standardize error messages
- [ ] Return JSON responses that include parent keys like `meta` and `data`

### Technical changes

- [ ] Create a frontend UI for end users
- [ ] Use UUID instead of integer IDs as primary key (best for distributed systems)
- [ ] Standardize data serialization
- [ ] Add internationalization
- [ ] Setup Docker for easy deployment to Heroku, AWS, etc.
- [ ] Index frequently queried columns such as `websites.url`
- [ ] Add foreign key constraints
- [ ] Add automated tests
- [ ] Send log data to an external service like DataDog

### Additional discussions

- [ ] Should other users be allowed to update any user info (Wikipedia style)?
- [ ] Should admin users be able to edit/delete any user info?
- [ ] Should users be notified when they get new friends?
- [ ] Does every user of this search tool require a website? What if they don't want to share it?