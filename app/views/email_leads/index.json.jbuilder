json.array!(@email_leads) do |email_lead|
  json.extract! email_lead, :id, :email, :company_name, :company_size
  json.url email_lead_url(email_lead, format: :json)
end
