Feature: This is our post method feature file  

Background: 
	Given url 'https://jobapplicationjwt.herokuapp.com/'
# the line below will call and execute the TokenGeneration.feature and store the result inside result variable
	And def result = call read('TokenGeneration.feature')
# the below line will capture token variable value from result and store it inside Token
	And def Token = result.token
	
	
Scenario: This scenario will create a new job description in the system
	Given path '/auth/webapi/add'
	And headers {Authorization: '#("Bearer " + Token)'}
#And request { "experience": ["string"],"jobDescription": "string","jobId": 0, "jobTitle": "string", "project": [{"projectName": "string", "technology": [  "string"   ]}]}
	And request
	"""
	{
  "experience": [
    "string"
  ],
  "jobDescription": "Developt Software",
  "jobId": 101,
  "jobTitle": "SoftWate Developer",
  "project": [
    {
      "projectName": "Amazon",
      "technology": [
        "IT"
      ]
    }
  ]
}
	"""
	And method Post
	Then status 201
	And print response
	
	
	
	
	
	
	