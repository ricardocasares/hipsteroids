hipsteroids
===========
Hipster tools for building angular apps

### Description
I created this project while I was learning how to build Angular apps. In the process, and having worked with Express lately, I noticed how verbose HTML can be, and even more when you're using Twitter Bootstrap classes.

This project makes use of Coffee for writing every aspect of an angular application. It also uses Jade for templating and Stylus for stylesheets.
It stores data on Firebase, through the firebase factory and services.

Everything is build then using GulpJS, who takes care of bower dependencies, compiling coffee, jade and stylus.

### Demo

Take a look at https://hipsteroids.firebaseapp.com

### Install

Installation process is rather simple, since Gulp should be taking care of everything.

1. Clone this repo
2. Run `npm install`
3. Run `npm start`

If everything went ok, you should have a new directory called `build`, where all the static files are stored.
Plus, you should have a server running on http://localhost:3000.

The server is setup with livereload, so any change you make on the `src` folder should be reflected on the `build` folder and automatically refresh your browser.

### Configure
You can configure your Firebase instance and constants in `src/app/config.coffee`

### Todo

* Handle coffee, jade and stylus compilation errors on `gulpfile.js`
* Add firebase authentication and authorization
* Add form validation
* Make use of directives and filters
* Setup unit testing

### Contribute

If you're learning angular too, and find this project useful, or you just know how to make it better, just fork it & then pull request.
