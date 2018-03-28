package com.cabolabs.openehr

import grails.converters.JSON


class MessagingController {

   def mailService

   // users send feedback from Web Console
   def feedback(String from_email, String msg)
   {
      if (!from_email || !text)
      {
         render(contentType: 'application/json') {
           message 'Please add an email and message'
           error true
         }
         return
      }

      // Use the default from email as destination for this feedback form
      String to_email = System.getenv('EHRSERVER_EMAIL_FROM')

      try
      {
         mailService.sendMail {
            //from    from_email
            to      to_email
            subject 'CaboLabs openEHR Toolkit Feedback'
            text    'Message from '+ from_email +': '+ msg
         }
      }
      catch (Exception e)
      {
         render(contentType: 'application/json') {
           message 'There was an error sending the message '+ e.message
           error true
         }
         return
      }

      render(contentType: 'application/json') {
        message 'Feedback sent, thanks!'
        error false
      }
   }
}
