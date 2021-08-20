Feature: This feature file will Get or retrieve the job description using jobId

Background: 
	Given url 'https://jobapplicationjwt.herokuapp.com/'
# the line below will call and execute the TokenGeneration.feature and store the result inside result variable
	And def result = call read('TokenGeneration.feature')
# the below line will capture token variable value from result and store it inside Token
	And def Token = result.token
	
Scenario: This scenario will retrive or get the job description using jobId
	Given path '/auth/webapi/find'
	And param id = 101
	And param jobTitle = 'SoftWate Developer'
	And headers {Authorization: '#("Bearer " + Token)'}
	When method Get
	Then status 200
	#And print response
	 And match response ==  
	 """
	 {
  "jobId": 101,
  "jobTitle": "SoftWate Developer",
  "jobDescription": "Developt Software",
  "experience": [
    "string"
  ],
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
	 
	 	 