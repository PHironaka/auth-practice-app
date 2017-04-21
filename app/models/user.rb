class User < ActiveRecord::Base
    # make sure we invoke bcrypt to hash passwords when adding new users:
    has_secure_password
end
