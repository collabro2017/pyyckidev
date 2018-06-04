// $(document).on('turbolinks:load', function(){
// 	var markerHash = $('#map').attr('data-markers');
// 	console.log(markerHash);
// 	var markerArray = _.map(markerHash, function(location, key) {
// 				console.log(location);
// 				console.log(key);
// 		  	return {
// 		      "lat": location.latitude,
// 		      "lng": location.longitude,
// 		      "picture": {
// 		        "width":  32,
// 		        "height": 32
// 		      },
// 		      "infowindow": location.title
// 		  	}
// 		  });
// 	console.log(markerArray);
// 	var handler = Gmaps.build('Google');
// 	handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
// 	  markers = handler.addMarkers(markerArray);
// 	  handler.bounds.extendWith(markers);
// 	  handler.fitMapToBounds();
// 	});

// });