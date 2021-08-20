Feature: This feature file will generate our authorization token

Background:
	Given url 'https://jobapplicationjwt.herokuapp.com/'
	
Scenario: This scenario will register to the system
	Given path '/users/sign-up'
	When request { "id": 0, "password": "jamil", "username": "Rahman"}
	And method Post
	Then status 200
	
Scenario: This scenario will create authorization token for us using our username and password
	Given path '/users/authenticate'
	When request { "password": "jamil","username": "Rahman"}	
	And method Post
	Then status 200
	And print response
	And def token = response.token

