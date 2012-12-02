$.widget("meRobaron.mapWidget", {
      _init: function(){

        self = this;
        this.mapWrapper = $("#map-wrapper");
        this.latitudeField = $("#lat");
        this.logitudField = $("#long");
        this.seccionalNumber = $("#seccionalNumber");
        this.colors = ["#e73638", "#1a83c6", "#254725", "#5fbd60"];

        //load google map;
        var latlng = new google.maps.LatLng(-34.886952,-56.126281);
        var mapOptions = {
          zoom: 12,
          center: latlng,
          mapTypeId: google.maps.MapTypeId.ROADMAP,
          disableDefaultUI: true,
          panControl: false,
          zoomControl: true,
          mapTypeControl: false,
          scaleControl: false,
          streetViewControl: false,
          overviewMapControl: false

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
            strokeColor: "#eaeaea",
            strokeOpacity: 0.1,
            strokeWeight: 1,
            fillColor: self.colors[idx % 3],
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
      getRandomColor: function(){
        var col =self.colors[Math.floor(Math.random() * (3 - 1)) + 0];
        console.log(col);
        return col;
      },

});
