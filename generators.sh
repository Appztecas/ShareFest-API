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

mix phx.gen.json Party Event events \
    name:string \
    description:string \
    start_date:date \
    address:string \
    latitude:string \
    longitude:string \
    invitation_uri:string \
    user:references:users
