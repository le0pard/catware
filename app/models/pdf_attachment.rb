class PdfAttachment < ActiveRecord::Base
  
  has_attached_file :pdf
  
end
