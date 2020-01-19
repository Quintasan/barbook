# frozen_string_literal: true

namespace :cocktails do
  desc "TODO"
  task recreate_derivatives: :environment do
    Cocktail.find_each do |cocktail|
      attacher = cocktail.image_attacher

      next unless attacher.stored?

      old_derivatives = attacher.derivatives

      attacher.set_derivatives({})                    # clear derivatives
      attacher.create_derivatives                     # reprocess derivatives

      begin
        attacher.atomic_persist                       # persist changes if attachment has not changed in the meantime
        attacher.delete_derivatives(old_derivatives)  # delete old derivatives
      rescue Shrine::AttachmentChanged,               # attachment has changed
             ActiveRecord::RecordNotFound             # record has been deleted
        attacher.delete_derivatives                   # delete now orphaned derivatives
      end
    end
  end
end
