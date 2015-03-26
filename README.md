![alt tag](utter.png)

> utter new users v1
> utter new users v2
> utter new services v1
> utter new services v2



#Tenets of Pragmatic API Design
- Use plural instead of singular (/dogs instead of /dog)
- Enforce the use Versioning as v1, v2, v3, NOT v1.0.1 blah blah
- Package and deploy your versioned API to your Production Server 
- Ability to nodifiy developers with the depreciation of the earlier versions
- Use HTTP Codes as much as possible
- partial response /users?fields=name,age,loction to cut down on band width
- pagination using limit and offset /dogs?limit=25&offset=50 
- ensuring response format  /dogs.json  /dogs/1234.json /dogs.xml /dogs/1234.xml  
- defaults: json, limit&offset,  

Long-term Roadmap
- generates backbone code for your interface (interface driven development)
