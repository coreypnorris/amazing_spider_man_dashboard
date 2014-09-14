##Marvel Comics Dashboards

A Dashing app (http://dashing.io/) that makes use of the Marvel Comics developer API (http://developer.marvel.com/) to display the new books that go on sale each week.

You can visit a live version of the site at http://marvel-comics-dashboard.herokuapp.com/this_weeks_comics

####Features

* Every 10 seconds a new book is emphasized with it's title and description.
* Every hour the app checks for new books and updates the widgets accordingly.

After downloading the app run the `bundle` command in your terminal to install the gems. Then create a file in the root directory and name it `.env` (click OK if you get a popup). Then in the .env file create the enviornment variables for your Marvel API Keys like this.

##### .env
MARVEL_PUBLIC_KEY=xxxxxxxxxxxxxxxxxxxx<br />
MARVEL_PRIVATE_KEY=yyyyyyyyyyyyyyyyyyyy

Then run `dashing start` in your terminal and navigate to http://localhost:3030/this_weeks_comics in your browser.
