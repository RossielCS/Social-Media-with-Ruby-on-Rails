# Scaffold for social media app with Ruby on Rails

> This repo includes initial code for social media app with basic styling. Its purpose is to be a starting point for Microverse students.

Here is a description of business requirements for the app:

We need to build a social media app called “Stay in touch”.

1. As a guest user:
- I want to be able to create account/log in.
- I can see only “Sign in” and “Sign out” page.

2. As a logged-in user:
- I want to be able to see all users list.
- I want to be able to see selected user page with their user name and all posts written by them (the most recent posts on the top).
- I want to be able to send a friendship invitation.
- I want to see a button “Invite to friendship” next to the name of user who is not my friend yet - on both users’ list and single user page.
- I want to be able to see pending friendship invitations sent to me from other users.
- I want to be able to accept or reject friendships invitation.
- I want to be able to create new posts (text only).
- I want to be able to like/dislike posts (but I can like single post only once).
- I want to be able to add comments to posts.
- I want to be able to see “Timeline” page with posts (with number of likes and comments) written by me and all my friends (the most recent posts on the top).
- Timeline page should be the root page of the app.

## Live Demo

TBA

## :hammer:  Built With
- Ruby 2.7,
- Rails 5.2.4,
- Postgres: 9.5,
- Rspec 3.9,
- Capybara 2.15,
- Shoulda-matchers 4.0,
- Webdrivers 4.0,
- Rubocop 0.79.0

## :computer: Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites
You need to install:
- [Ruby](https://www.ruby-lang.org/en/documentation/installation/) language.
- [Rubygems](https://rubygems.org/pages/download).
- [Rails](https://guides.rubyonrails.org/getting_started.html#creating-a-new-rails-project-installing-rails).
- [PostgreSQL](https://www.postgresql.org/download/)
- An IDE (Integrated Development Environment).

### Setup
1. Clone the repository.
2. In your OS terminal search the repository's address and to install gems run:  
  $ `bundle install`   
3. To setup database
  $ `rails db:create`
  $ `rails db:migrate`   
3. Then start Rail's server   
  $ `rails server`   

### Usage
- Open `http://localhost:3000/` in your browser.
- Follow the instructions.

### Run tests
Unit tests for:  
- Models Associations.  
- Models Validations.  

Integration tests for:
- Authentications.
- Posts.  
- Friendships.
- Notifications.
- Comments.
- Likes.

In your terminal search the repository's address and run:  
  $ `rspec --format documentation`   
  It will provide you well-organized output on your terminal with information about the tests.

### Deployment
To deploy on Heroku you can check [this](https://www.theodinproject.com/courses/ruby-on-rails/lessons/preparing-for-deployment) tutorial from the Odin Project.

After pushing the last changes to the remote repository, follow this steps:
1. $ `heroku create`
2. $ `git remote`
3. Verify that you see heroku in the output. 
4. $ `git push heroku master`  
   This will push the master branch.  
   In case you want to push anothe branch you can run   
   $ `git push heroku <branch name>:master` 
4. Migrate the database on Heroku  
   $ `heroku run rails db:migrate` 
5. Open the app  
   $ `heroku open` 
   

## :gem:  Features
* Users can create an account.
* Validates the email.
* To login is necessary to submit email.
* The user can create posts and send friendship requests.
* The user can only read friends' posts.
* Has a notification section that shows pending requests.
* Users have a profile picture.

## :woman:  Author

**Rossiel Carranza**

- Github: [@RossielCS](https://github.com/RossielCS)
- Linkedin: [Rossiel Carranza](https://www.linkedin.com/in/rossiel-carranza/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone who's code was used
- Inspiration
- etc

## 📝  License

This project is [MIT](lic.url) licensed.
