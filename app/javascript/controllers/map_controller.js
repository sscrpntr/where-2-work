import { Controller } from "@hotwired/stimulus"
// import * as mapboxgl from 'mapbox-gl';
// (mapboxgl as any).accessToken = mapboxAccessToken;
// import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="mapbox"
export default class extends Controller {
  static targets = ["map", "mapButton"]

  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        trackUserLocation: true,
        showUserHeading: true
      })
    )
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  resize() {
    console.log('resizing')
    this.map.resize()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker, index) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window) // Add this
      if (index == this.markersValue.length - 1) {
        new mapboxgl.Marker({ color: "red" })
          .setLngLat([marker.lng, marker.lat])
          .addTo(this.map)
      } else {
        new mapboxgl.Marker()
          .setLngLat([marker.lng, marker.lat])
          .setPopup(popup) // Add this
          .addTo(this.map)
      }
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
