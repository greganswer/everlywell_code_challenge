# Everylwell backend code challenge

https://github.com/EverlyWell/backend-challenge

- [Production](#production)
- [Development](#development)
  - [Design decisions](#design-decisions)
- [Road map](#road-map)
  - [API changes](#api-changes)
  - [Technical changes](#technical-changes)
  - [Additional discussions](#additional-discussions)

## Production

To deploy to production from your local machine, run the following:

    git push heroku master

## Development

**System Requirements**

- Ruby 2.6.3
- Rails 6.0.2
- Heroku CLI

### Design decisions

1. Write user stories to make sure I understand the behavior of the system
1. Write documentation before/during/after writing code (to ensure it's always relevant)
1. Create a rapid prototype (no testing, no user authentication, very little refactoring, etc.)

## Road map

Below is a list of possible improvements, in no particular order. The order of development should be based on user priorities.
Without showing them this list, ask 3-5 ideal users what they feel is missing. 
Once a list is complete, ask them to rank the list in order of importance to them. 

### API changes

- [ ] Require user authentication (maybe allow guest users to view member profiles)
    - Use a Ruby gem like Devise for social login, password resets, etc.
- [ ] Version the API
- [ ] Paginate the users index

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