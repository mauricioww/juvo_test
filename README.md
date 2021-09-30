# JUVO BACKEND TEST

## Setup

For this to work you need to install PostgreSQL database in your computer and start a server.

You'll need Ruby v2.5.X and Rails v5.2.

Install dependencies:
```
bundle install
```

Create database and migrate the changes:
```
rake db:create
rake db:migrate
```

Run the projects
```
rails s
```

## Explanation

The following block is the route to test the application.

```ruby
                    api_v1_companies GET  /api/v1/companies(.:format)                api/v1/companies#index
```

As the requirements are described, this API fetchs information about companies which its data is already saved within the app:
 
* México: mx
* Colobia: co
* EEUU: usa
 
You must send the request as the following example:

``
  localhost:3000/api/v1/companies?country=COUNTRY
``

Finally, as long as you are in the root app directory you can run the tests with the following command:

``
  rspec
``
