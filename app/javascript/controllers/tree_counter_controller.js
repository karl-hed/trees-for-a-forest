import { CountUp } from "countup.js";

const countUp = new CountUp('tree-counter', 12574, { enableScrollSpy: true, duration: 7 });

import { Controller } from "@hotwired/stimulus"

// JS CONTROLLER FOR PROFILE PAGE
export default class extends Controller {
  static values = {
    apiKey: String,
    events: Array
  }

  connect() {
    console.log(this.eventsValue)
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

    this.eventsValue.forEach((marker) => {
      bounds.extend([ marker.lng, marker.lat ])
    })
    this.map.fitBounds(bounds, {padding: 50})
  }

  #addMarkersToMap() {
    this.eventsValue.forEach((marker) => {
      // console.log(marker.name);

      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.width = "35px"
      customMarker.style.height = "35px"
      customMarker.style.backgroundSize = "contain"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      // const popup = new mapboxgl.Popup().setHTML(marker.name)
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)
      new mapboxgl.Marker({element: customMarker})
        // .setLngLat([ marker.longitude, marker.latitude ])
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map);
    })
  }
}
