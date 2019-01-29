# ggplot Themes
Recently I have been inspired to do more work with R, specifically ggplot.
There have been a few times where I would be working on a project, and my visualizations are not cohesive.
This is partially due to the fact that either I forget what themes are available..
Or, it is because I have a custom theme that isnt being applied to all of my visualizations.

This shiny app aims to allow the user to see what what themes are available by default through ggplot while pairing them with any available geom.
Additionally, the user should be able to upload their own ggplot theme and test it out against different geoms to see if it can handle all edge cases while being cohesive.

Checkout the app [here](https://taylorperkins.shinyapps.io/ggplot-themes/)!

### Get It Running Locally
1. Make sure you have [R](https://cran.r-project.org/doc/manuals/r-release/R-admin.html) installed *(Pretty important step in this process lol)*
2. Clone this repo, and open the project in RStudio.
3. You will need to install a few packages. 
```R
install.packages("shiny", "shinydashboard", "shinyalert", "ggplot2")
```
4. Move on over to `app.R` and click the `Run App` button in RStudio. 
This should open the app and get ya started!


### If you didn't notice..
This app is a *_WIP_*!!!
Not yet finished, may never be. 
If you find this and are interested in contributing, reach out to me and I'll hook ya up!
The structure is fairly straightforward, and would be easy enough to jump in.

Otherwise.. 
Submit an issue and I'll see if it can get put in!

### _Thanks!_
