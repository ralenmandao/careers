$(function(){

  //  scroll animated with wow.js
  //  settings div wow
  wow = new WOW(
    {
      animateClass: 'animated fadeInUp',
      offset:       50,
      mobile:       true,  // false
      callback: function(box){ }
    }
  );
  //  Go! div wow
  wow.init();

});
