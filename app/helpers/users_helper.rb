module UsersHelper
  def image_for(user , options = { size: 50 })
     if user.image?
       image_tag user.image.url if user.image?
     else
       image_tag "s_samp.jpg"
     end
  end
  def br(text)
   text = h text
   text.gsub(/\r\n|\r|\n/, "
   ").html_safe
  end
end
