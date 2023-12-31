import ballerina/http;
import ballerina/io;

# A service representing a network-accessible API
# bound to port `9090`.
//configurable string host = "http://172.15.0.16:92/api/v1";
configurable string host = "https://teste.requestcatcher.com/test";
final http:Client albumClient = check new (host);

service / on new http:Listener(9090) {

    resource function get greeting() returns string|error {

        http:Response albums = check albumClient->/teste;
        io:println("GET request:" + albums.statusCode.toBalString());
        return "Hello, " + albums.statusCode.toBalString();
    }

    resource function get teste() returns string|error {

        http:Response albums = check albumClient->get("");
        io:println("GET request:" + albums.statusCode.toBalString());
        return "Hello, " + albums.statusCode.toBalString() + albums.server;
    }
}
