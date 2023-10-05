import ballerina/http;
import ballerina/io;

# A service representing a network-accessible API
# bound to port `9090`.
final http:Client albumClient = check new ("localhost:9090");

service / on new http:Listener(9090) {

    resource function get greeting() returns string|error {

        http:Response albums = check albumClient->/albums;
        io:println("GET request:" + albums.statusCode.toBalString());
        return "Hello, " + albums.statusCode.toBalString();
    }
}
