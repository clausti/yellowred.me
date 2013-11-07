YellowRed.Routers.App = Backbone.Router.extend({
	initialize: function(page_elements){
		this.central_content = page_elements.central_content;
	},
	
	routes: {
		"my-maybe-list": "displayMyMaybes",
		"my-nope-list": "displayMyNopes",
		"who-i-starred": "displayMyStarred",
		"who-starred-me": "displayMyStarring",
		"profiles": "displayAllProfiles",
		// "profile": "displayMyProfile",
	// 	":username": "displayProfileDetail"
	},
	
	displayMyMaybes: function() {
		var central_content = this.central_content;
		YellowRed.maybe_profiles = YellowRed.maybe_profiles || new YellowRed.Collections.MaybeProfiles();
		YellowRed.maybe_profiles.fetch({
			success: function() {
				var myMaybes = new YellowRed.Views.ProfilesList({
					collection: YellowRed.maybe_profiles
				});
				central_content.html("<h3>Maybe?</h3><div class='central-info-blurb'>Get something started! (Drag cards to sort.)</div>")
				central_content.append(myMaybes.render().$el)
			}
		});
	},
	
	displayMyNopes: function() {
		var central_content = this.central_content;
		YellowRed.nope_profiles = YellowRed.nope_profiles || new YellowRed.Collections.NopeProfiles();
		YellowRed.nope_profiles.fetch({
			success: function() {
				var myNopes = new YellowRed.Views.ProfilesList({
					collection: YellowRed.nope_profiles
				});
				central_content.html("<h3>Nope!</h3><div class='central-info-blurb'>These users will not appear in your search results.</div>")
				central_content.append(myNopes.render().$el)
			}
		});
	},
	
	displayMyStarred: function() {
		var central_content = this.central_content;
		YellowRed.starred_profiles = YellowRed.starred_profiles || new YellowRed.Collections.StarredProfiles();
		YellowRed.starred_profiles.fetch({
			success: function() {
				var myStarred = new YellowRed.Views.ProfilesList({
					collection: YellowRed.starred_profiles
				});
				central_content.html($("<h3>Who I starred</h3><div class='central-info-blurb'>Pretty...</div>"))
				central_content.append(myStarred.render().$el)
			}
		});
	},
	
	displayMyStarring: function() {
		var central_content = this.central_content;
		YellowRed.starring_profiles = YellowRed.starring_profiles || new YellowRed.Collections.StarringProfiles();
		YellowRed.starring_profiles.fetch({
			success: function() {
				var myStarring = new YellowRed.Views.ProfilesList({
					collection: YellowRed.starring_profiles
				});
				central_content.html($("<h3>Who starred me?</h3><div class='central-info-blurb'>They like me!</div>"))
				central_content.append(myStarring.render().$el)
			}
		});
	},
	
	displayAllProfiles: function() {
		var central_content = this.central_content;
		YellowRed.all_profiles = YellowRed.all_profiles || new YellowRed.Collections.AllProfiles();
		YellowRed.all_profiles.fetch({
			success: function() {
				var allProfiles = new YellowRed.Views.ProfilesList({
					collection: YellowRed.all_profiles
				});
				central_content.html($("<h3>Browse profiles...</h3>"))
				central_content.append(allProfiles.render().$el)
			}
		});
	},
	
	// displayMyProfile: function() {
	// 	
	// },
	// 
	// displayProfileDetail: function() {
	// 	
	// },

});
