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
    business_activity:references:business_activities \
    enabled:boolean

mix phx.gen.json People BusinessActivity business_activities \
    name:string

# Wishlist

mix phx.gen.json Party Gift gifts \
    name:string \
    descripton:string \
    amazon_id:string \
    status:string \
    event:references:events \
    buyer:references:users

# Amazon categories

mix phx.gen.json Catalogue Category categories \
    name:string \
    external_id:string \
    uri_image:string

# Experiences
mix phx.gen.json Catalogue Experience experiences \
    name:string \
    description:string \
    uri_image:string \
    status:boolean \

mix phx.gen.json Catalogue Experience_Product experience_products \
    name:string \
    description:string \
    uri_image:string \
    price:float \
    experience:references:experiences

mix phx.gen.json Catalogue Product_Item product_item \
    code:string \
    status:string \
    experience_product:references:experience_products \
    event:references:events


# Guests
mix phx.gen.json Party Guest guests \
    user:references:users \
    event:references:events \
    email:string \
    phone:string \
    status:string
