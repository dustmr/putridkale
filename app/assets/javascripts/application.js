// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(function(){ $(document).foundation(); });

$(function() {
  var body = $('body');
  var backgrounds = ['url(http://moeatthemovies.com/wp-content/uploads/2012/08/wpid-photo-aug-5-2012-333-pm.jpg?w=1000)', 'url(http://i.imgur.com/4o8m9NC.jpg)','url(http://www.openlettersmonthly.com/issue/wp-content/uploads/2012/12/2.jpg)', 'url(http://images1.fanpop.com/images/photos/1600000/SPR-Wallpaper-saving-private-ryan-1669582-1680-1050.jpg)', 'url(http://i.imgur.com/UkbfAQA.jpg?1)', 'url(http://www.wallpaperup.com/uploads/wallpapers/2013/05/07/83154/72a9d3800369d26d7c1b6030ebb87d70.jpg)', 'url(http://img.inspiringwallpapers.net/wp-content/uploads/2013/03/leon-1994-movie-wallpaper-730x400.jpg)', 'url(http://40.media.tumblr.com/56676fa889adb8f9e0738da6c1c94d49/tumblr_mr425vVaJ11qej1i6o2_1280.jpg)'];
var current = 0;

function nextBackground() {
  body.css(
   'background-image',
    backgrounds[current = ++current % backgrounds.length]
 );

 setTimeout(nextBackground, 8000);
 }
 setTimeout(nextBackground, 8000);
   body.css('background-image', backgrounds[0]);
 });
