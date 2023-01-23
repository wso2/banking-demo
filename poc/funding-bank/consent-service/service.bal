import ballerina/http;
import ballerina/time;
import ballerina/io;
import ballerina/uuid;

# A service representing a network-accessible API
# bound to port `9090`.
service /open\-banking/v1\.0/aisp on new http:Listener(9090) {

    # A resource for getting account information.
    # 
    # + consentResource - The consent resource.
    # + return - account information.
    resource function post account\-access\-consents(@http:Payload json consentResource) returns json|error {
        io:println("Constructing Account Consent Response");
        json mapJson = {"Data": {"ConsentId": uuid:createType1AsString(), "Status": "AwaitingAuthorisation", "StatusUpdateDateTime": time:utcToString(time:utcNow()), "CreationDateTime": time:utcToString(time:utcNow())}};
        json|error consentResponse = consentResource.mergeJson(mapJson);
        io:println("Account Consent Response Constructed");
        return consentResponse;
    }
}
