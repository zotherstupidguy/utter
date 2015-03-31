![alt tag](utter.png)
# Installation
  gem install utter
#Usage
* > utter help                 # lists all commands
* > utter new users v1         # creates ver1 api and model for users
* > utter new users v2
* > utter new services v1
* > utter new services v2



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

Long-term Roadmap
- Automatically extracts API model from your ruby code and generates backbone.js code for your UI (interface driven development)

# Join the Development of Utter 
  It is a simple, easy-to-follow, and in-the-shadows opensource project with a very lonely "terminally ill" maintainer who would do his best to share his knowledge with you. 

  And remmber to "try not to become a man of success, but rather try to become a man of value" ~ Albert Einstein

# Refrences
We would like to thank APIGee for their awesome webcasts that made building Utter a joy.

[![RESTful API Design - Second Edition](http://img.youtube.com/vi/QpAhXa12xvU/0.jpg)](https://www.youtube.com/watch?v=QpAhXa12xvU)
