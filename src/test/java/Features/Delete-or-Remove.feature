Feature: This feature file will delete a job description

Background:
		Given url 'https://jobapplicationjwt.herokuapp.com/'
# the line below will call and execute the TokenGeneration.feature and store the result inside result variable
	And def result = call read('TokenGeneration.feature')
# the below line will capture token variable value from result and store it inside Token
	And def Token = result.token
	
Scenario: This scenario will delete a job desription using jobId
#	Given path '/auth/webapi/remove/' + 101
	Given path '/auth/webapi/remove/'
	And param id = 101
	And headers {Authorization: '#("Bearer " + Token)'}
	When method delete
	Then status 200
	