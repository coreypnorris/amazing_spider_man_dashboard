##Amazing Spider-Man Dashboard

A Dashing app (http://dashing.io/) that makes use of the Marvel Comics developer API (http://developer.marvel.com/) to display the 100 issue of Amazing Spider-Man.

####Instructions

* Clone the repo and navigate to the root directory
* Run the `bundle` command in your terminal to install the gems
* Create a file in the root directory and name it `.env` (click OK if you get a warning popup from your text editor). Then in the .env file create the environment variables for your Marvel API Keys like this.

##### .env
MARVEL_PUBLIC_KEY=yourpublickeygoeshere<br />
MARVEL_PRIVATE_KEY=yourprivatekeygoeshere

Run `dashing start` in your terminal and navigate to http://localhost:3030/ in your browser.
