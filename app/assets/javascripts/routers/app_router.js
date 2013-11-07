YellowRed.Routers.App = Backbone.Router.extend({
	
	routes: {
		"my-maybe-list": "displayMyMaybes",
		"my-nope-list": "displayMyNopes",
		"who-i-starred": "displayMyStarred",
		"who-starred-me": "displayMyStarring",
	},
	
	displayMyMaybes: function() {
		YellowRed.maybe_profiles = YellowRed.maybe_profiles || new YellowRed.Collections.MaybeProfiles();
		YellowRed.maybe_profiles.fetch({
			success: function() {
				var myMaybes = new YellowRed.Views.ProfilesList({
					collection: YellowRed.maybe_profiles
				});
				$("#central-content").html(myMaybes.render().$el)
			}
		});
	},
	
	displayMyNopes: function() {
		YellowRed.nope_profiles = YellowRed.nope_profiles || new YellowRed.Collections.NopeProfiles();
		YellowRed.nope_profiles.fetch({
			success: function() {
				var myNopes = new YellowRed.Views.ProfilesList({
					collection: YellowRed.nope_profiles
				});
				$("#central-content").html(myNopes.render().$el)
			}
		});
	},
	
	displayMyStarred: function() {
		YellowRed.starred_profiles = YellowRed.starred_profiles || new YellowRed.Collections.StarredProfiles();
		YellowRed.starred_profiles.fetch({
			success: function() {
				var myStarred = new YellowRed.Views.ProfilesList({
					collection: YellowRed.starred_profiles
				});
				$("#central-content").html(myStarred.render().$el)
			}
		});
	},
	
	displayMyStarring: function() {
		YellowRed.starring_profiles = YellowRed.starring_profiles || new YellowRed.Collections.StarringProfiles();
		YellowRed.starring_profiles.fetch({
			success: function() {
				var myStarring = new YellowRed.Views.ProfilesList({
					collection: YellowRed.starring_profiles
				});
				$("#central-content").html(myStarring.render().$el)
			}
		});
	},

});
