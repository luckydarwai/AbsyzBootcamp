@RestResource(urlMapping='/CaseAPI/*')
global class RestApexClass {

     // GET Call - Retrieve Cases based on Subject with "LIKE" Operator
    @HttpGet
    global static List<Case> getCases() {
        RestRequest req = RestContext.request;
        String subjectKeyword = req.requestURI.substring(req.requestURI.lastIndexOf('/') + 1);

        // Using LIKE operator to match cases by subject
        List<Case> cases = [SELECT Id, CaseNumber, Subject, Description, Origin 
                            FROM Case 
                            WHERE Subject LIKE :('%' + subjectKeyword + '%')];
        return cases;
    }

    // DELETE Call - Delete Case records based on Subject with "LIKE" Operator
    @HttpDelete
    global static String deleteCases() {
        RestRequest req = RestContext.request;
        String subjectKeyword = req.requestURI.substring(req.requestURI.lastIndexOf('/') + 1);

        // Find cases with the matching subject and delete them
        List<Case> casesToDelete = [SELECT Id FROM Case WHERE Subject LIKE :('%' + subjectKeyword + '%')];
        delete casesToDelete;
        return 'Deleted ' + casesToDelete.size() + ' cases with subject like "' + subjectKeyword + '"';
    }

    // POST Call - Create a New Case Record with Given Fields
    @HttpPost
    global static Case createCase(String subject, String origin, String description) {
        Case newCase = new Case();
        newCase.Subject = subject;
        newCase.Origin = origin;
        newCase.Description = description;
        
        insert newCase;
        return newCase;
    }
}




//  GET /services/apexrest/CaseAPI/{subjectKeyword}
//  DELETE /services/apexrest/CaseAPI/{subjectKeyword}
//  POST /services/apexrest/CaseAPI
/*
Body (JSON):
{
    "subject": "Test Subject",
    "origin": "Phone",
    "description": "Test Description"
}
*/