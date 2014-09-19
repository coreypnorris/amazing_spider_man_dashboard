##Marvel Comics Dashboards

A Dashing app (http://dashing.io/) that makes use of the Marvel Comics developer API (http://developer.marvel.com/) to display different statistics about Marvel comics.

####The Dashboards
Right now the app loads two different dashboards and you can view online versions of them at the following urls:

* http://marvel-comics-dashboard.herokuapp.com/this_weeks_comics cycles through all the comics that are on sale this week at a rate of one comic every 5 seconds.

* http://marvel-comics-dashboard.herokuapp.com/amazing_spider_man cycles through every issue of Amazing Spider-Man at a rate of one comic every 20 seconds.

####Instructions

After downloading the app run the `bundle` command in your terminal to install the gems. Then create a file in the root directory and name it `.env` (click OK if you get a popup). Then in the .env file create the enviornment variables for your Marvel API Keys like this.

##### .env
MARVEL_PUBLIC_KEY=yourpublickeygoeshere<br />
MARVEL_PRIVATE_KEY=yourprivatekeygoeshere

Then add `.env` to the .gitignore file so that, if you choose to upload the app to Github, it will ignore the file with your keys so they don't get stolen.

Then run `dashing start` in your terminal and navigate to http://localhost:3030/this_weeks_comics in your browser.
