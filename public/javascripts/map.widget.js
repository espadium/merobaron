$.widget("meRobaron.mapWidget", {
      _init: function(){

        self = this;
        this.mapWrapper = $("#map-wrapper");
        this.latLangField = $("#latLang");

        //load google map;
        var latlng = new google.maps.LatLng(-34.886952,-56.126281);
        var mapOptions = {
          zoom: 12,
          center: latlng,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        this.map = new google.maps.Map(document.getElementById("map-wrapper"),
            mapOptions);

        google.maps.event.addListener(this.map, 'click', function( event ){
            //alert( "Latitude: "+event.latLng.lat()+" "+", longitude: "+event.latLng.lng() ); 
            if (self.marker){
              self.marker.setMap(null);
            }
            var marker = new google.maps.Marker({
              position: event.latLng,
              draggable:true,
              animation: google.maps.Animation.DROP,
              title:"Aqui me robaron!"
            });

            var latlang = +event.latLng.lat()+","+event.latLng.lng(); 

            // To add the marker to the map, call setMap();
            marker.setMap(self.map);
            self.marker = marker;
            self.latLangField.attr("value",latlang);
          });
      },

});
