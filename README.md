# Handoff

Unlike other running apps which only track individual miles and times, Handoff is all about teams of people working together. Users create individual accounts, but all distances are counted as a group. Groups can set a goal for how many miles they want to run and the individuals take turns running distances with the virtual baton. When they complete their run, they can “hand off” this virtual baton to the next person in the group. The individual miles each user runs will then be added up and counted to the total distance the group runs. In this way, the group works together to complete a certain distance goal. 

The goal of the app is to make running fun and competitive even when running together is no longer an option. The team counts on every individual to pull their weight in order to complete a group goal. Not only does this motivate the individual to run more often on their own, but it also helps them feel included in a large community. This app has the potential to improve both mental and physical health in a way that doesn’t require too much effort from the individual. Our minimalistic UI allows individuals to quickly know when the baton is available and to record their distances efficiently. 


# How it works: 

All global information is stored on Firebase. The app pulls information from the server for a majority of its functions. When the app is booted up, sign in/sign up is required. After this screen, the main screen is shown. First the app checks Firebase if someone else in the group is currently running with the button. If someone is already running, then the run feature is disabled. It then loads the group goal and how close the group is to accomplishing the goal. This data loads on to the status bar. The individual miles of each user is also on this screen. When the baton is picked up, a new screen is shown. A timer starts and along with the location of the individual. Whenever the user finishes, he or she can hit stop and the miles run will be added to the individual and group total and saved on Firebase. 



# Built With

Xcode: iOS platform 

Google Firebase: live updating data storage 

Visual Studio Code: for Swift 
