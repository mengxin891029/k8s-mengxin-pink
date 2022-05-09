var greets = require('./protos/greet_pb')
var service = require('./protos/greet_grpc_pb')

var grpc= require('@grpc/grpc-js')

const fs=require('fs')


/*
Implement the greet RPC method
*/

//Unary API
function greet(call,callback){
    var greeting = new greets.GreetResponse()
    var firstName=call.request.getGreeting().getFirstName()

    if (firstName == "Xin"){
        var result= "Hello "+firstName+"! this is unary api!"

        console.log(result)
        greeting.setResult(result)

        callback(null, greeting)
    } else {
        // error handling
        return callback({
            code: grpc.status.INVALID_ARGUMENT,
            message: 'Invalid First Name'
        })
    }
    
}

//Server Streaming API
function greetManyTimes(call,callback){
    var firstName=call.request.getGreeting().getFirstName()
    var lastName = call.request.getGreeting().getLastName()

    var greetManyTimesResponse = new greets.GreetManyTimesResponse()
    greetManyTimesResponse.setResult("Hello "+firstName+"! this is server streaming!")


    let count=0, intervalID = setInterval(()=>{
        // start the streaming
        console.log("writting to "+firstName)
        call.write(greetManyTimesResponse)

        if(++count>5){
            clearInterval(intervalID)
            // end the streaming
            call.end()
        }

    },1000)
}

//Client Streaming API
function longGreet(call,callback){
    // on the data recevied event
    call.on('data',request=>{
        var result= "Hello "+request.getGreeting().getFirstName()+"! this is client streaming!"
        console.log(result)
    })

    // on the error recevied event
    call.on('error',error=>{
        console.error(error)
    })

    // on the end event
    call.on('end',()=>{
        var response = new greets.LongGreetResponse()
        response.setResult('Client Streaming Ended!')

        callback(null,response)
    })

}


// BiDi Streaming API
async function sleep (interval) {
    return new Promise((resolve)=> {
        setTimeout(()=> resolve(),interval)
    })
}

async function greetEveryone(call,callback){

    // To receive the client-side streaming
    call.on('data',client_request=>{
        var result= "Hello "+client_request.getGreeting().getFirstName()+"! this is bidi streaming!"
        console.log(result)
    })

    // on the error recevied event
    call.on('error',error=>{
        console.error(error)
    })

    // on the end event
    // client-side end streaming
    call.on('end',()=>{
        console.log('Client stopped streaming!')
    })

    // to start the server-side streaming
    // send 10 greetEveryoneRequest from server to client
    for (var i=0;i<5;i++){

        var response= new greets.GreetEveryoneResponse()
        response.setResult("BiDi Streaming to client")

        call.write(response)

        await sleep(1000)
    }

    call.end()


}



function main(){
    var server = new grpc.Server()

    // let credentials = grpc.ServerCredentials.createSsl(
    //     fs.readFileSync(__dirname+'/../certs/ca.crt'),
    //     [{
    //         cert_chain: fs.readFileSync(__dirname+'/../certs/server.crt'),
    //         private_key: fs.readFileSync(__dirname+'/../certs/server.key')
    //     }], 
    //     //  true
    // )

    let insecureCredentials = grpc.ServerCredentials.createInsecure()

    server.addService(service.GreetServiceService,{
        greet:greet,
        greetManyTimes:greetManyTimes,
        longGreet:longGreet,
        greetEveryone:greetEveryone
    })

    // insecure server
    // server.bindAsync("localhost:50051",insecureCredentials ,()=>{
    //     server.start();
    // });
    

    // secure server
    // listen to 0.0.0.0 instead of localhost in the docker environment
    server.bindAsync("0.0.0.0:50051",insecureCredentials,()=>{
        server.start();
    })

    console.log("gRPC Server started on :50051");

}

main()