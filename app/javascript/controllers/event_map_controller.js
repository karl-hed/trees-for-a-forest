import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="eventmap"
export default class extends Controller {
  static values = {
    apiKey: String,
    events: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v11"
    })
    this.#addMarkersToMap()

    setTimeout(() => {
      this.#fitMapToMarkers()
    }, 300)
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()

    this.eventsValue.forEach((event) => {
      bounds.extend([event.longitude, event.latitude ])
    })
    this.map.fitBounds(bounds, {padding: 50})
  }

  #addMarkersToMap() {
    this.eventsValue.forEach((event) => {
      console.log(event.name);
      const popup = new mapboxgl.Popup().setHTML(event.name)
      new mapboxgl.Marker()
        .setLngLat([ event.longitude, event.latitude ])
        .setPopup(popup)
        .addTo(this.map);
    })
  }
}
