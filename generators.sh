# Users
mix phx.gen.json People User users \
    name:string \
    lastname:string \
    phone:string \
    email:string \
    password:string \
    device_token:string \
    facebook_id:string \
    facebook_token:string \
    amazon_id:string \
    amazon_token:string \
    receive_notifications:boolean

# Events
mix phx.gen.json Party Event events \
    name:string \
    description:string \
    start_date:date \
    address:string \
    latitude:string \
    longitude:string \
    invitation_uri:string \
    user:references:users

# Suppliers

mix phx.gen.json People Supplier suppliers \
    name:string \
    description:string \
    area_of_service:string \
    photo:string \
    email:string \
    phone:string \
    social_account \
    logo:string \
    business_activity:references:business_activities

mix phx.gen.json People BusinessActivity business_activities \
    name:string


