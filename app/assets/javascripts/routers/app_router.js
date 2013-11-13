YellowRed.Routers.App = Backbone.Router.extend({
	initialize: function(page_elements){
		this.central_content = page_elements.central_content;
		this.search_results = page_elements.search_results;
	},
	
	routes: {
		"": "populateSearchResults",
		"messages": "displayAllMessages",
    'new-message': "displayNewMessageForm",
		"my-maybe-list": "displayMyMaybes",
		"my-nope-list": "displayMyNopes",
		"who-i-starred": "displayMyStarred",
		"who-starred-me": "displayMyStarring",
    "profiles/:id": "displayProfileDetailById",
		"profiles": "displayAllProfiles",
		":username": "displayProfileDetail",
	},
	
	populateSearchResults: function() {
		var searchResultsBox = this.search_results;
		var searchResults = new YellowRed.Views.ProfilesList({
			collection: YellowRed.searched_profiles
		});
		searchResultsBox.html(searchResults.render().$el);
		YellowRed.searched_profiles.fetch();
	},
	
	displayAllMessages: function() {
		var central_content = this.central_content;
		var allMessages = new YellowRed.Views.MessagesList({
			collection: YellowRed.messages
		});
		central_content.html($("<h3>Everybody talks, everybody talks...</h3>"))
		central_content.append(allMessages.render().$el)
		YellowRed.messages.fetch();
	},
  
  displayNewMessageForm: function() {
    console.log("clicked new message")
    var newForm = new YellowRed.Views.NewMessage();
    $('#new-message').html(newForm.render().$el);
    $('#new-message').toggleClass("button new-message-button", false)
    $('#new-message').toggleClass("new-message-card round-corners shadow", true)
  },
	
	displayMyMaybes: function() {
		var central_content = this.central_content;
		var myMaybes = new YellowRed.Views.ProfilesList({
			collection: YellowRed.maybe_profiles
		});
		central_content.html("<h3>Maybe?</h3><div class='central-info-blurb'>Get something started! (Drag cards to sort.)</div>");
		central_content.append(myMaybes.render().$el);
		YellowRed.maybe_profiles.fetch();
	},
	
	displayMyNopes: function() {
		var central_content = this.central_content;
		var myNopes = new YellowRed.Views.ProfilesList({
			collection: YellowRed.nope_profiles
		});
		central_content.html("<h3>Nope!</h3><div class='central-info-blurb'>These users will not appear in your search results.</div>");
		central_content.append(myNopes.render().$el);
		YellowRed.nope_profiles.fetch();
	},
	
	displayMyStarred: function() {
		var central_content = this.central_content;
		var myStarred = new YellowRed.Views.ProfilesList({
			collection: YellowRed.starred_profiles
		});
		central_content.html($("<h3>Who I starred</h3><div class='central-info-blurb'>Pretty...</div>"));
		central_content.append(myStarred.render().$el);
		YellowRed.starred_profiles.fetch();
	},
	
	displayMyStarring: function() {
		var central_content = this.central_content;
		var myStarring = new YellowRed.Views.ProfilesList({
			collection: YellowRed.starring_profiles
		});
		central_content.html($("<h3>Who starred me?</h3><div class='central-info-blurb'>They like me!</div>"))
		central_content.append(myStarring.render().$el)
    
		YellowRed.starring_profiles.fetch();
	},
	
	displayAllProfiles: function() {
		var central_content = this.central_content;
		var allProfiles = new YellowRed.Views.ProfilesList({
			collection: YellowRed.all_profiles
		});
		central_content.html($("<h3>Browse profiles...</h3>"))
		central_content.append(allProfiles.render().$el)
		YellowRed.all_profiles.fetch();
	},
	 
	displayProfileDetail: function(usernameURL) {
		var central_content = this.central_content;
		$.ajax({
			url: usernameURL,
			success: function(res) {
				var profile = new YellowRed.Models.Profile(res);
				var profileView = new YellowRed.Views.ProfileDetail({
          path: usernameURL,
					model: profile
				});
				central_content.html(profileView.render().$el)
			},
			error: function(req, status, err) {
    		central_content.html($("<br><br><h3>Sorry! We don't have a user with that name.</h3>"));
			}
		});
	},
  
  displayProfileDetailById: function(id) {
    this.displayProfileDetail("profiles/" + id);    
  },

});
