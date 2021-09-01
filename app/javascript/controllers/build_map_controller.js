import { Controller } from "stimulus"
import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css'

export default class extends Controller {

  buildMap() {
    setTimeout(() => {
      if(this.mapbuilt !== true){
        const mapElement = document.getElementById('map');
        const fitMapToMarkers = (map, markers) => {
          const bounds = new mapboxgl.LngLatBounds();
          markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
          map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 3000 });
        };
        if (mapElement) { // only build a map if there's a div#map to inject into
          mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
          const map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/mapbox/streets-v10'
          });
          const markers = JSON.parse(mapElement.dataset.markers);
          markers.forEach((marker) => {
            const popup = new mapboxgl.Popup().setHTML(marker.info_window);
            const element = document.createElement('div');
            element.dataset.markerId = marker.id
            element.className = 'marker';
            element.style.backgroundSize = 'cover';
            element.style.width = '20px';
            element.style.height = '30px';
            element.style.cursor = "pointer";
            new mapboxgl.Marker(element)
              .setLngLat([marker.lng, marker.lat])
              .setPopup(popup)
              .addTo(map);
          });
          fitMapToMarkers(map, markers);
          this.mapbuilt = true
          map.addControl(new MapboxGeocoder({
            accessToken: mapboxgl.accessToken,
            mapboxgl: mapboxgl
          }));
        }
      }
    }, 500);
  }
}
