# frozen_string_literal: true

module CocktailsHelper
  def signature_badge_class(cocktail)
    cocktail.signature ? "badge badge-primary" : "badge badge-secondary"
  end

  def signature_label(cocktail)
    cocktail.signature ? t(".signature") : t(".not_signature")
  end
end
