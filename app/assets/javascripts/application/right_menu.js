$(function () {
  var button  = $(".right-button");
  var content = $(".right-content");

  button.on("click", function () {
    if (!$(this).hasClass("open")) {
      $(this).animate({"right": "300px"});
      content.animate({"right": "0"});
      $(this).addClass("open");
    } else {
      $(this).animate({"right": "0"});
      content.animate({"right": "-300px"});
      $(this).removeClass("open");
    }
  });

  $("body").append(button);
  $("body").append(content);
});
