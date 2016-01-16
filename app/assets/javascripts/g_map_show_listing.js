// # MAP
var map;
function initMap() {
	var myLatLng = {lat: gon.lat, lng: gon.lng};
  map = new google.maps.Map(document.getElementById('map'), {
    center: myLatLng,
    zoom: 15,
    scrollwheel: false
  });

  var marker = new google.maps.Marker({
  position: myLatLng,
  map: map
  });
}