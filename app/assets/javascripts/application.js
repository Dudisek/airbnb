// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require datepicker
//= require i18n/datepicker.en
//= require jt_address


$('#calendar').data('datepicker') //= CALENDAR





// This function is call when Google Maps is loaded
window.googleMapInitialize = function(){

    // Simple usage
    $('.jt-address-autocomplete').jt_address();
};


// #LISTING
// $(window).scroll(function(){
//   $("#scroll-with-me").stop().animate({"marginTop": ($(window).scrollTop()), "marginLeft":($(window).scrollLeft())}, "slow");
// });

// $(document).ready(function() {
//     $('#scroll-with-me').animate(scrollToFixed({ marginTop: 250 }));
// });

// # MAP
var map;
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: gon.lat, lng: gon.lng},
    zoom: 15
  });
}

$('#message').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var recipient = button.data('whatever') // Extract info from data-* attributes
  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this)
  modal.find('.modal-title').text('New message to ' + recipient)
  modal.find('.modal-body input').val(recipient)
})


// # LISTING BOOKING SCROLLING DIFFERENT SOLUTION
// $(document).ready(function() {
//   $('#scroll-with-me').scrollToFixed();
//   $('#map').scrollToFixed( { marginottom: 250, limit: $('').offset().top } );  
// });


//  BELOW JUST JQUERY SLIDER SLIDER SLIDEEEER
