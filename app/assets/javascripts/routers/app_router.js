YellowRed.Routers.App = Backbone.Router.extend({
	initialize: function(page_elements){
		this.central_content = page_elements.central_content;
		this.search_results = page_elements.search_results;
	},
	
	routes: {
		"": "populateSearchResults",
		"messages": "displayAllMessages",
		"my-maybe-list": "displayMyMaybes",
		"my-nope-list": "displayMyNopes",
		"who-i-starred": "displayMyStarred",
		"who-starred-me": "displayMyStarring",
		"profiles": "displayAllProfiles",
		":username": "displayProfileDetail"
	},
	
	populateSearchResults: function() {
		var searchResultsBox = this.search_results;
		YellowRed.searched_profiles.fetch({
			success: function() {
				var searchResults = new YellowRed.Views.ProfilesList({
					collection: YellowRed.searched_profiles
				});
				searchResultsBox.html(searchResults.render().$el);
			}
		});
	},
	
	displayAllMessages: function() {
		var central_content = this.central_content;
		YellowRed.messages = YellowRed.messages || new YellowRed.Collections.AllMessages();
		YellowRed.messages.fetch({
			success: function() {
				var allMessages = new YellowRed.Views.MessagesList({
					collection: YellowRed.messages
				});
				central_content.html($("<h3>Everybody talks, everybody talks...</h3>"))
				central_content.append(allMessages.render().$el)
			}
		});
	},
	
	displayMyMaybes: function() {
		var central_content = this.central_content;
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
	 
	displayProfileDetail: function(username) {
		var central_content = this.central_content;
		$.ajax({
			url: username,
			success: function(res) {
				var profile = new YellowRed.Models.Profile(res);
				var profileView = new YellowRed.Views.ProfileDetail({
					model: profile
				});
				central_content.html("<h3>" + profile.escape('username') + "</h3>"); 
				
				if (username == "profile") {
					central_content.append("<a href='/profile/edit' class='button' style='margin:5px'>Edit profile</a><br>");
				} else {
					central_content.append(JST['profiles/buttons']({profile:profile}));
				}
				central_content.append(profileView.render().$el)
			},
			error: function(req, status, err) {
				console.log("No such user.")
			}
		});
	},

});
