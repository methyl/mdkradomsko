// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require rubyJs
//= require flexie
//= require scrollTo
//= require scroller
//= require glDatePicker
//= require events_calendar
//= require jquery-ui-1.8.18.custom.min
//= require jquery.smooth-scroll.min
//= require lightbox

$(function() {

    var marquee = $(".marquee"); 
    marquee.css({"overflow": "hidden", "width": "100%"});

    // wrap "My Text" with a span (IE doesn't like divs inline-block)
    marquee.wrapInner("<span>");
    marquee.find("span").css({ "width": "50%", "display": "inline-block", "text-align":"center" }); 
    marquee.append(marquee.find("span").clone()); // now there are two spans with "My Text"

    marquee.wrapInner("<div>");
    marquee.find("div").css("width", "200%");

    var reset = function() {
        $(this).css("margin-left", "0%");
        $(this).animate({ "margin-left": "-100%" }, 10000, 'linear', reset);
    };

    reset.call(marquee.find("div"));
    $('p').each(function() {
        el = $(this);
        var video_id = el.text().split('v=')[1];
        if(video_id) {
            el.html('');
            src = 'http://www.youtube.com/embed/' + video_id
            var iframe = $('<iframe src="'+src+'" width="420" height="345" frameborder="0" allowfullscreen />')
            el.append(iframe);
        }
    });

    $('p > img').each(function() {
        img = $(this);
        src = img.attr('src').replace(/LkpQRyJd.*\//, 'LkpQRyJdXQ/') // convert to full size
        img.wrap('<a href="'+src+'" rel="lightbox[group]">')
    });
});
