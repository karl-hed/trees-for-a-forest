import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="eventmap"
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
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "contain"
      customMarker.style.width = "25px"
      customMarker.style.height = "25px"
      console.log("customMarker.style.backgroundImage: ", customMarker.style.backgroundImage)

      // const popup = new mapboxgl.Popup().setHTML(marker.name)
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)
      new mapboxgl.Marker()
        // .setLngLat([ marker.longitude, marker.latitude ])
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map);
    })
  }
}
