module ChatsHelper

  def show_small_avatar(user)
    if user.avatar.attached?
      image_tag url_for(user.avatar.variant(:small_thumb)), class: "rounded-full border-2 border-black"
    else
      image_tag 'default_avatar.webp', size: '50x50', class: "rounded-full border-2 border-black"
    end
  end
end
