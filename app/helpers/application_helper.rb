module ApplicationHelper
  def stripe_js_tag
    javascript_include_tag(Rails.env.test? ? "stripe.js" : "https://js.stripe.com/v1/")
  end
end
