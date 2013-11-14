window.YellowRed = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
		YellowRed.staticElementEventHandlers();
		YellowRed.instantiateProfileCollections();
		
		YellowRed.appRouter = new YellowRed.Routers.App({
			central_content: $("#central-content"),
			search_results: $("#search-results"),
      // yellow_box: $("#inner-yellow"),
      // red_box: $("#inner-red")
		});
		Backbone.history.start();
  }
};

$(document).ready(function(){
  YellowRed.initialize();
});
