Feature: This feature file will update a job description

Background:
	Given url 'https://jobapplicationjwt.herokuapp.com/'
# the line below will call and execute the TokenGeneration.feature and store the result inside result variable
	And def result = call read('TokenGeneration.feature')
# the below line will capture token variable value from result and store it inside Token
	And def Token = result.token
	
Scenario: This scenario will update a job description
	Given path '/auth/webapi/update'
	And headers {Authorization: '#("Bearer " + Token)'}
	And request
	"""
	{
  "experience": [
    "More then 8 years"
  ],
  "jobDescription": "Im a Tester",
  "jobId": 101,
  "jobTitle": "Scrum Master",
  "project": [
    {
      "projectName": "Bank of America",
      "technology": [
        "Information technology"
      ]
    }
  ]
}
	"""
	When method Put
	Then status 200
	And match response.jobTitle == 'Scrum Master'
	And match response.project[0].projectName == 'Bank of America'
	And match response.project[0].technology[0] == 'Information technology'
	
	
	
	
	
	
	
	
	
	