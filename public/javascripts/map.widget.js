$.widget("meRobaron.mapWidget", {
      _init: function(){

        self = this;
        this.mapWrapper = $("#map-wrapper");
        this.latitudeField = $("#lat");
        this.logitudField = $("#long");
        this.seccionalNumber = $("#seccionalNumber");

        //load google map;
        var latlng = new google.maps.LatLng(-34.886952,-56.126281);
        var mapOptions = {
          zoom: 12,
          center: latlng,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        this.map = new google.maps.Map(document.getElementById("map-wrapper"),
            mapOptions);

       for ( idx in seccionales.Document.Folder.Placemark ){
          var seccional = seccionales.Document.Folder.Placemark[idx];
          var seccionalNumber = seccional.Polygon.outerBoundaryIs.LinearRing.seccionalNumber;
          var seccionalChords = [];

          for (chord_idx in seccional.Polygon.outerBoundaryIs.LinearRing.coordinates){
              var chord = seccional.Polygon.outerBoundaryIs.LinearRing.coordinates[chord_idx];

              var g_chord = new google.maps.LatLng(chord[1], chord[0]);
              seccionalChords.push(g_chord);
          }

          seccionalPolygon = new google.maps.Polygon({
            paths: seccionalChords,
            title: seccionalNumber,
            strokeColor: "#FF0000",
            strokeOpacity: 0.8,
            strokeWeight: 2,
            fillColor: "#FF0000",
            fillOpacity: 0.1
          });

          seccionalPolygon.setMap(self.map); 
          google.maps.event.addListener(seccionalPolygon, 'click', function( event ){

              self.seccionalNumber.attr("value",this.title);

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
              self.logitudField.attr("value",event.latLng.lng());
              self.latitudeField.attr("value",event.latLng.lat());
          });

        }


        google.maps.event.addListener(this.map, 'click', function( event ){
          });
      },

});
