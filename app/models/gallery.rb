class Gallery < ActiveRecord::Base
    mount_uploaders :avatars, AvatarUploader
end
