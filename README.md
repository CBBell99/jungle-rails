# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.  A user can log in and make "purchases" using a Stripe test account.  An Admin can create new products and product categories.   

# Screenshots

### Jungle Front Page
![Front page](https://raw.githubusercontent.com/CBBell99/jungle-rails/master/docs/Screen%20Shot%202022-03-16%20at%203.10.00%20PM%20(2).png)

### Full cart
![cart](https://raw.githubusercontent.com/CBBell99/jungle-rails/master/docs/Screen%20Shot%202022-03-16%20at%204.42.58%20PM%20(2).png)

### Purchasing
![purchase](https://raw.githubusercontent.com/CBBell99/jungle-rails/master/docs/Screen%20Shot%202022-03-16%20at%204.43.23%20PM%20(2).png)


![purchase complete](https://raw.githubusercontent.com/CBBell99/jungle-rails/master/docs/Screen%20Shot%202022-03-16%20at%203.09.29%20PM%20(2).png)

### Admin
![admin product page](https://raw.githubusercontent.com/CBBell99/jungle-rails/master/docs/Screen%20Shot%202022-03-16%20at%203.09.29%20PM%20(2).png)

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4242 4242 4242 4242 
Expiry Date must later than current date
CVC can be any 3 digits


More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* ruby "2.6.6"
* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* rails
* pg
* sass-rails
* uglifier
* jquery-rails
* turbolinks
* jbuilder
* sdoc
* bcrypt
* puma
* bootstrap-sass
* font-awesome-rails
* money-rails
* carrierwave
* rmagick
* stripe
* faker