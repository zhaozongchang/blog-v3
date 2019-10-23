// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap/alert
//= require bootstrap/dropdown
//= require jquery
//= require jquery_ujs
//= require kindeditor
//= require social-share-button
//= require social-share-button/wechat
//= require bootstrap/collapse
//= require bootstrap/modal
//= require_tree .

//顶部回到
$(document).on('click', '#gotop', function () {
  $('body').animate({'scrollTop': 0}, 800) //在500ms的时间内，慢慢地回到顶部
})

 $(window).scroll(function () {
   if ($(this).scrollTop() > 650) {
     $('#gotop').fadeIn() // 当页面向下滚动的距离大于500px时，慢慢地显示「回到顶部按钮」
   } else {
     $('#gotop').fadeOut() // 否则慢慢地隐藏「回到顶部按钮」
   }
 })
