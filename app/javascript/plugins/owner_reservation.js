const reservationStatusAccept = document.getElementById("reservation-status-accept");
reservationStatusAccept.addEventListener("click", (event) => {
  reservationStatusAccept.bookings = 'Accepted'
});

const reservationStatusDecline = document.getElementById("reservation-status-decline");
reservationStatusDecline.addEventListener("click", (event) => {
  reservationStatusDecline.bookings = 'Declined'
});
