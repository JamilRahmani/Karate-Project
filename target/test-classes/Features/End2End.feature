@Test
Feature: This is our end2end feature file
  Background:
    Given url 'https://jobapplicationjwt.herokuapp.com/'
    # the line below will call and execute the TokenGeneration.feature and store the result inside result variable
    And def result = call read('TokenGeneration.feature')
    # the below line will capture token variable value from result and store it inside Token
    And def Token = result.token
  Scenario: This is our Crud(Create = Post , Retriev = Get , Update = Put , Delete = Delete) scenario
    Given path '/auth/webapi/add'
    And headers {Authorization: '#("Bearer " + Token)'}
    When request read('Post-Body.json')
    And method Post
    Then status 201
    And match response.jobTitle == 'Manager'
    And def Id = response.jobId
    And def title = response.jobTitle
    And print response
    And print '======================================================================================================'
    Given path '/auth/webapi/find'
    And param id = Id
    And param jobTitle = title
    And headers {Authorization: '#("Bearer " + Token)'}
    When method Get
    Then status 200
    And print response
     And print '======================================================================================================'
    Given path '/auth/webapi/update'
    # on the below step we are passing our id in form of embeded expression
    And request
      """
      {
      "experience": [
      "Very Experienced"
      ],
      "jobDescription": "Testing web applications",
      "jobId": '#(Id)',
      "jobTitle": "SDET",
      "project": [
      {
        "projectName": "Tek School",
        "technology": [
          "IT"
        ]
      }
      ]
      }
      """
    And headers {Authorization: '#("Bearer " + Token)'}
    When method Put
    Then status 200
    And print response
     And print '======================================================================================================'
    Given path '/auth/webapi/remove/' + Id
    And headers {Authorization: '#("Bearer " + Token)'}
    When method Delete
    Then status 200
    And print response
        
    
    
    