//this script manage to redirect call and called another method
//good work june ang pogi mo talaga
// from methodtobeintercepted  to anothermethod

/*
(function (open) {
    method = '';
    XMLHttpRequest.prototype.open = function () {
        //other events https://developer.mozilla.org/en-US/docs/Web/Events
        //aside from readystatechange
        this.addEventListener("submit", function () {
            //console.log(this.readyState);
        }, false);
        //console.log(arguments);
        method = arguments[1];
        console.log(this);
        console.log(arguments);

        //this.responseURL = 'http://localhost:3000/anothermethod';

        if (method == 'methodtobeintercepted') {
            arguments[1] = 'anothermethod';
        }

        console.log(this);
        console.log(arguments);


        open.apply(this, arguments);
    };
})(XMLHttpRequest.prototype.open);


*/



function addXMLRequestCallback(callback){
    var oldSend, i;
    if( XMLHttpRequest.callbacks ) {
        // we've already overridden send() so just add the callback
        XMLHttpRequest.callbacks.push( callback );
    } else {
        // create a callback queue
        XMLHttpRequest.callbacks = [callback];
        // store the native send()
        oldSend = XMLHttpRequest.prototype.send;
        // override the native send()
        XMLHttpRequest.prototype.send = function(){
            // process the callback queue
            // the xhr instance is passed into each callback but seems pretty useless
            // you can't tell what its destination is or call abort() without an error
            // so only really good for logging that a request has happened
            // I could be wrong, I hope so...
            // EDIT: I suppose you could override the onreadystatechange handler though
            for( i = 0; i < XMLHttpRequest.callbacks.length; i++ ) {
                XMLHttpRequest.callbacks[i]( this );
            }
            // call the native send()
            oldSend.apply(this, arguments);
        }
    }
}

// e.g.
addXMLRequestCallback( function( xhr ) {
    console.log( xhr.responseText ); // (an empty string)
});
addXMLRequestCallback( function( xhr ) {
    console.dir( xhr ); // have a look if there is anything useful here
});