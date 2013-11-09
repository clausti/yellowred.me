YellowRed.Views.NewMessage = Backbone.View.extend({

  form_body_template: JST['messages/new_body'],
  recip_input_template: JST['messages/new_recip'],
  profile_recip_input_template: JST['messages/from_profile'],
  
  events: {
    "submit form": "sendMessage",
    "blur #message_recipient": "checkForUser"
  },
	
	render: function() {
		var messageForm = this.form_body_template();
    this.$el.html(messageForm);
    var profileId = $('#new-message').attr('data-id')
    
    if ( profileId == 'messages' ) {
      this.$el.find("#new-message-form").prepend(this.recip_input_template());
      return this;
    } else {
      this.$el.find("#new-message-form").prepend(this.profile_recip_input_template());
  		return this;
    }
	},
  
  checkForUser: function(event) {
    var input = $(event.currentTarget).val();
    $.ajax({
      url: input,
      success: function() {
        $("#username-errors").html('');
      },
      error: function() {
        $("#username-errors").html("Username not found!");
      }
    });
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