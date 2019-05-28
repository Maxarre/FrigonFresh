import "bootstrap";

// CSS
import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
import "../plugins/flatpickr"

import { previewImageOnFileSelect } from "../components/photo_preview";
previewImageOnFileSelect();
