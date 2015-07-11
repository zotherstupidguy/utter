![alt tag](utter.png)

# Intro

Utter is an API framework for creative nomad enterpenurs, who wants to create minimual valiuable products in the shortest amount of time to test the market.
https://www.techinasia.com/12-startups-in-12-months-how-this-digital-nomad-doing-it/


Many startups are have mobile-only apps, to which they require a solid API t deliver their services, Utter is perfect for this scenario, leaving your UI developers at ease.

Creative people tend to polish their products but never really finish them, similar to ART! however its always better to actually finish a minimual product for others to test and play with than to keep it on a github dusty github repo waiting for a mircale of motiviation to happen, while you are busy on your next idea! Thats where Utter comes in. Utter lets you from the start focus on the API of your project, and rapidly develop it to enable you to either work or even outsource the UI job, if you like what you have done.

Utter keeps every project as simple as possible.

"Once launched, Levels blasts out several emails to big tech blogs, submits the product to Hacker News, Reddit, and Product Hunt, and then heads to bed. “I have a big sleep, wake up, and hopefully see a lot of emails and tweets about my new project,” he says. Thus far, he has had plenty of emails and tweets to occupy his post-launch waking moments." Utter bin contains a "shoutout" command that lets the world know of your project.

Utter is a ruby web API framework designed for performance speed, it applies a microservices philosphy with convention-over-configuration backed by redis to help build powerful API services with ease.

Utter's codebase is so tiny you can read on one sitting.


Utter is perfect for early stage startups (and big players) where there is a need to focus on the logic of the application, instead of complex UI stuff and the infinite loop of UI design taste. Utter lets you communicate the core of your idea into a solid API that can be tested extensivliy and offered lateron privately or publicly to your endusers or UI developers, thats the spirit of Utter. 

Moreover Utter is designed with some opinonated descions which makes perfect sense in the world of API development, making you relax and enjoy the ride of building a high-grade API, instead of learning and comparing all design descions of building an API, in other words its convention over configuration at its best for an web API.

Utter belives that simplicity, is the path to joy and natural scalability, Utter espouses the benefits of small webservices madeup from small classes with small methods. Thus designing your system via Utter for a number of microwebservies should be easy, and Utter takes this argument very seriously, allowing you to package each endpoint of your api as a gem that can be deployed seperatly into another machine, offereing you the BEST control over managing your application for scalalblity.

# Installation
  gem install utter
#Usage
* > utter help                 # lists all commands
* > utter new users v1         # creates ver1 api and model for users
* > utter new users v2
* > utter new services v1
* > utter new services v2      # Copys the services previous vesions and alters the Version variable to match the current.
* > utter new services v2 bare # Creates an Empty skeleton, so developer can write from scratch.

* > utter info services    # Shows info about all the services, including mounted versions, for how long, traffic usage, etc.
* > utter info services v2 # Shows info about services v2 including for how long, traffic usage, etc.

* > utter mount services      # Mount all services versions
* > utter mount services v2   # Mount services v2 only 
* > utter unmount services v2 # Unmount services v2 only 
* > utter unmount services    # Unmount all services 
* > utter sample              # Add sample extensively-documented utter project into the current direcotry.

# Utter's Tenets for Good Web API Design 
- Use plural instead of singular (/dogs instead of /dog)
- Enforce the use Versioning as v1, v2, v3, NOT v1.0.1 or v1.1 
- Package and deploy your versioned API to your Production Server 
- Ability to nodifiy developers with the depreciation of the earlier versions, simply by adding Depreciated keyword in your API ruby file.
- Use HTTP Codes as much as possible
- Partial response /users?fields=name,age,loction to cut down on band width
- Pagination using limit and offset /dogs?limit=25&offset=50 
- Ensuring response format  /dogs.json  /dogs/1234.json /dogs.xml /dogs/1234.xml  
- defaults: json, limit&offset,  

# Interface Driven-Development 
- Automatically extracts API model from your ruby code and generates backbone.js code for your UI (interface driven development)

# Join the Development of Utter 

Rule of Modularity: Write simple parts connected by clean interfaces.

Rule of Clarity: Clarity is better than cleverness.

Rule of Composition: Design programs to be connected to other programs.

Rule of Separation: Separate policy from mechanism; separate interfaces from engines.

Rule of Simplicity: Design for simplicity; add complexity only where you must.

Rule of Parsimony: Write a big program only when it is clear by demonstration that nothing else will do.

Rule of Transparency: Design for visibility to make inspection and debugging easier.

Rule of Robustness: Robustness is the child of transparency and simplicity.

Rule of Representation: Fold knowledge into data so program logic can be stupid and robust.

Rule of Least Surprise: In interface design, always do the least surprising thing.

Rule of Silence: When a program has nothing surprising to say, it should say nothing.

Rule of Repair: When you must fail, fail noisily and as soon as possible.

Rule of Economy: Programmer time is expensive; conserve it in preference to machine time.

Rule of Generation: Avoid hand-hacking; write programs to write programs when you can.

Rule of Optimization: Prototype before polishing. Get it working before you optimize it.

Rule of Diversity: Distrust all claims for “one true way”.

Rule of Extensibility: Design for the future, because it will be here sooner than you think.

http://www.faqs.org/docs/artu/ch01s06.html
  It is a simple, easy-to-follow, and in-the-shadows opensource project with a very lonely "terminally ill" maintainer who would do his best to share his knowledge with you. 

  And remmber to "try not to become a man of success, but rather try to become a man of value" ~ Albert Einstein

“I am not an Athenian or a Greek, but a citizen of the world." ― Socrates
"“To be is to do” - Socrates
# Refrences
We would like to thank APIGee for their awesome webcasts that made building Utter a joy.

[![RESTful API Design - Second Edition](http://img.youtube.com/vi/QpAhXa12xvU/0.jpg)](https://www.youtube.com/watch?v=QpAhXa12xvU)

#General contribution help
Fork it (https://github.com/zotherstupidguy/utter/fork)
Clone it
Run bundle
Run rake (runs all tests and coverage report) or bundle exec guard
Create your feature branch (git checkout -b my-new-feature)
Write some tests, write some code, have some fun!
Commit your changes (git commit -am 'Add some feature')
Push to the branch (git push origin my-new-feature)
Create a new pull request.
