document.addEventListener("turbolinks:load", function() {
  $input = $("[data-behavior='autocomplete']")

  var options = {
    getValue: "name",
    url: function(phrase) {
      return "bl_data/search.json?q=" + phrase;
    },
    categories: [
      {
        listLocation: "medicines",
        header: "<strong>Medicines</strong>",
      }
    ],
    list: {
      onChooseEvent: function() {
        var id = $input.getSelectedItemData().id
        log.console(id);
      }
    }
  }

  $input.easyAutocomplete(options)
});