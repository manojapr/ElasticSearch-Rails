# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  menu = $("#navigation-menu")
  menuToggle = $("#js-mobile-menu")
  signUp = $(".sign-up")
  $(menuToggle).on "click", (e) ->
    e.preventDefault()
    menu.slideToggle ->
      menu.removeAttr "style"  if menu.is(":hidden")
      return

    return

  
  # underline under the active nav item
  $(".nav .nav-link").click ->
    $(".nav .nav-link").each ->
      $(this).removeClass "active-nav-item"
      return

    $(this).addClass "active-nav-item"
    $(".nav .more").removeClass "active-nav-item"
    return

  return


