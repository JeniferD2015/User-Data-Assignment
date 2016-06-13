# User-Data-Assignment
The project is designed using MVC pattern. Here is the information on how the project is designed,
Information on the overall design:  
Two webservice classes: 1. UserWebservice 2. PhotoWebservice, one to fetch user data and the other to fetch images from two different sources.
Webservice class constructs a URL from where the data should be fetched and sends the url to the NetworkOperator Class. 
NetworkOperator Class gets the url from Webservice class, fetches the data and sends a json object to the Webservice Class.
Webservice Class then parses the json object, models the data and sends the data to the ViewController class.
ViewController Class retrieve data from Webservice and sends it to the UI. Two ViewController classes: 1. TableViewController 2. DetailViewController. 
TableViewController populates the tableview cells which displays the list of users from UserWebservice and images from PhotoWebservice.
DetailViewController displays the information relevant to the user, based on the user selected from the list.
