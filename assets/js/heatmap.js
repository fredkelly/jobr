$(function() {
  if (location.pathname == '/search') {
    var heatmapData = [];

    var params = location.search.replace('?', '')
      .split('&')
      .map(function(val) { return val.split('='); });

    $.getJSON("/areas/" + params[0][1], function(data) {
      for (i = 0; i < data.length; i++) {
          heatmapData.push({location: new google.maps.LatLng(data[i].lat, data[i].lng), weight: data[i].number});
      }

    var unitedKingdom = new google.maps.LatLng(54.5780510, - 3.4359730);

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
      heatmap.setOptions({opacity: 0.75, radius: 10});
  });
  
}

});
