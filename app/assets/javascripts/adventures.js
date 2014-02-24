src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCarFkFloIvQnB_gMYoFEZltyDk4K7vQfQ&sensor=false"
function initialize() {
  var mapOptions = {
    center: new google.maps.LatLng(44.8763188999, -84.8419699073),
    zoom: 15 
  };
  var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
}
google.maps.event.addDomListener(window, 'load', initialize); 
