import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="eventmap"
export default class extends Controller {
  static values = {
    apiKey: String,
    events: Array
  }

  connect() {
    // console.log("connect", this.apiKeyValue);
    mapboxgl.accessToken = this.apiKeyValue
    // console.log(this.apiKeyValue);

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
    // console.log('fitMapToMarkers', this.eventValue.longitude, this.eventValue.latitude)
    const bounds = new mapboxgl.LngLatBounds()

    this.eventsValue.forEach((event) => {
      bounds.extend([event.longitude, event.latitude ])
    })
    this.map.fitBounds(bounds, {padding: 50})

    // bounds.extend([this.eventsValue.longitude, this.eventsValue.latitude ])
    // console.log(bounds)
    // this.map.fitBounds(bounds, {padding: 50, zoom: 14})
  }

  #addMarkersToMap() {
    // console.log("addMarkersToMap");
    // const popup = new mapboxgl.Popup().setHTML(this.eventValue.name)
    // new mapboxgl.Marker()
    //   .setLngLat([ this.eventValue.longitude, this.eventValue.latitude ])
    //   .setPopup(popup)
    //   .addTo(this.map);
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
