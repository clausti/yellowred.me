YellowRed.Routers.App = Backbone.Router.extend({
	initialize: function(page_elements){
		this.centralContent = page_elements.central_content;
		this.searchResultsBox = page_elements.search_results;
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
  
  _swapView: function(newView) {
    this.currentView && this.currentView.remove();
    this.currentView = newView;
    this.centralContent.html(newView.render().$el);
  },
	
	populateSearchResults: function() {
		var searchResults = new YellowRed.Views.ProfilesList({
			collection: YellowRed.searched_profiles
		});
    this.currentView = searchResults;
		this.searchResultsBox.html(searchResults.render().$el);
		YellowRed.searched_profiles.fetch();
	},
	
	displayAllMessages: function() {
		var allMessages = new YellowRed.Views.MessagesList({
      header: $("<h3>Everybody talks, everybody talks...</h3>"),
			collection: YellowRed.messages
		});
    this._swapView(allMessages);
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
		var myMaybes = new YellowRed.Views.ProfilesList({
      sectionHeader: $("<h3>Maybe?</h3><div class='central-info-blurb'>Get something started! (Drag cards to sort.)</div>"),
			collection: YellowRed.maybe_profiles
		});
    this._swapView(myMaybes);
		YellowRed.maybe_profiles.fetch();
	},
	
	displayMyNopes: function() {
		var myNopes = new YellowRed.Views.ProfilesList({
      sectionHeader: $("<h3>Nope!</h3><div class='central-info-blurb'>These users will not appear in your search results.</div>"),
			collection: YellowRed.nope_profiles
		});
    this._swapView(myNopes);
		YellowRed.nope_profiles.fetch();
	},
	
	displayMyStarred: function() {
		var myStarred = new YellowRed.Views.ProfilesList({
      sectionHeader: $("<h3>Who I starred</h3><div class='central-info-blurb'>Pretty...</div>"),
			collection: YellowRed.starred_profiles
		});
    this._swapView(myStarred);
		YellowRed.starred_profiles.fetch();
	},
	
	displayMyStarring: function() {
		var myStarring = new YellowRed.Views.ProfilesList({
      sectionHeader: $("<h3>Who starred me?</h3><div class='central-info-blurb'>They like me!</div>"),
			collection: YellowRed.starring_profiles
		});
    this._swapView(myStarring);
		YellowRed.starring_profiles.fetch();
	},
	
	displayAllProfiles: function() {
		var allProfiles = new YellowRed.Views.ProfilesList({
      sectionHeader: $("<h3 style='width:100%'>Browse profiles...</h3>"),
			collection: YellowRed.all_profiles
		});
    this._swapView(allProfiles);
		YellowRed.all_profiles.fetch();
	},
	 
	displayProfileDetail: function(usernameURL) {
    var that = this;
		$.ajax({
			url: usernameURL,
			success: function(res) {
				var profile = new YellowRed.Models.Profile(res);
				var profileView = new YellowRed.Views.ProfileDetail({
          path: usernameURL,
					model: profile
				});
				that._swapView(profileView);
			},
			error: function(req, status, err) {
        that.currentView.remove();
        that.currentView = $("<br><br><h3>Sorry! We don't have a user with that name.</h3>")
    		central_content.html(that.currentView);
			}
		});
	},
  
  displayProfileDetailById: function(id) {
    this.displayProfileDetail("profiles/" + id);    
  },

});
