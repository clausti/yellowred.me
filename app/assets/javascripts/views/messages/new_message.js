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
    var msgData = $(event.currentTarget).serializeJSON();
    $.ajax({
      url: "messages",
      data: msgData,
      type: 'post',
      success: function(res) {
       var message = new YellowRed.Models.Message(); 
       YellowRed.messages.add(message);
       console.log('you sent a message!');
      },
      error: function(req, err) {
        console.log(err);
      }
    });
    YellowRed.appRouter.navigate('messages', {trigger:true});
  },

});