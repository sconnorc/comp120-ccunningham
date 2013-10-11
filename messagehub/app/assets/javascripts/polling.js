$( document ).ready(function() {
    
    var lastMessage = $("#lastMessage").text();

	console.log(lastMessage);

	var dataFromServer;

	doPoll();

	function doPoll(){
		lastMessage = $("#lastMessage").text();

		$.ajax({
		    url: "http://localhost:3000/",
		    type: "GET",
		    data: {id: lastMessage},
		    success : handleData(dataFromServer)
		});
		setTimeout(doPoll, 1000);
	}

	function handleData(dataFromServer){
		return false;
	}

	return false;

});