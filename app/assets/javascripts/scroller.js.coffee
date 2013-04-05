$(".scroller .arrow-top").hover ((e) ->
  content = $(e.currentTarget).parent().parent().find(".scroll-content")
  content.scrollTo "0%", 2000
), (e) ->
  content = $(e.currentTarget).parent().parent().find(".scroll-content")
  content.stop()

$(".scroller .arrow-bottom").hover ((e) ->
  content = $(e.currentTarget).parent().parent().find(".scroll-content")
  content.scrollTo "100%", 2000
), (e) ->
  content = $(e.currentTarget).parent().parent().find(".scroll-content")
  content.stop()