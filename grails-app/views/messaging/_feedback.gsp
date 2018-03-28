<div>

  <script type="text/javascript">
    $(function() { // ready
      $('#feedback_modal').on('submit', function(e) {

        console.log("submit", $('#feedback_form')[0].action, $( "#feedback_form" ).serialize());

        e.preventDefault(); // prevent native submit

        $.post( $('#feedback_form')[0].action, $( "#feedback_form" ).serialize())
        .done(function( data ) {
          console.log( data );

          if (!data.error) type = 'success';
          else type = 'warning';

          $('.modal-alert').append('<div class="alert alert-'+ type +' alert-dismissible fade show" role="alert">'+ data.message +'<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>');

        })
        .fail(function() {
          console.log( "error" );
        });

        /*
        $(this).ajaxSubmit({
          url: $('#feedback_form')[0].action, // without this is not taking the action as url
          type: 'post',
          success: function(data, status, response) {
            //console.log(data, response);
            alrt = '<div class="alert alert-info alert-dismissible global" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+ data.message +'</div>';
            $('body').append('<div class="global_alert_container">'+ alrt +'</div>');
          },
          error: function(a,b,c) {
            console.log(a,b,c);
            alrt = '<div class="alert alert-warning alert-dismissible global" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>An error occurred sending your feedback, please try again later.</div>';
            $('body').append('<div class="global_alert_container">'+ alrt +'</div>');
          }
        });
        */


      });
    });
  </script>

  <!-- feedback modal form -->
  <div class="modal fade" id="feedback_modal" tabindex="-1" role="dialog" aria-labelledby="feedback_modal_label">
    <div class="modal-dialog" role="document">
      <g:form url="[controller:'messaging', action: 'feedback']" role="form" id="feedback_form">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Tell us what you think about CoT!</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">

          <div class="modal-alert"></div>

          <div class="form-group">
            <label>Message</label>
            <textarea class="form-control" rows="3" name="msg" required="required"></textarea>
          </div>
          <div class="form-group">
            <label>Your email</label>
            <input type="email" name="from_email" class="form-control" required="required" />
          </div>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Send!</button>
        </div>
      </div>
      </g:form>
    </div>
  </div>
</div>
