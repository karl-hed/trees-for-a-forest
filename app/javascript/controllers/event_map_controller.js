import { Controller } from "@hotwired/stimulus"
// JS CONTROLLER FOR SHOW(EACH EVENT) PAGE
export default class extends Controller {
  static values = {
    apiKey: String,
    event: Object
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
    console.log('fitMapToMarkers', this.eventValue.longitude, this.eventValue.latitude)
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([this.eventValue.longitude, this.eventValue.latitude ])
    console.log(bounds)
    this.map.fitBounds(bounds, {padding: 50, zoom: 14})
  }
  #addMarkersToMap() {
    const popup = new mapboxgl.Popup().setHTML(this.eventValue.name)
    new mapboxgl.Marker()
      .setLngLat([ this.eventValue.longitude, this.eventValue.latitude ])
      .setPopup(popup)
      .addTo(this.map);
  }
}
