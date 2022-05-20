let map;

//var pos = { lat: 49.202779660315294, lng: -122.91649229999877 };

function showPosition(position) {
  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: position.coords.latitude, lng: position.coords.longitude },
    zoom: 12,
  });

    const trafficLayer = new google.maps.TrafficLayer();

    trafficLayer.setMap(map);

}


function initMap() {

    navigator.geolocation.getCurrentPosition(showPosition);

}

//header and footer
fetch("./header.html")
  .then(response => {
    return response.text()
  })
  .then(data => {
    document.querySelector("header").innerHTML = data;
  });

fetch("./footer.html")
  .then(response => {
    return response.text()
  })
  .then(data => {
    document.querySelector("footer").innerHTML = data;
  });
