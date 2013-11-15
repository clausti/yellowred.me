window.YellowRed = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
		YellowRed.staticElementEventHandlers();
		YellowRed.instantiateCollections();
     
		YellowRed.appRouter = new YellowRed.Routers.App({
			central_content: $("#central-content"),
			search_results: $("#search-results"),
      yellow_box: $("#inner-yellow-cards"),
      red_box: $("#inner-red-cards")
		});
		Backbone.history.start();
    
    YellowRed.appRouter.populateYellowBox();
    YellowRed.appRouter.populateRedBox();
    YellowRed.all_profiles.fetch();
  }
};

$(document).ready(function(){
  YellowRed.initialize();
});
