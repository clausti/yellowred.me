YellowRed.Views.NewMessage = Backbone.View.extend({

  template: JST['messages/new'],
  
  events: {
    "submit form": "sendMessage",
  },
	
	render: function() {
		var messageForm = this.template();
    this.$el.html(messageForm);
		return this;
	},
  
  sendMessage: function(event) {
    event.preventDefault();
    
    //ajax stuff
    
    console.log('you sent a message!')
    YellowRed.appRouter.navigate('messages', {trigger:true});
  },

});