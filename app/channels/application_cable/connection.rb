module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    protected
      def find_verified_user
        session = cookies.signed_or_encrypted['_app_session']
        # debugger
        if session && session['warden.user.user.key'] &&
        session['warden.user.user.key'][0] &&
        session['warden.user.user.key'][0][0] &&
        current_user = User.find_by(id: session['warden.user.user.key'][0][0])
          p "Current User: " + current_user.inspect
          current_user
        else
          reject_unauthorized_connection
        end
      end
  end
end
