(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-55030607-1', 'auto');
ga('send', 'pageview');

var disqus = document.getElementById("disqus_thread");
if (disqus) {
  /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
  var disqus_shortname = 'therabona'; // required: replace example with your forum shortname

  /* * * DON'T EDIT BELOW THIS LINE * * */
  (function() {
    var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
    dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
  })();
}

var initSummernote = function(){
  $(".summernote").each(function(){
    var $summernote = $(this);

    $summernote.summernote({
      height: 500
    });

    $summernote.code($summernote.val());
    $summernote.closest('form').submit(function(){
      $summernote.val($summernote.code());
      return true;
    });
  });
}

$(function(){

  // Headroom.js
  var header   = document.getElementById("header"),
      headroom = new Headroom(header, {
        offset: 44
      });
  headroom.init();

  // Sommernote.js
  if ($('.summernote').length) {
    initSummernote();
  }

  $(".ujs-load").on("ajax:complete", function(event, xhr, status){
    var $target = $($(this).data("target"));

    $target.html(xhr.responseText);
    initSummernote();
  });

});