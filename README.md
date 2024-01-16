# Booklist API application

This is a simple application with three models: Users, Books, and Bookmarks.\
A Non-user is able to see all the books on the index page and one book specifically on the show page.\
A User is able to do all CRUD actions on books in books controller.\
Two Users have three random Books added by default to Bookmarks and able to perform Show, Edit, Update and Destory actions in bookmarks controller.

## Schema

* Schema for three models to create assosiations between each table.

![Schema](https://github.com/MarioPaju1991/BookList/assets/144430955/94f29c19-78ea-4dc3-9196-ac1a7fa8e100)

## Seeds

* Seeds made by using Faker gem to generate data fake data for the application.
![Seeds](https://github.com/MarioPaju1991/BookList/assets/144430955/41cda4a7-27e0-414d-acc4-6b9987e702dc)

## Routes

* Routes created by using Hashid-rails gem
![routes1](https://github.com/MarioPaju1991/BookList/assets/144430955/98aa32a4-b580-4b48-8205-97fd4b83afd9)
![routes2](https://github.com/MarioPaju1991/BookList/assets/144430955/7d4ee9e0-bdfd-48c7-9e10-216eedca5656)

## Books controller and Bookmarks controller

* Controllers for both tables
![bookscontroller](https://github.com/MarioPaju1991/BookList/assets/144430955/82ce8203-ee32-4bd2-9438-0331a2e4c29f)
![bookmarkscontroller](https://github.com/MarioPaju1991/BookList/assets/144430955/3da6641a-de91-4553-9c0a-b41422a22d81)

## Books and Bookmarks view
* JSON view for both models
![Json view](https://github.com/MarioPaju1991/BookList/assets/144430955/7e33b0e4-bd90-42b2-aef7-c3c3424c5d27)

## Rspec tests
* Rspec tests for Bookscontroller and models by using a gem Factorybot rails and gem shoulda-matchers\
* Factorybot User, Book and Bookmark created for using factorybot
![Tests1](https://github.com/MarioPaju1991/BookList/assets/144430955/c6f1acb5-6cae-431f-8cfa-78246d6fced0)
![tests2](https://github.com/MarioPaju1991/BookList/assets/144430955/a39e3800-ba7a-49e6-8b59-3282c2de8bdc)
![tests3](https://github.com/MarioPaju1991/BookList/assets/144430955/83fc4ef3-68c3-402c-b43d-f6d025f9f500)

## Getting started
Install gems
```
bundle install
```
### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```
## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend
- [PostgreSQL](https://www.postgresql.org/) - Database

## Additional Features To Add
* Finish Rspec tests for bookmarkscontroller
* Finish Rspec tests for books and bookmarks routes
* Front-end UI

