let map;

//var pos = { lat: 49.202779660315294, lng: -122.91649229999877 };

function showPosition(position) {
  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: position.coords.latitude, lng: position.coords.longitude },
    zoom: 12,
  });

  const bikeLayer = new google.maps.BicyclingLayer();

  bikeLayer.setMap(map);
}

function initMap() {
    navigator.geolocation.getCurrentPosition(showPosition);
}
