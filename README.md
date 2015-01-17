##Marvel Comics Dashboards

A Dashing app (http://dashing.io/) that makes use of the Marvel Comics developer API (http://developer.marvel.com/) to display different statistics about Marvel comics.

####The Dashboards

* http://marvel-comics-dashboards.herokuapp.com/this_weeks_comics cycles through all the comics that are on sale this week at a rate of one comic every 5 seconds.

* http://marvel-comics-dashboards.herokuapp.com/amazing_spider_man cycles through the first 100 issues of Amazing Spider-Man at a rate of one comic every 20 seconds.

* http://marvel-comics-dashboards.herokuapp.com/captain_america cycles through the first 100 issues of Captain America at a rate of one comic every 20 seconds.

* http://marvel-comics-dashboards.herokuapp.com/thor cycles through the first 100 issues of Thor at a rate of one comic every 20 seconds.

* http://marvel-comics-dashboards.herokuapp.com/iron_man cycles through the first 100 issues of Iron Man at a rate of one comic every 20 seconds.

####Instructions

After downloading the app run the `bundle` command in your terminal to install the gems. Then create a file in the root directory and name it `.env` (click OK if you get a warning popup from your text editor). Then in the .env file create the environment variables for your Marvel API Keys like this.

##### .env
MARVEL_PUBLIC_KEY=yourpublickeygoeshere<br />
MARVEL_PRIVATE_KEY=yourprivatekeygoeshere

Then add `.env` to the .gitignore file so that, if you choose to upload the app to Github, it will ignore the file with your keys so they don't get stolen.

Then run `dashing start` in your terminal and navigate to http://localhost:3030/this_weeks_comics in your browser.
