# CLASS MANAGER

> Class Manager is a Student-Teacher Portal where techers and student can sign up and teachers can add students in their class assign task and add note by student.

   Create a .env file. This .env file must be created in the root folder, not inside any other folders, for example, our Gemfile is located in the root folder.
    Save the API key which we have generated from the Zomato API inside the .env file.
    .env file should look like this: API_KEY=abc22223333575757someapikey
    Hide the API key which is also known as the secret key, by typing.env inside the .gitignore file. Do Not Push anything to GitHub until you do this step.

Awesome, Now we are going to create a Cuisines Controller. Where we are going to send an HTTP GET request to the /cuisines end-point. Your controller should like this:

require 'dotenv'
require 'json'
Dotenv.loadclass CuisinesController < ApplicationController def cuisines
   endend ## end of class

After we have created our Cuisines Controller and wrote a cuisines method inside, we are ready to make calls to the endpoints!

    Line 8: In order to get cuisines associated with a particular city, we need to send our first HTTP GET request to the cities endpoint using first RestClient, to get all the cities which are saved in a variable called @response.

@response = RestClient.get "https://developers.zomato.com/api/v2.1/cities?q=#{params["city"]}",    {content_type: :json, accept: :json, "user-key": ENV["API_KEY"]}// ENV["API_KEY"] => loading your secret key from the .env file, that is why we have require "dotenv" 
// Read about Query Params

    Line 11: From there we are indexing into the first city and saving the first city to @city_info. Note we are doing JSON.parse to our response so that we can convert string to a JSON object.
    Line13–15: If the @city_info we are getting is true, meaning it exists, then we send another HTTP GET request to the cuisines endpoint, sending the city_id along with it in the query params.
    Line 17: After we have received the cuisines, we will add a key called cuisines whose value will be all the cuisines to our city_info object and render it on Line 19
    Line 21: Handling error so that if the name of the city we entered does not exist it should render a message which will indicate the error.

Fire up your server and see the results:

    on your terminal, type rails s
    Using Postman: send a GET request to http://localhost:3000/cuisines
    Where the Query Params will be:
    Key: city
    Value: cityname (eg. Houston)

If not using Postman, simply type : http://localhost:3000/cuisinescity=houston in your web browser.

    In place of Houston, you may type any city name.

Here is an example of the response I am getting:


### Deployment

[Heroku Link]()

## Built With

- Rails
- Ruby 
- Rest-client
- Dotenv

## Getting Started

Here are the steps to follow in order to get this project on your local computer.

### Prerequisites

`rails v7.0.3 +`

`ruby v3.1.2 +`

### Setup

clone this repo by typing `git clone https://github.com/vic778/Class-manager`

### Install

install the dependencies by typing `bundle install`

### Usage

start the local server by running `rails s`

### Testing

run the tests by typing `bundle exec rspec`


### Documentation


## Author

👤 **Victor Barh**

- GitHub: [@Vvic778](https://github.com/vic778)
- Twitter: [@victoirBarh](https://twitter.com/)
- LinkedIn: [LinkedIn](https://linkedin.com/in/victoir-barh)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

 N/A

## 📝 License

This project is [MIT](lic.url) licensed.






   