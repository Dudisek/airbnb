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
//= require jt_address

// This function is call when Google Maps is loaded
window.googleMapInitialize = function(){

    // Simple usage
    $('.jt-address-autocomplete').jt_address();
};


// // #LISTING
// $(window).scroll(function(){
//   $("#scroll-with-me").stop().animate({"marginTop": ($(window).scrollTop()) + "px", "marginLeft":($(window).scrollLeft()) + "px"}, "slow" );
// });

// # MAP
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 49.6929469, lng: 18.34807390000003},
          zoom: 15
        });
      }



// $(document).ready(function() {
//   $('#scroll-with-me').scrollToFixed();
//   $('#footer').scrollToFixed( { bottom: 0, limit: $('#footer').offset().top } );  
// });


//  BELOW JUST JQUERY SLIDER SLIDER SLIDEEEER
