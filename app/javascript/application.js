// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import { initSweetalert } from './plugins/init_sweetalert';

initSweetalert('#sweet-alert-demo', {
  title: "Thank you 👏🏾!",
  text: "Your registration is confirmed.",
  icon: "success"



});
