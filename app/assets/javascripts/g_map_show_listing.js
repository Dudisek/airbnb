// # MAP
var map;
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: gon.lat, lng: gon.lng},
    zoom: 15
  });
}