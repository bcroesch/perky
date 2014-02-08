Account
  name:string
  stripe_customer_token:string

Users
  superuser:boolean (can add/remove perk catalog)
  admin:integer (can add employees, assign credits)
  monthly_credits:integer
  account:references
  adhoc_credits:integer

Perks
  name:string
  credits:integer
  description:text
  image

PerkSelections (user's selected recurring perks)
  user:references
  perk:references


Purchase
  type:string (onetime|recurring)
  perk:references
  user:references
  credits:integer




Superuser:
  -can CRUD Perks

Admin:
  -account creator is automatically made an admin
  -can CRUD users in their account
  -can assign credits to users on their account
  -can assign admins

Any User:
  -can CRUD their own PerkSelections, up to their monthly_credits limit
  -can CRUD one time perk purchase

Guest:
  -Sign up for account (user accepts_nested_resources_for :account - name, stripe cc info)



-Homejoy
-Netflix
-Uber
-Spotify
-Dry cleaning?
-Peapod
-Mass transit cards
-Gym membership
-Grubhub

-Starbucks
-iTunes gift card
-Amazon
-Chipotle


