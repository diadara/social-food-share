function initialize() {var cent=new google.maps.LatLng(13.83400426224201, 75.70363922229001);
    var myOptions = {
        center: cent,
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    //this creates the map
    map = new google.maps.Map(document.getElementById("map-canvas"),
                                  myOptions);
                                  //putting a marker in the center of the map
    marker=new google.maps.Marker({title:"latlang finder",position:cent,map:map,draggable:true
    });
    google.maps.event.addListener(marker,'position_changed',function(){
       $("#posit").html( marker.getPosition().toString());
	});
};
var map;
var marker;
$(document).ready(function(){
initialize();
});
var addressField = document.getElementById('search_address');
var geocoder = new google.maps.Geocoder();
function search() {
    geocoder.geocode(
        {'address': addressField.value},
        function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                var loc = results[0].geometry.location;
                // use loc.lat(), loc.lng()
                var newcen= new google.maps.LatLng(loc.lat(),loc.lng());
                $("#posit").html(newcen.toString());
                $("#lon").attr("value", loc.lng());
                $("#lat").attr("value", loc.lat());
                map.setCenter(newcen);
                marker.setPosition(newcen);
            }
            else {
                alert("Not found: " + status);
            }
        }
    );
};
