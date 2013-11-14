YellowRed.Routers.App = Backbone.Router.extend({
	initialize: function(page_elements){
		this.centralContent = page_elements.central_content;
		this.searchResultsBox = page_elements.search_results;
    this.yellowBox = page_elements.yellow_box;
    this.redBox = page_elements.red_box;
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
  
  populateYellowBox: function() {
    var that = this;
    YellowRed.maybe_profiles.fetch({
      wait: true,
      success: function() {
        var boxMaybes = new YellowRed.Views.BoxList({
          maybe: "maybe",
          collection: YellowRed.maybe_profiles
        });
        that.yellowBox.html(boxMaybes.render().$el);
        $(".mini-maybe").draggable({
            snap: true,
            revert: true
          });
          
        $("#inner-yellow").droppable({
          drop: YellowRed.profile_button_responses.maybeProfile,
          out: YellowRed.profile_button_responses.unMaybeProfile
        });
      }
    });
  },
  
  populateRedBox: function() {
    var that = this;
    YellowRed.nope_profiles.fetch({
      wait: true,
      success: function() {
        var boxNopes = new YellowRed.Views.BoxList({
          maybe: "nope",
          collection: YellowRed.nope_profiles
        });
        that.redBox.html(boxNopes.render().$el);
        $(".mini-nope").draggable({
            snap: true,
            revert: true
          });
          
        $("#inner-red").droppable({
          drop: YellowRed.profile_button_responses.nopeProfile,
          out: YellowRed.profile_button_responses.unNopeProfile
        });
      }
    });
  },
  
  _swapView: function(newView, contentDest) {
    var contentDest = contentDest || this.centralContent;
    this.currentView && this.currentView.remove();
    this.currentView = newView;
    contentDest.html(newView.render().$el);
  },
  
	populateSearchResults: function() {
    var that = this;
		YellowRed.searched_profiles.fetch({ 
      wait: true, 
      success: function() {
    		var searchResults = new YellowRed.Views.ProfilesList({
    			collection: YellowRed.searched_profiles
    		});
        that._swapView(searchResults, that.searchResultsBox);
      }
    });
	},
  
	displayAllMessages: function() {
    var that = this;
		YellowRed.messages.fetch({
		  wait: true,
      success: function() {
    		var allMessages = new YellowRed.Views.MessagesList({
          header: $("<h3>Everybody talks, everybody talks...</h3>"),
    			collection: YellowRed.messages
    		});
        that._swapView(allMessages);
      }
		});
	},
  
  displayNewMessageForm: function() {
    console.log("clicked new message")
    var newForm = new YellowRed.Views.NewMessage();
    $('#new-message').html(newForm.render().$el);
    $('#new-message').toggleClass("button new-message-button", false)
    $('#new-message').toggleClass("new-message-card round-corners shadow", true)
  },
	
	displayMyMaybes: function() {
    var that = this;
		YellowRed.maybe_profiles.fetch({
		  wait: true,
      success: function() {
    		var myMaybes = new YellowRed.Views.ProfilesList({
          sectionHeader: $("<h3>Maybe?</h3><div class='central-info-blurb'>Get something started! (Drag cards to sort.)</div>"),
    			collection: YellowRed.maybe_profiles
    		});
        that._swapView(myMaybes);
      }
		});
	},
	
	displayMyNopes: function() {
		var that = this;
		YellowRed.nope_profiles.fetch({ 
      wait: true,
      success: function() {
    		var myNopes = new YellowRed.Views.ProfilesList({
          sectionHeader: $("<h3>Nope!</h3><div class='central-info-blurb'>These users will not appear in your search results.</div>"),
    			collection: YellowRed.nope_profiles
    		});
        that._swapView(myNopes);
      } 
    });
	},
	
	displayMyStarred: function() {
    var that = this;
		YellowRed.starred_profiles.fetch({ 
      wait: true,
      success: function() {
    		var myStarred = new YellowRed.Views.ProfilesList({
          sectionHeader: $("<h3>Who I starred</h3><div class='central-info-blurb'>Pretty...</div>"),
    			collection: YellowRed.starred_profiles
    		});
        that._swapView(myStarred);
      }
    });
	},
	
	displayMyStarring: function() {
		var that = this;
		YellowRed.starring_profiles.fetch({ 
      wait: true,
      success: function() {
    		var myStarring = new YellowRed.Views.ProfilesList({
          sectionHeader: $("<h3>Who starred me?</h3><div class='central-info-blurb'>They like me!</div>"),
    			collection: YellowRed.starring_profiles
    		});
        that._swapView(myStarring);
      }
    });
	},
	
	displayAllProfiles: function() {
		var that = this;
		YellowRed.all_profiles.fetch({
      wait: true,
      success: function() {
    		var allProfiles = new YellowRed.Views.ProfilesList({
          sectionHeader: $("<h3 style='width:100%'>Browse profiles...</h3>"),
    			collection: YellowRed.all_profiles
    		});
        that._swapView(allProfiles);
      }
    });
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
