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
			search_results: $("#search-results")
		});
		Backbone.history.start();
  }
};

$(document).ready(function(){
  YellowRed.initialize();
});
