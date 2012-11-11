$(function() {
        var heatmapData = [];

        var params = location.search.replace('?', '').split('&').map(function(val){
            return val.split('=');
        });

        console.log(params[0][1])
        console.log("http://localhost:9393/areas/" + params[0][1])

        $.ajax({url:"http://localhost:9393/areas/" + params[0][1], dataType:'json', timeout: 99999999, success:function(data)
       {
          for (i=0; i<data.length; i++){

            heatmapData.push({location: new google.maps.LatLng(data[i].lat, data[i].lng), weight: data[i].number});
          }

          var unitedKingdom = new google.maps.LatLng(54.5780510, -3.4359730);

    map = new google.maps.Map(document.getElementById('map'), {
      center: unitedKingdom,
      zoom: 5,
      disableDefaultUI: true,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var heatmap = new google.maps.visualization.HeatmapLayer({
      data: heatmapData
    });

    heatmap.setMap(map);


       }
       
        });

});
