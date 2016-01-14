$(document).ready(function() {
  var addFeedRole = "a[data-role='add-feed-form']";

  $(document).on(
    "click",
    addFeedRole,
    function(event) {
      event.preventDefault();
      $("div#feed-form-container").show();
    }
  );

  $(document).on(
    "ajax:beforeSend",
    "form#new_feed",
    function() {
      $("form#new_feed input[type='submit']").prop("disabled", true);
    }
  );

  $(document).on(
    "ajax:complete",
    "form#new_feed",
    function() {
      $("form#new_feed input[type='submit']").prop("disabled", false);
    }
  );

  $(document).on(
    "ajax:success",
    "form#new_feed",
    function() {
      $(this)[0].reset();
    }
  );
});
