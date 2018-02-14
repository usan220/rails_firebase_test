Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '179349701342-f8i7vulj5823qm9pbho25trtu5e6rmn0.apps.googleusercontent.com', '2AlBTs7AH8YTLPAf1M2iQtYx'
end