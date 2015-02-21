##Amazing Spider-Man Dashboard

A Dashing app (http://dashing.io/) that makes use of the Marvel Comics developer API (http://developer.marvel.com/) to display the first 100 issues of Amazing Spider-Man.

#### Preview Image
![alt text](https://github.com/coreypnorris/amazing_spider_man_dashboard/blob/master/assets/images/amazing_spider_man.png "Preview Image")

####Instructions

* Before getting started you will need a pair of developer keys to use the Marvel API. You can get your free keys at http://developer.marvel.com
* Clone the repo and navigate to the root directory
* Run the `bundle` command in your terminal to install the gems
* Create a file in the root directory and name it `.env`. In the .env file create the environment variables for your Marvel API Keys like this.

###### .env
MARVEL_PUBLIC_KEY=yourpublickeygoeshere<br />
MARVEL_PRIVATE_KEY=yourprivatekeygoeshere

* Run `dashing start` in your terminal and navigate to http://localhost:3030/ in your browser.
