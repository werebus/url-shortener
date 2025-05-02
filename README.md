Simple Sinatra-based URL shortener

Requirements
============

* Ruby 2.6
* A rack-compatible webserver
* A database. The app uses Postgres, but it is also build on ActiveRecord. So,
  any adapter they support is fine; just change the `Gemfile`

Instalation
===========

* `bundle install`
* copy `config/database.yml.example` to `config/database.yml` and modify to suit
* copy `config/application.yml.example` to `config/application.yml` and modify
  to suit (see below)
* `bundle exec rackup`

Configuration
=============
Set the following environment variables.
They can be set in `.env` in development:

* `DEFAULT_URL`: This is your default website. If the shortener can't find a
  short-url for the requiested slug, it will redirect to that page on your
  default site.
* `SECRET`: Optional, this secret must be present in the request as "`key`" in
  order for a `POST` request to be allowed. If you ommit it, everyone is allowed
  to shorten URLs on your site.

Use
===
`GET` requests to `/slug` will redirect to the URL with that slug if found. If
not found, you'll be redirected to `/slug` at the default site.

`POST` requests to `/` will create a redirect. the `url` (and, if required
`key`) can be in the params (form data) or in the body of the request as JSON

Bookmarklet
-----------

(Change the POST location and change or remove your key)

```
javascript:(function(){var e=new XMLHttpRequest;e.addEventListener("load",function(){console.log(this.responseText)}),e.open("POST","https://exmpl.co/",!0),e.setRequestHeader("Content-Type","application/json"),e.send(JSON.stringify({key:"ASecretKey",url:window.location.href}))}())
```

This is a minified version of the script in `contrib/shorten.js`

Development
===========

There's a rudementary console: `bundle exec script/console`

Acknowlegements
===============

Inspiration for the application is largely from
https://github.com/mathiasbynens/php-url-shortener
