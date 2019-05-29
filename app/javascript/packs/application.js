import "bootstrap";
import "animate.css";

// CSS
import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import { initMapbox } from '../plugins/init_mapbox';
//comment
initMapbox();
import "../plugins/flatpickr"

import { previewImageOnFileSelect } from "../components/photo_preview";
previewImageOnFileSelect();
