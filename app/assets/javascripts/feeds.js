$(document).ready(function() {
  var addFeedRole = "a[data-role='add-feed-form']";
  var newFeedFormRole = "form#new_feed";
  var feedFetchRole = "input[data-role='fetch'],form";

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
    newFeedFormRole,
    function() {
      $("form#new_feed input[type='submit']").prop("disabled", true);
    }
  );

  $(document).on(
    "ajax:complete",
    newFeedFormRole,
    function() {
      $("form#new_feed input[type='submit']").prop("disabled", false);
    }
  );

  $(document).on(
    "ajax:success",
    newFeedFormRole,
    function() {
      $(this)[0].reset();
    }
  );

  $(document).on(
    "ajax:beforeSend",
    feedFetchRole,
    function() {
      $(this).find("input[type='submit']").prop("disabled", true);
    }
  );

  $(document).on(
    "ajax:complete",
    feedFetchRole,
    function() {
      $(this).find("input[type='submit']").prop("disabled", false);
    }
  );
});
