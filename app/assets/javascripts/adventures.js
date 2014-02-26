src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCarFkFloIvQnB_gMYoFEZltyDk4K7vQfQ&sensor=false"
function initialize() {
 // alert(gon.lat_array);
  var mapOptions = {
    center: new google.maps.LatLng(gon.lat_array[0], gon.lon_array[0]),
    zoom: 15 
  };
  var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
  var flightPlanCoordinates = new Array();
  
  for (var i = 0; i < gon.lat_array.length; i++) {
    flightPlanCoordinates.push(new google.maps.LatLng(gon.lat_array[i], gon.lon_array[i]));
  }

  var flightPath = new google.maps.Polyline({
    path: flightPlanCoordinates,
    geodesic: true,
    strokeColor: '#FF0000',
    strokeOpacity: 1.0,
    strokeWeight: 2
    });
  flightPath.setMap(map);
}

  
google.maps.event.addDomListener(window, 'load', initialize); 
